# Claude Code + Z.ai GLM-4.7 集成指南

## 快速开始

### 安装Claude Code

#### Windows

打开PowerShell（管理员），运行：

```powershell
# 方式1：使用npm安装（推荐）
npm install -g @anthropic-ai/claude-code

# 方式2：使用官方安装脚本
irm https://claude.ai/install.ps1 | iex
```

#### macOS/Linux

```bash
# 使用npm安装
npm install -g @anthropic-ai/claude-code

# 或使用官方安装脚本
curl -fsSL https://claude.ai/install.sh | bash
```

---

## 配置Z.ai GLM模型

### 第一步：安装Coding Tool Helper

Coding Tool Helper是Z.ai官方提供的工具，用于配置GLM模型。

```bash
# 全局安装Coding Tool Helper
npm install -g @z_ai/coding-helper

# 或者使用npx（无需安装）
npx @z_ai/coding-helper init
```

### 第二步：配置GLM API Key

```bash
# 运行初始化向导
npx @z_ai/coding-helper init

# 按照提示操作：
# 1. 选择"GLM Coding Plan"
# 2. 输入您的Z.ai API Key
```

### 第三步：加载GLM配置到Claude Code

```bash
# Coding Tool Helper会自动配置Claude Code
# 配置完成后，启动Claude Code
claude
```

---

## 验证配置

### 查看当前模型状态

在Claude Code中运行：

```
/status
```

应该显示当前使用的模型信息。

### 配置文件位置

Claude Code的配置文件：
```
~/.claude/settings.json
```

手动编辑可以添加GLM配置：

```json
{
  "models": {
    "default": "glm-4.5-air",
    "providers": {
      "zai": {
        "apiKey": "您的API_KEY",
        "baseURL": "https://open.bigmodel.cn/api/paas/v4/"
      }
    }
  }
}
```

---

## 常见问题

### Q: Coding Tool Helper提示选择模型？

A: 选择"GLM Coding Plan"选项

### Q: 如何查看支持的GLM模型？

A: GLM-4.5-air, GLM-4.7, GLM-4.7-flash等

### Q: 配置不生效？

A: 
1. 关闭所有Claude Code窗口
2. 删除`~/.claude/settings.json`
3. 重新运行`npx @z_ai/coding-helper init`
4. 启动Claude Code

### Q: 如何切换模型？

A: 
方式1：在Claude Code中使用`/model`命令
方式2：编辑`~/.claude/settings.json`

---

## 快速参考

### 基本使用

```bash
# 启动Claude Code
claude

# 继续上次对话
claude -c

# 运行一次性查询
claude -p "解释这个函数"

# 列出所有模型
/models
```

### 项目使用

```bash
# 进入项目目录
cd your-project

# 启动Claude Code
claude

# 让Claude Code工作
> 帮我添加一个登录页面
> 解释这个代码
> 修复bug
```

---

## 下一步

配置完成后：

1. ✅ 启动Claude Code
2. ✅ 使用GLM-4.7模型进行开发
3. ✅ 体验强大的AI编程助手

## 需要帮助？

如果遇到问题，运行：

```bash
npx @z_ai/coding-helper doctor
```

或查看文档：
- Claude Code: https://code.claude.com/docs
- Z.ai: https://docs.z.ai
