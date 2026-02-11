# assistant 模块设计（导购 + 编排）

## 1. 职责
- 提供欢迎语、对话推进、推荐与追问。
- 在每轮回复前执行编排（Orchestrator），决定工具调用与提问策略。

## 2. 子模块
- `orchestrator`: 生成结构化计划（JSON）。
- `responder`: 基于计划与工具结果，生成用户可见回复。
- `prompt_registry`: 管理系统提示词版本。

## 3. 输入输出

### 3.1 orchestrator
**输入**
- 用户输入文本
- 最近 10 轮对话摘要
- 用户画像 markdown
- 商店分布摘要
- 地域/季节/天气上下文

**输出（JSON）**
- `intent`: 意图与槽位
- `gap_assessment`: 缺口与原因
- `tool_plan[]`: 需要调用的工具与参数
- `questions_to_ask[]`: 下一轮提问
- `response_strategy`: 推荐优先/追问优先

### 3.2 responder
**输入**
- orchestrator 输出
- 工具结果（商品分布、检索结果、搭配建议等）

**输出**
- 用户可见文案（补信息 + 推荐 + 轻引导）

## 4. 日志
- 前缀：`assistant_`
- 记录：plan JSON、工具调用结果摘要、最终回复、耗时。

## 5. 与现有项目集成点
- 现有 `app/routes/chat.jsx` 作为入口；
- 在 LLM 主循环前后插入 orchestrator 与 responder 调用；
- 工具调用沿用既有工具服务机制。
