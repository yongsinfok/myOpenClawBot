# Claude Code + Z.ai GLM-4.7 配置指南

## 说明

这个脚本会自动配置Claude Code使用Z.ai的GLM-4.7模型。

## 快速开始

### 第一步：获取Z.ai API Key

1. 访问：https://open.bigmodel.cn/
2. 注册/登录账号
3. 获取API Key

### 第二步：运行配置脚本

```bash
# 在Codespace中运行
ZAI_API_KEY=your_api_key_here bash claude-zai-config.sh
```

### 第三步：推送到GitHub

```bash
git add .
git commit -m "配置Claude Code使用Z.ai GLM-4.7"
git push
```

### 第四步：在Windows上拉取并使用

```powershell
# 在Windows PowerShell中运行
cd C:\Users\joshua\Desktop\vibe\myOpenClawBot
git pull

# 启动Claude Code验证
claude

# 查看状态
/status
```

## 验证配置

启动Claude Code后，运行：

```bash
/status
```

应该显示：
```
Default model: glm-4.5-air
```

## 注意事项

1. **API Key安全**：不要在公开代码中硬编码API Key
2. **配置文件**：会写入 `~/.claude/settings.json`
3. **模型名称**：Z.ai GLM-4.7-Air 是官方名称
4. **Base URL**：`https://open.bigmodel.cn/api/paas/v4/chat/completions`

## 故障排除

### 问题：配置不生效

**解决方法**：
1. 关闭所有Claude Code窗口
2. 删除 `C:\Users\joshua\.claude\settings.json`
3. 重新运行 `claude` 验证配置

### 问题：显示其他模型

**原因**：可能还有其他配置覆盖了

**解决方法**：
```powershell
# 使用命令行设置
claude config set models.default glm-4.5-air
```

## 手动配置方法

如果脚本不工作，可以手动配置：

```json
// C:\Users\joshua\.claude\settings.json
{
  "models": {
    "default": "glm-4.5-air",
    "providers": {
      "zai": {
        "apiKey": "YOUR_ZAI_API_KEY",
        "baseURL": "https://open.bigmodel.cn/api/paas/v4/chat/completions"
      }
    }
  }
}
```

## 完成

配置完成后，您就可以在Windows上使用Claude Code了！

---

**需要帮助？** 随时告诉小艾！😊
