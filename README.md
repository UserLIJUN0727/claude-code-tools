# Claude Code Tools

Claude Code 配置、工具和脚本集合

## 📁 工具脚本

### cleanup-sessions.sh
会话清理脚本，用于清理旧的Claude Code会话文件

**用法：**
```bash
bash cleanup-sessions.sh [保留天数]

# 示例：保留最近7天的会话
bash cleanup-sessions.sh 7
```

### check-config.sh
配置检查脚本，一键检查Claude Code配置状态

**用法：**
```bash
bash check-config.sh
```

**检查内容：**
- Claude CLI 版本
- 配置文件状态
- 记忆文件数量
- 会话文件统计
- API 配置信息

## 🔧 配置说明

### 环境要求
- Windows 11
- Git
- Claude Code CLI

### 使用方法
1. 克隆仓库到本地
2. 运行脚本进行配置检查或清理

```bash
git clone git@github.com:UserLIJUN0727/claude-code-tools.git
cd claude-code-tools
bash check-config.sh
```

## 📝 更新日志

### 2026-06-30
- 初始化仓库
- 添加 cleanup-sessions.sh 会话清理脚本
- 添加 check-config.sh 配置检查脚本

## 📄 License

MIT License
