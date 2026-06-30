#!/bin/bash
# Claude Code 会话清理脚本
# 用法: bash ~/.claude/cleanup-sessions.sh [保留天数]

KEEP_DAYS=${1:-7}
SESSION_DIR="$HOME/.claude/projects/C--Users-73887"

echo "🧹 Claude Code 会话清理工具"
echo "=========================="
echo "保留最近 $KEEP_DAYS 天的会话文件"
echo ""

# 统计当前文件数和大小
BEFORE_COUNT=$(ls -1 "$SESSION_DIR"/*.jsonl 2>/dev/null | wc -l)
BEFORE_SIZE=$(du -sh "$SESSION_DIR"/*.jsonl 2>/dev/null | tail -1 | cut -f1)
echo "当前会话文件: $BEFORE_COUNT 个"
echo "当前总大小: $BEFORE_SIZE"
echo ""

# 删除旧文件
DELETED=0
for file in "$SESSION_DIR"/*.jsonl; do
    if [ -f "$file" ]; then
        # 检查文件修改时间
        if [ "$(find "$file" -mtime +$KEEP_DAYS)" ]; then
            rm -f "$file"
            ((DELETED++))
        fi
    fi
done

# 删除空目录
find "$SESSION_DIR" -type d -empty -delete 2>/dev/null

# 统计清理后
AFTER_COUNT=$(ls -1 "$SESSION_DIR"/*.jsonl 2>/dev/null | wc -l)
echo ""
echo "✅ 清理完成"
echo "删除文件: $DELETED 个"
echo "剩余文件: $AFTER_COUNT 个"

# 显示剩余文件
echo ""
echo "📁 保留的会话文件:"
ls -lh "$SESSION_DIR"/*.jsonl 2>/dev/null | awk '{print "  " $9 " (" $5 ")"}'
