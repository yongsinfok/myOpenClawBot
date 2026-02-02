---
name: claude-code
description: Claude Code AI编程助手 - 理解和使用Claude Code的完整指南
---

# Claude Code AI编程助手

Claude Code是Anthropic的AI编程助手，可以在终端中直接编写代码、调试、探索代码库、自动化任务。

## 核心概念

### Claude Code是什么？

Claude Code是一个**智能代码代理**，与传统聊天机器人不同：
- ✅ 可以**直接编辑文件**
- ✅ 可以**运行命令**
- ✅ 可以**创建Git提交**
- ✅ 可以**自主工作**，解决复杂问题
- ✅ 拥有**完整的代码库感知**

### 为什么开发者喜欢Claude Code？

1. **在终端中工作** - 不是聊天窗口，不是IDE，就在您每天工作的地方
2. **可以执行操作** - 直接编辑、运行命令、创建提交
3. **Unix哲学** - 可组合、可脚本化
   ```bash
   tail -f app.log | claude -p "如果看到异常就Slack通知我"
   ```
4. **企业级安全** - 内置安全、隐私和合规性

## 快速开始

### 安装Claude Code

#### macOS/Linux/WSL
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

#### Windows PowerShell
```powershell
irm https://claude.ai/install.ps1 | iex
```

#### Windows CMD
```cmd
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

#### Homebrew (macOS)
```bash
brew install --cask claude-code
```

#### WinGet (Windows)
```powershell
winget install Anthropic.ClaudeCode
```

### 开始使用

```bash
cd your-project
claude
```

首次使用时会提示登录。

### 账户类型

- **Claude Pro/Max/Teams/Enterprise** - 推荐
- **Claude Console** - API访问（使用预付费额度）
- **云提供商** - Amazon Bedrock、Google Vertex AI、Microsoft Foundry

## 基本命令

### 日常使用命令

| 命令 | 说明 | 示例 |
|--------|------|--------|
| `claude` | 启动交互模式 | `claude` |
| `claude "query"` | 运行一次性任务 | `claude "修复构建错误"` |
| `claude -p "query"` | 运行单次查询，然后退出 | `claude -p "解释这个函数"` |
| `claude -c` | 继续当前目录最近的对话 | `claude -c` |
| `claude -r` | 恢复之前的对话 | `claude -r` |
| `claude commit` | 创建Git提交 | `claude commit` |
| `/clear` | 清除对话历史 | `/clear` |
| `/help` | 显示可用命令 | `/help` |
| `exit` 或 `Ctrl+C` | 退出 | `exit` |

### 常用CLI标志

#### 模型相关
```bash
# 设置模型（sonnet或opus）
claude --model claude-sonnet-4-5-20250929

# 设置回退模型（print模式）
claude -p --fallback-model sonnet "query"
```

#### 权限模式
```bash
# Plan模式（只读，安全）
claude --permission-mode plan

# Auto-Accept模式（自动接受编辑）
claude --permission-mode auto

# 跳过所有权限提示（危险模式，谨慎使用）
claude --dangerously-skip-permissions
```

#### 工具限制
```bash
# 限制可用的工具
claude --tools "Bash,Edit,Read"

# 禁用所有工具
claude --tools ""
```

#### 系统提示自定义
```bash
# 替换整个系统提示
claude --system-prompt "你是一个Python专家"

# 追加到默认提示（推荐）
claude --append-system-prompt "总是使用TypeScript"

# 从文件加载提示
claude --append-system-prompt-file ./rules.txt "query"
```

#### 目录控制
```bash
# 添加额外的工作目录
claude --add-dir ../apps ../lib
```

#### 输出格式
```bash
# JSON输出
claude -p "query" --output-format json

# 流式JSON（用于脚本）
claude -p "query" --output-format stream-json

# 包含部分消息
claude -p "query" --output-format stream-json --include-partial-messages
```

## 核心功能

### 1. 构建功能
**描述你想要的功能**，Claude会：
- 制定计划
- 编写代码
- 确保代码工作

**示例**：
```
添加一个hello world函数到main文件
```

Claude会：
- 找到合适的文件
- 显示建议的更改
- 请求批准
- 进行编辑

### 2. 调试和修复问题
**描述bug或粘贴错误信息**，Claude会：
- 分析代码库
- 识别问题
- 实现修复

**示例**：
```
用户报告会话超时后登录失败。检查auth流程，特别是token刷新。编写一个失败的测试来重现问题，然后修复它
```

### 3. 导航代码库
**询问任何关于团队代码库的问题**：
```
这个项目做什么？
使用了什么技术？
main入口点在哪里？
解释文件夹结构
```

### 4. 自动化繁琐任务
- 修复fiddly的lint问题
- 解决合并冲突
- 编写发布说明
- **单命令完成多个任务**

## 最佳实践

### 1. 给Claude验证方式

**Claude表现 dramatically更好**当它可以验证自己的工作：
- 运行测试
- 比较截图
- 验证输出

**示例**：
```
实现一个验证邮箱地址的函数。示例测试用例：[email protected]为true，invalid为false，[email protected]为false。实现后运行测试
```

**验证方法**：
- 测试套件
- Linter
- Bash命令检查输出
- 使用Chrome扩展进行UI验证

### 2. 先探索，再计划，然后编码

**推荐的四个阶段**：

1. **探索** - 了解代码库
2. **计划** - 创建详细计划
3. **编码** - 实现功能
4. **验证** - 测试和确认

### 3. 提供具体的上下文

**避免模糊的提示**，提供具体信息：

**差的提示**：
```
添加日历小部件
```

**好的提示**：
```
查看主页上小部件是如何实现的。HotDogWidget.php是一个很好的例子。遵循这个模式来实现一个新的日历小部件，允许用户选择月份并分页前进/后退来选择年份。不使用已经使用的库以外的其他库。
```

### 4. 编写有效的CLAUDE.md

**CLAUDE.md是特殊文件**，Claude在每次对话开始时读取它。

**包含内容**：
- ✅ Bash命令
- ✅ 代码风格
- ✅ 工作流规则
- ❌ 不是冗长的教程

**示例**：
```markdown
# 代码风格
- 使用ES模块语法
- 尽可能使用解构导入

# 工作流
- 完成一系列代码更改后，确保进行类型检查
- 优先运行单个测试，而不是整个测试套件

# 参考
@README.md 查看项目概述
@package.json 查看可用的npm命令
```

**放置位置**：
- `~/.claude/CLAUDE.md` - 应用于所有会话
- `./CLAUDE.md` - 项目根目录，可以提交到git
- `./CLAUDE.local.md` - 私有，应该.gitignore
- 父/子目录 - Monorepo结构

### 5. 配置权限

**减少权限提示**：
```bash
# 允许特定工具
claude --allowed-tools "Bash(git log *)", "Bash(git diff *)", "Read"

# 启用沙箱（OS级隔离）
claude --permission-mode sandbox
```

### 6. 使用CLI工具

**安装gh CLI用于GitHub操作**：
```bash
# macOS
brew install gh

# Windows
winget install GitHub.cli
```

Claude知道如何使用gh CLI进行：
- 创建issues
- 打开PRs
- 读取评论

### 7. 连接MCP服务器

**MCP（Model Context Protocol）**让Claude连接到外部工具：
- 问题跟踪器（Jira、GitHub Issues）
- 数据库（PostgreSQL、MySQL）
- 设计工具（Figma）
- 通讯工具（Slack、Google Drive）

**添加MCP服务器**：
```bash
# HTTP服务器
claude mcp add --transport http notion https://mcp.notion.com/mcp

# SSE服务器
claude mcp add --transport sse asana https://mcp.asana.com/sse

# Stdio服务器（本地）
claude mcp add --transport stdio db -- npx -y @bytebase/dbhub \
  --dsn "postgresql://readonly:password@host:5432/analytics"
```

### 8. 创建自定义Skills

**Skills扩展Claude的知识**，特定于项目、团队或领域。

**Skill结构**：
```markdown
.claude/skills/my-skill/SKILL.md
---
name: api-conventions
description: REST API设计约定
---

# API约定
- 使用kebab-case作为URL路径
- 使用camelCase作为JSON属性
- 始终为列表端点包含分页
- 在URL路径中版本化API（/v1/、/v2/）
```

### 9. 管理会话

**使用/rewind和checkpoint**：
- 双击Escape或运行`/rewind`打开checkpoint菜单
- 恢复仅对话（保留代码）
- 恢复仅代码（保留对话）
- 恢复两者
- Checkpoints跨会话持久化

**命名会话**：
```bash
/rename oauth-migration
/rename debugging-memory-leak
```

**在任务之间使用/clear**：
- 长会话中不相关的上下文会降低性能
- 使用/clear在不相关的任务之间重置上下文

### 10. 使用Subagents

**Subagents在独立的上下文中运行**，不会使主对话混乱：

**示例**：
```bash
claude --agents '{
  "code-reviewer": {
    "description": "高级代码审查器。代码更改后主动使用。",
    "prompt": "你是一个高级代码审查员。专注于代码质量、安全和最佳实践。",
    "tools": ["Read", "Grep", "Glob", "Bash"],
    "model": "sonnet"
  }
}'
```

**调用**：
```
使用subagent审查这段代码的安全问题
```

### 11. 使用Plan Mode

**Plan Mode让Claude**在只读分析代码：
- 创建详细计划
- 完美安全地进行代码分析
- 通过AskUserQuestion工具收集需求

**启用**：
```bash
# 开始时
claude --permission-mode plan

# 会话中切换
Shift+Tab（循环：auto -> plan）
```

**何时使用**：
- 多步实现
- 代码库探索
- 交互式开发

## 常见工作流

### 理解新代码库

**快速了解项目**：
```
这个项目做什么？
技术栈是什么？
项目结构如何？
主要的架构决策是什么？
```

### 修复Bug

**高效的bug修复工作流**：
```
查看git历史中的认证流程并总结其API是如何来的
```

### 重构代码

**现代化代码模式**：
```
重构认证模块，使用async/await而不是callback
```

### 编写测试

**生成测试用例**：
```
为calculator函数编写单元测试
```

### 创建Pull Requests

**使用GitHub CLI**：
```
为我的更改创建一个描述性的提交消息
显示我最后5次提交
帮助我解决合并冲突
```

### 使用Git

**Git操作**：
```
我改变了哪些文件？
查看最后提交
创建一个名为feature/quickstart的新分支
解决合并冲突
```

### 处理图像

**与图像交互**：
```
[粘贴截图] 实现这个设计。对结果截图并与原始比较。列出差异并修复它们
```

### 与MCP服务器交互

**使用外部工具**：
```
在Slack中发布Jira ticket ENG-4521的PR链接
查询PostgreSQL数据库以查找过去30天使用功能ENG-4521的用户
```

## 高级功能

### Chrome扩展

**浏览器自动化和测试**：
```bash
claude --chrome
```

- 实时调试
- 设计验证
- Web应用测试

### Web会话

**在浏览器中使用Claude Code**：
- 访问https://claude.ai/code
- 运行并行会话
- 没有本地设置

### 桌面应用

**独立应用程序**：
- Diff查看
- 通过git worktrees的并行会话
- 可以启动云会话

### VS Code扩展

**原生扩展**：
- 内联diffs
- @mentions
- 计划审查

### JetBrains IDEs插件

**支持IntelliJ IDEA、PyCharm、WebStorm等**

### GitHub Actions集成

**CI/CD自动化**：
- 代码审查
- Issue分类
- 工作流自动化

### Slack集成

**在Slack中@Claude**路由编码任务到Claude Code on the web

## 权限系统

### 默认权限模式

**三种模式**：

1. **Plan模式** ⏸ - 只读操作
2. **Normal模式** - 请求权限进行危险操作
3. **Auto-Accept模式** ⏵ - 自动接受编辑

### Allowlist（允许列表）

**允许特定工具而不提示**：
```bash
claude --allowed-tools "Bash(git log *)", "Bash(git diff *)", "Read"
```

### Denylist（拒绝列表）

**移除工具使其无法被使用**：
```bash
claude --disallowed-tools "Bash", "Edit"
```

## 上下文管理

### 理解上下文窗口

**Claude的上下文窗口**包含：
- 整个对话历史
- 每个文件读取
- 每个命令输出

**性能影响**：
- 上下文填充 → 性能降低
- 可能"忘记"早期指令
- 可能开始犯更多错误

### 减少Token使用

**策略**：
- 使用Plan Mode进行探索
- 使用subagents进行调查
- 提供具体、窄范围的提示
- 在任务之间使用/clear

### 自动压缩

**Claude Code自动压缩对话**当接近上下文限制时，保留重要代码和决策。

## 扩展Claude Code

### Skills（技能）

**在.claude/skills/目录中创建**：
```bash
.claude/skills/fix-issue/SKILL.md
---
name: fix-issue
description: 修复GitHub issue
---

分析并修复GitHub issue: $ARGUMENTS。

1. 使用`gh issue view`获取issue详情
2. 理解issue中描述的问题
3. 在代码库中搜索相关文件
4. 实现必要的更改以修复issue
5. 编写并运行测试以验证修复
6. 确保代码通过linting和类型检查
7. 创建描述性的提交消息
8. Push并创建PR
```

### Hooks（钩子）

**在特定点自动运行脚本**：
```bash
# 在每次文件编辑后运行eslint
编写一个在每次文件编辑后运行eslint的hook
```

### Plugins（插件）

**捆绑skills、hooks、subagents和MCP服务器**：
```bash
# 安装插件
claude plugins install my-plugin
```

### Subagents（子代理）

**运行在独立上下文中**：
```bash
.claude/agents/security-reviewer.md
---
name: security-reviewer
description: 审查代码的安全漏洞
tools: Read, Grep, Glob, Bash
model: opus
---

你是一个高级安全工程师。审查以下方面的代码：
- 注入漏洞（SQL、XSS、命令注入）
- 认证和授权缺陷
- 代码中的密钥或凭证
- 不安全的数据处理

提供具体的行引用和建议的修复。
```

## 成本管理

### 理解定价

**Claude Code使用**：
- Claude API调用
- 或云提供商（Bedrock、Vertex AI等）

**查看使用**：
```bash
claude models
claude usage
```

### 减少成本

**策略**：
- 使用Plan Mode避免不必要的API调用
- 提供具体的上下文
- 使用subagents而不是长会话
- 使用/clear重置上下文

## 故障排除

### 常见问题

**Claude Code无法启动**：
```bash
# 检查安装
claude --version

# 重新登录
/login

# 检查连接
openclaw health
```

**权限问题**：
```bash
# 查看当前权限模式
/permissions

# 跳过权限（谨慎使用）
claude --dangerously-skip-permissions
```

**MCP服务器无法连接**：
```bash
# 列出MCP服务器
/mcp

# 查看服务器详情
claude mcp get <server-name>

# 重新添加服务器
claude mcp remove <server-name>
claude mcp add <server-name> <url>
```

## 资源

### 官方文档

- **主要文档**: https://code.claude.com/docs/en/overview
- **快速开始**: https://code.claude.com/docs/en/quickstart
- **CLI参考**: https://code.claude.com/docs/en/cli-reference
- **最佳实践**: https://code.claude.com/docs/en/best-practices
- **常见工作流**: https://code.claude.com/docs/en/common-workflows
- **MCP**: https://code.claude.com/docs/en/mcp
- **安全**: https://code.claude.com/docs/en/security
- **隐私**: https://code.claude.com/docs/en/data-usage

### 社区

- **Discord**: https://www.anthropic.com/discord
- **GitHub**: https://github.com/anthropics/claude-code

### 常用网站

- **Claude**: https://claude.com
- **Claude Code**: https://claude.ai/code
- **Claude Console**: https://console.anthropic.com/

## 快速参考

### 基本使用流程

```bash
# 1. 进入项目目录
cd my-project

# 2. 启动Claude Code
claude

# 3. 询问问题
> 这个项目做什么？

# 4. 让Claude工作
> 添加一个登录页面

# 5. 验证
> 运行测试

# 6. Git提交
> 创建提交

# 7. 退出
exit
```

### 一行命令示例

```bash
# 快速查询
claude -p "解释这个函数"

# Plan模式
claude --permission-mode plan -p "分析认证系统"

# JSON输出
claude -p "列出所有API端点" --output-format json

# 继续对话
claude -c

# 查看帮助
/help
```

## 结论

Claude Code是一个强大的AI编程助手，通过理解其功能和最佳实践，可以大大提高开发效率。

**关键要点**：
- ✅ 从描述构建功能
- ✅ 调试和修复问题
- ✅ 导航任何代码库
- ✅ 自动化繁琐任务
- ✅ 使用CLAUDE.md自定义行为
- ✅ 使用MCP连接外部工具
- ✅ 创建skills和subagents扩展能力

**开始使用Claude Code**，让AI为您编写代码！
