# user_understanding 模块设计（画像/记忆）

## 1. 职责
- 维护用户长期画像（会话外行为 + 历史对话压缩）。
- 支持前端 mock 数据驱动的画像生成与个性化欢迎语。

## 2. 输入数据（当前阶段）
- 前端配置的 mock 行为数据：
  - 点击 / 加购 / 购买（最近 20 条）
  - 搜索记录（最近 40 条）
  - AI 导购压缩记录（最近 40 条）

## 3. 输出数据
1. 用户画像 markdown
   - Slow-changing Preferences
   - Semi-stable Context
   - Hard Constraints
   - Evidence
2. 个性化欢迎语
3. 离线推荐列表（可选）
4. 更新时间与触发类型

## 4. 输入输出

### 4.1 profile_builder
**输入**
- 行为序列 + 历史对话摘要 + 当前会话补充信号

**输出**
- `profile_markdown`
- `profile_meta`（updated_at, trigger_type）

### 4.2 greeting_generator
**输入**
- `profile_markdown` + `store_summary`

**输出**
- `personalized_greeting`

## 5. 日志
- 前缀：`user_understanding_`
- 记录：画像更新前后差异、证据来源、欢迎语生成耗时。
