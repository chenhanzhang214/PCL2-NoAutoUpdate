# PCL2 关闭自动更新版本

本版本为第三方基于 PCL 独立二次创作，原作者为龙腾猫跃。
原作者赞助：https://meloong.com/afd/a/LTCat

## 来源与修改

- 上游：https://github.com/Meloong-Git/PCL
- 基线提交：`6b9a50df911c9d68b69b24c979efba477fb14b67`（公开源码版本 `2.99.0.0`）
- 本项目：https://github.com/chenhanzhang214/PCL2-NoAutoUpdate
- 首次发布标签：`pcl2-2.99.0-no-autoupdate.1`

上游公开源码的更新替换函数已经是空实现，联网通知加载器也仅输出日志。本分支不声称从完整官方版本移除了更新器，而是在公开源码基础上进一步固定关闭更新设置、取消联网更新加载与退出更新调用、禁用界面入口，并在应用初始化前拒绝所有包含 `--update` 参数的命令。

新建或重置设置时，启动器更新选项默认为关闭。每次正常启动也会覆盖同目录旧配置中的该选项。注册表使用独立的 `PCLNoAutoUpdate` 命名空间；从官方版或其他源码版迁移时，需要重新设置部分偏好与登录信息。Minecraft、Java、Mod 等资源的正常下载不属于启动器自更新，仍保留。

## 下载与运行

在本项目 Releases 下载 `PCL2-NoAutoUpdate.zip`，解压后运行 `PCL2-NoAutoUpdate.exe`，也可以直接下载该 EXE。运行需要 64 位 Windows 与 .NET Framework 4.8；本版本没有安装器。发布同时提供 SHA-256 校验文件。

更新本版本需要手动下载新发布包并替换程序。不要将上游树内保留的 `最新正式版.zip` 当作本分支构建产物；它是上游官方版本归档，关闭自动更新版本只在本项目 Releases 提供。

本版本继承公开源码的限制：正版登录需要自行申请并设置环境变量 `PCL_MS_CLIENT_ID`，CurseForge API 调用需要 `PCL_CURSEFORGE_API_KEY`。不会提供、复用或打包官方私有凭据。主题维持上游蓝色，保留正版购买与赞助劝导。

## 编译与验证

使用 Visual Studio Build Tools（.NET 桌面开发，含 .NET Framework 4.8 开发工具）和支持 C# 13 的 .NET SDK。克隆时包含固定提交的 MeloongCore 子模块：

```powershell
git clone --recurse-submodules -b no-auto-update https://github.com/chenhanzhang214/PCL2-NoAutoUpdate.git
cd PCL2-NoAutoUpdate
dotnet restore PCLCS/PCLCS.csproj
msbuild "Plain Craft Launcher 2/Plain Craft Launcher 2.vbproj" -p:Configuration=Release
./tests/Test-NoAutoUpdate.ps1 -Executable './Plain Craft Launcher 2/obj/Release/Plain Craft Launcher 2.exe'
```

验证脚本运行真实编译产物，检查完整、缺失、无效与非首位更新参数均在 15 秒内返回失败代码 1，不修改用于验证的文件，也不在测试工作目录生成配置或更新文件。此验证不代表已测试所有 Minecraft 启动、账号登录或资源下载功能。

## 许可

保留上游 `LICENCE` 原文及其所链接的《PCL 分发有限许可》。原作者及其他贡献者的署名与赞助链接继续保留。本 Fork 的问题请在本 Fork 反馈。
