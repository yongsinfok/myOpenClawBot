#!/bin/bash
# Claude Code + Z.ai GLM-4.7 自动配置脚本

set -e

echo "========================================"
echo "  Claude Code + Z.ai 配置"
echo "========================================"
echo ""

# 安装Coding Tool Helper
echo "📦 安装Coding Tool Helper..."
npm install -g @z_ai/coding-helper

# 配置Z.ai GLM-4.7
echo "🔧 配置Z.ai GLM-4.7..."

# 获取Z.ai API Key（从参数传入）
API_KEY="${ZAI_API_KEY:-}"

if [ -z "$API_KEY" ]; then
    echo "❌ 错误：请提供Z.ai API Key"
    echo ""
    echo "用法：$0 ZAI_API_KEY=your_api_key $0"
    exit 1
fi

# 创建配置目录
CONFIG_DIR="$HOME/.claude"
mkdir -p "$CONFIG_DIR"

# 配置settings.json
cat > "$CONFIG_DIR/settings.json" <<EOF
{
  "models": {
    "default": "glm-4.5-air",
    "providers": {
      "zai": {
        "apiKey": "$API_KEY",
        "baseURL": "https://open.bigmodel.cn/api/paas/v4/chat/completions"
      }
    }
  }
}
EOF

echo "✅ 配置已写入：$CONFIG_DIR/settings.json"
echo ""
echo "========================================"
echo "  配置内容"
echo "========================================"
cat "$CONFIG_DIR/settings.json"
echo ""
echo "========================================"
echo "  下一步"
echo "========================================"
echo "1. 在Windows上拉取最新代码"
echo "2. 启动Claude Code验证配置"
echo ""
echo "验证命令："
echo "  claude /status"
echo ""
echo "应该显示：Default model: glm-4.5-air"
