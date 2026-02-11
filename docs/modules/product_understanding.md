# product_understanding 模块设计（商品理解）

## 1. 职责
- 基于离线商品解析结果，构建导购可用的“分布认知层”。
- 为在线编排提供维度查询、候选 key、店铺分布摘要。

## 2. 输入数据
- `products_analyzed.csv`（已完成商品结构化标注）
  - 字段：category_path、tags、target_audience、usage_scene、season、features、selling_points 等。

## 3. 核心能力
1. 维度 TopN 统计（category/tag/audience/scene/effect）。
2. 归一化映射（raw -> normalized）。
3. 每个 normalized key 的商品概览（数量、示例、代表特征）。
4. 店铺内容分布简介生成。
5. 店铺欢迎语候选生成。

## 4. 输入输出

### 4.1 离线任务输入
- 商品 CSV
- 归一化提示词模板

### 4.2 离线任务输出
- `key_stats_*.json`
- `mapping_*.csv`
- `distribution_cards_*.md`
- `store_summary.md`
- `welcome_candidates.json`

### 4.3 在线查询输入输出
- 输入：`dimension`, `key`, `topn`
- 输出：维度概览 markdown + 商品示例列表

## 5. 日志
- 前缀：`product_understanding_`
- 记录：离线统计摘要、映射生成过程、在线查询耗时。
