# PCL2 2.14.0 旧版关闭自动更新版本

这是由第三方基于 [PCL 官方 2.14.0.0 旧版公开源码](https://github.com/Meloong-Git/PCL/tree/5ef81e490ae46b1100d61e33d0183094c7a80ca8) 独立修改的版本，不是官方发布。保留旧版 Minecraft 下载流程，并固定关闭启动器自动更新。原作者：**龙腾猫跃**，可通过[原作者赞助链接](https://meloong.com/afd/a/LTCat)支持原项目。

**[下载本版本](https://github.com/chenhanzhang214/PCL2-NoAutoUpdate/releases/latest)** · [修改与使用说明](NO_AUTO_UPDATE.md) · [构建及验证](https://github.com/chenhanzhang214/PCL2-NoAutoUpdate/actions)

- 固定关闭启动器自动更新，禁用设置页和关于页的更新入口；旧的 `--update` 命令会直接以失败状态退出，不替换文件。
- 窗口标题、版本信息、文件属性和关于页均标注“关闭自动更新版本”和第三方身份。
- 官方公开源码本身不包含完整更新器。本分支在该基础上禁用残留入口，不包含从官方二进制提取的更新代码。
- 基于加入游戏下载限制前的最后一个官方正式版 `2.14.0.0`；原版游戏与整合包安装代码保持该版本的实现。先前的 `2.99.0` 发布基于带下载限制的新版，不适用于需要游戏下载的用户。
- 保留公开源码的限制：正版登录需自行提供 `PCL_MS_CLIENT_ID`，CurseForge API 调用需 `PCL_CURSEFORGE_API_KEY`。发布包不含官方私有密钥。
- 保留原项目 [LICENCE](LICENCE)、作者署名、赞助链接和蓝色主题。请在本 Fork 反馈问题。

以下保留上游项目说明。

## Plain Craft Launcher（上游）

[![Stars](https://img.shields.io/github/stars/Meloong-Git/PCL?style=flat&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEiIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiI+PHBhdGggZD0iTTggLjI1YS43NS43NSAwIDAgMSAuNjczLjQxOGwxLjg4MiAzLjgxNSA0LjIxLjYxMmEuNzUuNzUgMCAwIDEgLjQxNiAxLjI3OWwtMy4wNDYgMi45Ny43MTkgNC4xOTJhLjc1MS43NTEgMCAwIDEtMS4wODguNzkxTDggMTIuMzQ3bC0zLjc2NiAxLjk4YS43NS43NSAwIDAgMS0xLjA4OC0uNzlsLjcyLTQuMTk0TC44MTggNi4zNzRhLjc1Ljc1IDAgMCAxIC40MTYtMS4yOGw0LjIxLS42MTFMNy4zMjcuNjY4QS43NS43NSAwIDAgMSA4IC4yNVoiIGZpbGw9IiNlYWM1NGYiLz48L3N2Zz4=&logoSize=auto&label=Stars&labelColor=444444&color=eac54f)](https://github.com/Meloong-Git/PCL/)
[![Issues](https://img.shields.io/github/issues/Meloong-Git/PCL?style=flat&label=Issues&labelColor=444444&color=1F883D)](https://github.com/Meloong-Git/PCL/issues)
[![哔哩哔哩](https://img.shields.io/badge/动态-BiliBili-00A4DB?style=flat&labelColor=444444&logoSize=auto)](https://space.bilibili.com/11343203/dynamic)
[![爱发电](https://img.shields.io/badge/赞助-爱发电-946ce6?style=flat&labelColor=444444&logoSize=auto)](https://meloong.com/afd/a/LTCat)

包含 PCL 的大部分源代码，包括 UI 库、动画模块、下载模块、Minecraft 启动模块等！<br/>
代码并不是实时更新的，它会在每次 PCL 发布更新时同步一次。<br/>
非常感谢社区的大力支持！

<br/>

### 相关资源
- [PCL 下载](https://meloong.com/pcl)：下载可免费使用的正式版 PCL！
- [PCL 功能投票](https://github.com/Meloong-Git/PCL/discussions/2)：来参加投票吧，开发者会优先处理票数较高的项目！
- [帮助文档库](https://github.com/LTCatt/PCL2Help)：PCL 内置帮助文档的存储库
