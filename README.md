# Desktop Pet Demo Skill

一个从真实 Unity Windows 桌面宠物项目中提炼出的 Codex Skill，覆盖需求收敛、角色资产规格、状态机、点击/长按/拖动、透明置顶窗口、舒缓交互、本地存档、测试、作品集视频、发布打包和软著材料准备。

它适用于作品集级桌面宠物 Demo，而不是普通全屏 Unity 游戏，也不把舒缓体验描述为医疗产品。

## 安装

将整个 `desktop-pet-demo` 文件夹复制到 Codex Skills 目录：

```text
%USERPROFILE%\.codex\skills\desktop-pet-demo
```

重新打开 Codex 后，可以直接提出桌面宠物项目需求，或显式使用：

```text
$desktop-pet-demo 帮我规划并实现一个 Windows Unity 桌面宠物 Demo。
```

## 内容

- `SKILL.md`：工作方式、关键约束和完成标准。
- `references/production-workflow.md`：阶段安排、范围控制和协作分工。
- `references/unity-architecture.md`：Unity 模块、存档和 Win32 桌面模式。
- `references/art-animation-interaction.md`：角色资产、动画与交互验收。
- `references/qa-release-copyright.md`：自测、视频、打包与软著准备。
- `scripts/inspect_unity_project.ps1`：只读检查 Unity 项目结构。
- `scripts/package_unity_source.ps1`：生成不含缓存目录的 Unity 源码包。

## 来源与边界

本 Skill 总结自“豆包焦虑舒缓桌面陪伴软件”12 周作品集 Demo 的实际开发过程。项目中的特定角色设定、图片和个人申请材料没有放入 Skill，避免把单个项目的美术资产或个人信息变成通用模板。

软件著作权部分只提供准备流程，不构成法律意见；正式申请请核对当前官方规定。
