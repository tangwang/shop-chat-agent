# 模块设计：product_understanding（商品理解）

## 1. 模块职责

基于离线文件 `product_understanding/output_logs/products_analyzed.csv`，生成可供在线导购调用的“维度知识底座”。

## 2. 离线任务

1. 各维度 top50 词频统计：
   - category_path（按 `>` 切分）
   - tags（按 `,` 切分）
   - target_audience
   - usage_scene
   - selling_points / effect（若有）

2. 归一化体系与映射：
   - 原始词 -> 归一化词
   - 控制类别数量（少数几个到十几个）

3. 每个归一化项摘要：
   - 分布概览
   - 示例商品

4. 产出：
   - 商店内容分布简介
   - 店铺欢迎语候选（10条）

## 3. 在线能力

1. `product_distribution`
   - 输入：维度 + key
   - 输出：Markdown 概览（统计 + 示例）

2. `product_search_fuzzy`
   - 输入：宽泛意图（品类/场景/效果/风格）
   - 输出：候选 key + 商品摘要

3. `product_search_precise`
   - 输入：query
   - 输出：搜索 API 结果 + 重排建议

4. `result_summarize`
   - 输入：用户目标 + top30 title
   - 输出：满足度、改进 query、精选商品ID、总结

## 4. 输入输出

### 输入
- CSV：`products_analyzed.csv`

### 输出
- `dimension_topk.json`
- `dimension_mapping.json`
- `dimension_overview.md`
- `store_distribution_brief.md`
- `welcome_messages.json`

## 5. 日志

- 文件前缀：`product_*.log`
- 记录：统计参数、LLM 提示词版本、映射结果摘要、失败样本。

