param([Parameter(Mandatory)][string]$Executable)
$ErrorActionPreference = 'Stop'
$exe = (Resolve-Path -LiteralPath $Executable).Path
$testDir = Join-Path (Split-Path $exe) ('update-smoke-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $testDir | Out-Null
$oldFile = Join-Path $testDir 'old.txt'
$newFile = Join-Path $testDir 'new.txt'
Set-Content -LiteralPath $oldFile -Value 'original launcher'
Set-Content -LiteralPath $newFile -Value 'replacement launcher'
$expectedOld = (Get-FileHash -LiteralPath $oldFile).Hash
$expectedNew = (Get-FileHash -LiteralPath $newFile).Hash
$cases = @(
    @{ Name='complete legacy update command'; Args=@('--update', '0', $oldFile, $newFile, 'False') },
    @{ Name='missing update arguments'; Args=@('--update') },
    @{ Name='invalid update arguments'; Args=@('--update', 'invalid') },
    @{ Name='update argument after another flag'; Args=@('--unused', '--update') }
)
foreach ($case in $cases) {
    $process = Start-Process -FilePath $exe -ArgumentList $case.Args -WorkingDirectory $testDir -WindowStyle Hidden -PassThru
    if (-not $process.WaitForExit(15000)) {
        $process.Kill()
        throw "$($case.Name): process did not reject the update command within 15 seconds."
    }
    if ($process.ExitCode -ne 1) { throw "$($case.Name): expected exit code 1, got $($process.ExitCode)." }
    if ((Get-FileHash -LiteralPath $oldFile).Hash -ne $expectedOld) { throw 'Original file changed.' }
    if ((Get-FileHash -LiteralPath $newFile).Hash -ne $expectedNew) { throw 'Replacement file changed.' }
    $unexpected = @(Get-ChildItem -LiteralPath $testDir -Force | Where-Object Name -notin @('old.txt', 'new.txt'))
    if ($unexpected.Count) { throw 'Update command created files or directories before exiting.' }
    Write-Output "PASS: $($case.Name); exit=1; files unchanged."
}
