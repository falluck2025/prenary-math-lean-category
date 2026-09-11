[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22690957.svg)](https://doi.org/10.5281/zenodo.22690957)

> **声明**：本文工作尚未得到独立实验验证，全部结论均为形式化验证层面的初步结果。

# 偏元数学·范畴论 ε · Lean 4 形式化验证
## Prenary Mathematics · Category-Theory ε · Lean 4 Formal Verification

**摘要**：本文在 Lean 4 中对偏元数学的"范畴论 ε"进行形式化验证，覆盖四件套——① 恒等态射偏移（id_ε = x + ε）；② 态射复合留差（f_ε∘g_ε 的留差 = a·ε_g + ε_f，内层留差被外层斜率放大，即"链式法则的留差版"）；③ 函子留差（保复合精度损失 = a·ε、保恒等 = ε）；④ 自然变换留差（自然性交换差 = (a−1)·δ + ε）。全部 19 个定理通过 Lean 内核 No goals 与 Comparator 独立二次验证，且 ε=0 时全部退化为经典范畴论。这是偏元数学"动作留差"公理第一次爬向数学的最高抽象层（对象→态射→函子→自然变换）。——老陈与AI的深夜实验室 发布 请笑纳——

**Abstract**: This repository formalizes "category-theory ε" in prenary mathematics using Lean 4, covering four components: (1) identity-morphism offset id_ε = x + ε; (2) morphism-composition residue f_ε∘g_ε with residue a·ε_g + ε_f (inner residue amplified by outer slope — the "residue version of the chain rule"); (3) functor residue (composition-preservation loss a·ε, identity-preservation loss ε); (4) natural-transformation residue (naturality exchange gap (a−1)·δ + ε). All 19 theorems pass Lean kernel No goals and Comparator independent verification, degenerating to classical category theory when ε = 0. This is the first time the "action-residue" axiom climbs to the highest abstraction layer of mathematics (object → morphism → functor → natural transformation). — Published by Lao Chen & AI's Late Night Lab. Please accept with a smile.

**概述**：偏元数学是对经典数学的一种扩展尝试，在 ε=0 时退化为经典数学。范畴论是"箭头的数学"，是数学抽象的最高层。本文把"动作留差"公理套到范畴论上：对象层不动（Object 不带 ε），态射层留差（箭头带 ε），并一路向上——复合留差、函子留差、自然变换留差。核心发现是"复合留差 = 链式法则的留差版"：内层留差 ε_g 被外层态射斜率 a 放大，与微积分链式法则 (f∘g)' = f'(g)·g' 同骨架，首次在结构层统一"留差"与"导数"。

**关键词**：偏元数学；范畴论；动作留差；复合留差；链式法则；函子；自然变换；恒等态射偏移；Lean 4；PGI蛟龙；陈偏贞；老陈与AI的深夜实验室（Chensong_AI_LateNightLab）

---

## 定理清单

### Day16-01 · 恒等态射偏移（2026-08-30）

| 定理 | 命题 | 结果 |
|:--|:--|:--|
| prenary_identity_degenerate | ε=0 退回精确恒等 | 通过 |
| prenary_identity_not_exact | ε≠0 时恒等态射不是精确恒等 | 通过 |
| prenary_identity_compose_not_exact | 复合不保持（id_ε ∘ f ≠ f） | 通过 |

### Day16-02-第一刀 · 态射复合留差（2026-09-05）

| 定理 | 命题 | 结果 |
|:--|:--|:--|
| mor_degenerate | 态射退化锚（ε=0 回经典缩放） | 通过 |
| id_degenerate | 恒等态射退化锚 | 通过 |
| comp_residue | 复合留差 = a·ε_g + ε_f（内层留差被外层斜率放大） | 通过 |
| comp_degenerate | 复合退化锚 | 通过 |
| id_comp_residue | 恒等复合留差 = ε_f + ε | 通过 |
| comp_assoc | 三态射复合结合律保持 | 通过 |

### Day16-02-第二刀 · 复合留差 = 链式法则留差版（2026-09-05）

| 定理 | 命题 | 结果 |
|:--|:--|:--|
| comp_slope | 复合斜率 = a·b（链式法则线性版，也是退化锚） | 通过 |
| comp_residue_slope | 复合留差放大系数 a = 外层斜率（=外层导数） | 通过 |
| id_slope_one | 恒等态射斜率 = 1 | 通过 |
| id_comp_residue | 恒等复合留差 = ε_f + ε（斜率 1 不放大） | 通过 |

### Day16-03 · 函子留差（2026-09-05）

| 定理 | 命题 | 结果 |
|:--|:--|:--|
| functor_comp_degenerate | 函子退化锚（ε=0 精确保复合） | 通过 |
| functor_comp_residue | 保复合精度损失 = a·ε | 通过 |
| functor_id_residue | 保恒等精度损失 = ε | 通过 |

### Day16-04 · 自然变换留差（2026-09-05）

| 定理 | 命题 | 结果 |
|:--|:--|:--|
| nat_degenerate | 自然变换退化锚（ε=δ=0 自然性精确交换） | 通过 |
| nat_residue | 自然变换留差 = (a−1)·δ + ε（两层留差合成） | 通过 |
| nat_id_residue | 恒等自然变换交换差 = ε | 通过 |

---

## 验证记录

| 文件 | 内核 | Comparator | 双哈希（Comparator Challenge Hash）|
|:--|:--|:--|:--|
| Day16-01 恒等态射偏移 | No goals | 通过 | `f38d8d05…` |
| Day16-02-第一刀 复合留差 | No goals | 通过 | `1745fa92…` |
| Day16-02-第二刀 链式法则留差版 | No goals | 通过 | `4b616780…` |
| Day16-03 函子留差 | No goals | 通过 | `3b9b40a0…` |
| Day16-04 自然变换留差 | No goals | 通过 | `66e74966…` |

- 平台：live.lean-lang.org（Lean 4 + Mathlib）
- 验证时间：Day16-01（2026-08-30）、Day16-02/03/04（2026-09-05）
- 落盘 SHA256 与 Comparator Challenge Hash 完全一致（零手改）

---

## 文件说明

```
prenary_category_Day16_20260830.lean       # Day16-01 恒等态射偏移
prenary_mor_comp_Day16_02_20260905.lean    # Day16-02 第一刀 复合留差
prenary_mor_comp_Day16_02b_20260905.lean   # Day16-02 第二刀 链式法则留差版
prenary_functor_Day16_03_20260905.lean     # Day16-03 函子留差
prenary_nat_Day16_04_20260905.lean         # Day16-04 自然变换留差
evidence/                                  # 内核 No goals + Comparator 截图
```

## 复现方式

1. 打开 live.lean-lang.org。
2. 将任一 `.lean` 文件内容完整粘贴（首行 `import Mathlib`）。
3. 光标逐个停在 `theorem` 上，确认右侧 `No goals` + `All Messages (0)`。

---

## 可证伪条件

- 若 ε=0 时偏元范畴论（恒等态射、复合、函子、自然变换）不能退化为经典范畴论，则本文相应结论失效。
- 若"复合留差 = a·ε_g + ε_f"（内层留差被外层斜率放大）在合法场景下不成立，则"链式法则留差版"结论失效。
- 若三态射复合的结合律在偏元下被破坏（留差非线性累积），则"结合律保持"结论失效。
- 若自然变换的自然性交换差恒为零（自然性精确交换），则"自然变换留差"结论失效。

---

## 作者

陈松（Song Chen）· ORCID: 0009-0002-9510-2239 · GitHub: falluck2025 · Zenodo 社区：cosmos-breathe-spectrum


## 许可

[CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/)（署名-非商业-禁止演绎，可自由分享，需保留署名，不得商用或改编）

## 作者备注（非论文正文）

- 内部编码：Day16 范畴论 ε（四件套：恒等偏移 / 复合留差 / 函子 / 自然变换）。
- 术语对照：ε = 动作残差；δ = 自然变换偏移；a = 态射斜率（缩放系数，即外层导数）。
- 核心发现：复合留差 = a·ε_g + ε_f，与链式法则 (f∘g)' = f'(g)·g' 同骨架（"留差与导数在复合动作上同一条传递规则"）。
- 范畴论四件套全线闭环：对象不动、态射留差、函子留差、自然变换留差——动作留差公理爬到数学最高抽象层。
- 待办：回填 Zenodo 正式 DOI；Day16 后续可探"非线性态射的复合留差"（进迷雾箱）。

——老陈与AI的深夜实验室 发布 请笑纳——
