# 模块设计：assistant（导购智能体）

## 1. 模块职责

assistant 模块负责面向用户的最终回复生成，不直接做复杂决策，复杂决策由 orchestrator 输出计划后再执行。

核心职责：

1. 选择欢迎语（店铺级 / 个性化）；
2. 读取编排层输出 + 技能结果；
3. 组织“补信息 + 推荐 + 轻引导”的用户回复；
4. 输出商品推荐卡片数据与下一轮引导问题。

## 2. 输入

- `user_message`
- `orchestration_plan`
- `tool_outputs`
- `user_profile_markdown`
- `recent_dialogue`
- `store_distribution_brief`
- `season_region_context`

## 3. 输出

```json
{
  "answer_markdown": "...",
  "products": [],
  "follow_up_questions": [],
  "strategy_applied": "recommend_first_then_ask",
  "trace_id": "..."
}
```

## 4. 提示词要点

- 人设：专业、贴心、灵活、善解人意；
- 提问规则：每轮最多 1-2 个问题；
- 优先提供价值：先给方向/建议再追问；
- 问题类型优先“感受/场合/风格/预算/禁忌”，尽量少问机械参数。

## 5. 失败兜底

- 当工具结果为空：
  - 给出透明解释；
  - 提供 2 个备选方向；
  - 提出 1 个关键澄清问题。

## 6. 日志

- 文件前缀：`assistant_*.log`
- 记录：prompt version、输入摘要、输出摘要、latency、错误码。

