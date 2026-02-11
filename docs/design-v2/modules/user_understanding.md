# 模块设计：user_understanding（用户理解/画像记忆）

## 1. 模块职责

在当前阶段，user_understanding 采用“前端 mock 数据 -> 画像生成”模式，不依赖后端真实埋点。

## 2. 输入（前端 mock）

1. 历史行为（最近20）：点击 / 加购 / 购买
2. 搜索记录（最近40，最近10条含详情）
3. AI 导购对话压缩记录（最近40）

## 3. 输出

1. `profile_markdown`
   - 稳定偏好
   - 使用场景偏好
   - 明确约束/雷区
   - 行为证据摘要
2. `personalized_greetings`
3. `recommended_products`（离线推荐list）
4. `last_updated_at`
5. `trigger_type`

## 4. 生成流程

1. 前端提交 mock 行为数据；
2. LLM 汇总并结构化成 markdown 画像；
3. 基于画像 + 商品维度 keylist 生成候选 key；
4. 调用商品概览与搜索；
5. 生成个性化推荐语与推荐list。

## 5. 使用边界

- 画像用于“背景理解”，不能覆盖当前轮用户显式意图；
- 若当前意图与画像冲突，以当前表达优先。

## 6. 日志

- 文件前缀：`user_*.log`
- 记录：输入摘要、画像 diff、证据引用、推荐结果摘要。

