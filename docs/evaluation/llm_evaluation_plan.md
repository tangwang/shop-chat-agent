# LLM 评估方案（evaluation 模块）

## 1. 目标
- 在输出不确定条件下，对导购质量做自动化回归评估。

## 2. 核心指标
- 意图槽位覆盖率
- 追问质量（用户立场）
- 推荐相关性
- 工具调用正确率
- 回复推进率（是否促成下一步）

## 3. 评估方法
1. 构建样本集（多场景、多难度）。
2. 执行被测 Agent，收集输出。
3. 使用 LLM-as-a-Judge 按 rubric 打分。
4. 汇总报告并设置阈值。

## 4. 数据产物
- `evaluation/datasets/*.jsonl`
- `evaluation/reports/*.md`
- `evaluation/reports/*.csv`

## 5. 质量门禁建议
- 每次改动至少跑一次 smoke 样本（20 条）。
- 主分支合并前跑 full 样本（200+ 条）。
