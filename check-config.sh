#!/bin/bash
# Claude Code 配置检查脚本

echo "🔍 Claude Code 配置检查"
echo "======================"
echo ""

# 检查Claude CLI版本
echo "📦 版本信息:"
claude --version 2>/dev/null || echo "  ❌ Claude CLI 未安装"
echo ""

# 检查配置文件
echo "📁 配置文件:"
CONFIG_DIR="$HOME/.claude"
PROJECT_DIR="$CONFIG_DIR/projects/C--Users-73887"

if [ -f "$CONFIG_DIR/settings.json" ]; then
    echo "  ✅ settings.json 存在"
else
    echo "  ❌ settings.json 缺失"
fi

if [ -f "$CONFIG_DIR/settings.local.json" ]; then
    echo "  ✅ settings.local.json 存在"
else
    echo "  ⚠️  settings.local.json 缺失"
fi

if [ -f "$PROJECT_DIR/CLAUDE.md" ]; then
    echo "  ✅ CLAUDE.md 存在"
else
    echo "  ❌ CLAUDE.md 缺失"
fi
echo ""

# 检查记忆文件
echo "🧠 记忆文件:"
if [ -d "$PROJECT_DIR/memory" ]; then
    MEMORY_COUNT=$(ls -1 "$PROJECT_DIR/memory"/*.md 2>/dev/null | wc -l)
    echo "  ✅ memory 目录存在 ($MEMORY_COUNT 个文件)"
else
    echo "  ❌ memory 目录缺失"
fi
echo ""

# 检查会话文件
echo "💾 会话文件:"
SESSION_COUNT=$(ls -1 "$PROJECT_DIR"/*.jsonl 2>/dev/null | wc -l)
SESSION_SIZE=$(du -sh "$PROJECT_DIR"/*.jsonl 2>/dev/null | tail -1 | cut -f1)
echo "  📊 会话数量: $SESSION_COUNT"
echo "  📊 总大小: $SESSION_SIZE"
echo ""

# 检查权限配置
echo "🔐 权限配置:"
if [ -f "$CONFIG_DIR/settings.json" ]; then
    PERMISSIONS=$(cat "$CONFIG_DIR/settings.json" | grep -c "allow" 2>/dev/null || echo "0")
    echo "  📊 权限规则数: $PERMISSIONS"
fi
echo ""

# 检查API配置
echo "🌐 API配置:"
if [ -f "$CONFIG_DIR/settings.json" ]; then
    BASE_URL=$(cat "$CONFIG_DIR/settings.json" | grep "ANTHROPIC_BASE_URL" | cut -d'"' -f4)
    MODEL=$(cat "$CONFIG_DIR/settings.json" | grep "ANTHROPIC_MODEL" | cut -d'"' -f4)
    echo "  📊 API地址: $BASE_URL"
    echo "  📊 默认模型: $MODEL"
fi
echo ""

# 检查清理脚本
echo "🧹 清理脚本:"
if [ -f "$CONFIG_DIR/cleanup-sessions.sh" ]; then
    echo "  ✅ cleanup-sessions.sh 存在"
    echo "  💡 用法: bash ~/.claude/cleanup-sessions.sh 7"
else
    echo "  ⚠️  cleanup-sessions.sh 缺失"
fi
echo ""

echo "✅ 配置检查完成"
