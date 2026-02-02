# Claude Code + Z.ai GLM-4.7 安装配置指南

## 在Windows电脑上的操作步骤

### 第一步：安装Claude Code

打开PowerShell（管理员），运行：

```powershell
npm install -g @anthropic-ai/claude-code
```

### 第二步：安装Coding Tool Helper

```powershell
npm install -g @z_ai/coding-helper
```

### 第三步：运行Coding Tool Helper配置向导

```powershell
npx @z_ai/coding-helper init
```

**操作说明：**
1. 选择语言：使用方向键选择 `[CN] 中文`
2. 选择Plan：选择 `[China] GLM Coding Plan China`
3. 输入API Key：粘贴您的Z.ai API Key：`2f2e7df16b92466da0500103406bec95.qPhJ07u5Mgvghag3`
4. 确认配置

**注意**：如果界面卡住，可以按`x`退出，然后手动编辑配置文件。

### 第四步：验证配置

启动Claude Code：

```powershell
claude
```

查看当前状态：

```
/status
```

应该显示：
- Default model: glm-4.5-air

## 手动配置方式（如果向导失败）

### 方法1：直接编辑配置文件

1. 打开文件夹：
   ```
   C:\Users\joshua\.claude\
   ```

2. 创建或编辑 `settings.json` 文件

3. 添加以下内容：

```json
{
  "models": {
    "default": "glm-4.5-air",
    "providers": {
      "zai": {
        "apiKey": "2f2e7df16b92466da0500103406bec95.qPhJ07u5Mgvghag3",
        "baseURL": "https://open.bigmodel.cn/api/paas/v4/chat/completions"
      }
    }
  }
}
```

4. 保存文件

5. 启动Claude Code验证：

```powershell
claude
```

### 方法2：使用命令行配置

```powershell
# 设置默认模型
claude config set models.default glm-4.5-air

# 添加Z.ai提供商
claude config set models.providers.zai.apiKey "2f2e7df16b92466da0500103406bec95.qPhJ07u5Mgvghag3"
claude config set models.providers.zai.baseURL "https://open.bigmodel.cn/api/paas/v4/chat/completions"
```

## 验证配置

运行以下命令验证：

```powershell
# 查看状态
claude /status

# 或者查看所有模型
/models
```

## 快速使用

```powershell
# 进入项目
cd your-project

# 启动Claude Code
claude

# 示例命令
> 解释这个项目
> 添加一个hello world函数
> 编写单元测试
```

## 常见问题

### Q: 如何查看当前使用的模型？

A: 运行 `claude /status`

### Q: 如何切换模型？

A:
```powershell
# 切换到GLM-4.5-Air
claude config set models.default glm-4.5-air

# 切换回默认模型
claude config set models.default claude-sonnet-4-5-20250929
```

### Q: 向导界面卡住怎么办？

A:
1. 按 `x` 退出
2. 使用手动配置方式（见上方）

### Q: API Key不生效？

A:
1. 关闭所有Claude Code窗口
2. 删除 `C:\Users\joshua\.claude\settings.json`
3. 重新运行 `npx @z_ai/coding-helper init`
4. 或使用命令行配置方式

## 成功后

配置成功后，您就可以：
- ✅ 使用GLM-4.7模型进行AI编程
- ✅ 在终端中直接编写代码
- ✅ 调试和修复问题
- ✅ 导航代码库
- ✅ 自动化繁琐任务

## 完成后

配置完成后，告诉小艾，小艾可以帮您：
- 编写代码
- 调试问题
- 创建Git提交
- 测试功能

---

**需要帮助？** 联系小艾！😊
