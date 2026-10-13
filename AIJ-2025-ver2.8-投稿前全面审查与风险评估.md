# AIJ-2025 (ver 2.8) 投稿前全面审查与风险评估

审查日期：2026-08-24  
审查对象：`AIJ-2025 (ver 2.8).tex`、`AIJ-2025.bib`、编译日志、82 页 PDF、20 张实验曲线、`aij数据` 中的新旧 report/summary，以及公开的代码和 benchmark 仓库。  
审查方法：按算法类论文的完整论证链检查题目、摘要、引言、形式化、算法、证明、实验、相关工作、结论和投稿材料；逐页检查 PDF；将 report、summary、表格和曲线按实例数量交叉核对；对照 AIJ 官方投稿指南；小范围检索 2022--2026 年相关工作。

> 本报告中的“投稿就绪度”是内部整改指标，不是录用概率。最终决定取决于编辑和审稿人，任何人都无法可靠预测具体录用率。

## 1. 执行结论

### 1.1 当前结论：No-Go，不建议立即投稿

论文主题与 *Artificial Intelligence*（AIJ）的范围具有较高匹配度。工作涉及自动推理、约束求解、规划表示、多智能体博弈、无限状态系统和策略综合，属于 AIJ 明确覆盖的方向。论文也具备可形成完整期刊论文的基础：问题明确，提出了 winning formula 与 generalized winning strategy 的符号化框架，给出了 CEGIS、SMT 和 partial MaxSAT 相结合的方法，并构建了 32 类、3,720 个实例的 benchmark。

但是，当前稿件存在三类足以阻断投稿的问题：

1. **理论结论存在直接冲突。** 第 407 行声称“判断一个状态是否为 winning 对 LIA-definable ICG 是可判定的”，但同作者 2026 年预印本明确称：即使对 terminating LIA-definable ICG，该问题仍不可判定，只有 terminating finite-depth 情形可判定。当前稿件中支撑该结论的 `thm:isWinState` 又已被注释。
2. **实验结果的实例身份不可追溯。** Enum 的 Sheet1 只给修改后的聚合数量，过滤脚本却按 summary 工作簿顺序保留前 N 个成功实例；没有证据说明这些实例就是 report 修改后实际应保留的实例。因此“仅某方法解出”和“共同解出实例”的统计可能依赖任意行顺序。
3. **图表不一致。** 当前 20 张图包含 40 条方法曲线，其中 19 条终点数量与相应表格不一致，最大偏差为 493 例。

除此以外，PDF 中仍有红色修订文字、两个活动状态的 `??`、一个缺失引用、两个缺失定理引用、一个重复标签、多处 35--49 pt 的公式/文本越界、明显语法问题和未完成的投稿声明。以当前状态提交，技术检查、编辑初筛和外审阶段均有很高风险。

### 1.2 内部投稿就绪度

| 维度 | 当前评价 | 主要理由 |
|---|---:|---|
| AIJ 范围匹配 | 8/10 | 自动推理、规划、博弈和约束求解均在 AIJ 范围内 |
| 新颖性与期刊扩展说明 | 5/10 | 有潜在贡献，但相对 IJCAI-2020/AAMAS-2024 的增量缺少清晰矩阵 |
| 理论正确性与完整性 | 3/10 | 两个核心定理被注释，且状态可判定性与 2026 文献冲突 |
| 实验可信度 | 2/10 | 混合数据代次、按数量截断、图表不一致、缺少重复实验和外部基线 |
| 可复现性 | 3/10 | 有公开仓库，但缺少版本、发布包、实验脚本、原始日志和环境锁定 |
| 英文与论述 | 2/10 | 摘要过泛、贡献列表过长、存在大量基础语法问题和占位符 |
| 投稿合规性 | 3/10 | 缺通讯作者信息、声明、CRediT、数据声明等 |
| **综合投稿就绪度** | **约 35/100** | **必须完成一次实质性大修后再评估** |

### 1.3 投稿阶段风险

| 阶段 | 当前风险 | 可能触发点 |
|---|---|---|
| 投稿系统技术检查 | 高 | 缺通讯作者邮箱/完整地址、利益冲突声明、数据声明、CRediT 等 |
| 编辑初筛 | 很高 | 82 页、英语明显未完成、红色修订、`??`、摘要无定量结果、期刊增量不清 |
| 理论外审 | 很高 | 核心可判定性结论冲突、定理缺失、证明文字错误、完备性边界不清 |
| 实验外审 | 很高 | 数据来源混用、实例身份不可追溯、19 条曲线与表格不一致、比较公平性不足 |
| 可复现性检查 | 高 | GitHub 只有一次提交、无 release/DOI、缺原始结果和一键复现实验 |

## 2. 当前稿件的可取之处

这些优点值得保留，也是论文继续面向 AIJ 修改的理由。

1. **问题具有 AIJ 相关性。** 论文研究无限状态 impartial combinatorial games 的 winning-region characterization 和显式 generalized strategy synthesis，不只是对单个初始状态求解。
2. **输出形式具有解释性。** winning formula 和 action-condition rules 比单一胜负判定或有限状态搜索结果更容易检查和复用。
3. **方法链条较完整。** 稿件已形成“候选公式生成—SMT 验证—反例反馈—策略规则生成—规则验证”的整体框架。
4. **benchmark 覆盖面较广。** 包含 Subtraction、Nim、Welter、Wythoff 和 Chomp 五组、32 个类，并同时讨论 normal 与 misère 规则。
5. **当前 provisional 结果显示 SynMS 在 solved count 上有明显优势。** 但这些数字必须在统一、可追踪的数据管线重新确认后才能作为论文结论。

| 规则 | 任务 | SynEnum | SynMS | 当前差值 |
|---|---|---:|---:|---:|
| normal | formula | 2,067 / 3,720 | 3,292 / 3,720 | +1,225 |
| normal | strategy | 2,016 / 3,720 | 3,266 / 3,720 | +1,250 |
| misère | formula | 2,153 / 3,720 | 3,235 / 3,720 | +1,082 |
| misère | strategy | 2,128 / 3,720 | 3,211 / 3,720 | +1,083 |

这些 solved-count 提升足以构成实验主线，但平均 time 和 size 并不总是支持“更快”或“更小”的结论。因此论文应把主要结论写成“显著扩大可解范围”，再分别讨论时间和解大小的代价，避免笼统声称整体效率更高。

## 3. 必须在投稿前解决的 P0 问题

### P0-1：状态可判定性结论与同作者 2026 年结果冲突

- `AIJ-2025 (ver 2.8).tex:406--407` 声称：
  - `thm:gameIsICG` 证明判断一个 LIA-definable game 是否为 LIA-definable ICG 不可判定；
  - `thm:isWinState` 证明判断一个状态是否 winning 可判定。
- 这两个定理的正文分别在约第 678 行和第 1354 行被注释，导致 PDF 出现未定义引用。
- 缺失的 `FengFLG2026` 很可能是同作者的 2026 年预印本 [Decidability and Undecidability Results for LIA-Definable Impartial Combinatorial Games](https://arxiv.org/abs/2606.25276)。该文摘要明确写明：判断单个状态 winning/losing 即使在 terminating LIA-definable ICG 上仍不可判定，只在 terminating finite-depth 情形可判定。

这不是补 BibTeX 就能解决的格式问题，而是核心理论边界可能发生了变化。投稿前必须：

1. 由作者重新核对两个稿件采用的 game、termination、finite-depth 和 state-level decision problem 定义是否完全相同；
2. 若当前 AIJ 稿件的结论错误，删除/修正第 406--407 行及所有依赖内容；
3. 若条件不同，必须在定理陈述中明确附加条件，并解释为什么不与 2026 结果冲突；
4. 恢复完整证明或删除“we provide complete proofs”的贡献声明；
5. 让未参与原证明撰写的合作者做一次独立 formal audit。

### P0-2：Enum report、detail sheet 和 summary 之间没有可证明的实例级对应

Enum 旧 report 内部已有 7 个类别的 Sheet1 与分类 sheet 数量不一致：

| 规则/类别 | Sheet1 formula/strategy | 分类 sheet formula/strategy |
|---|---:|---:|
| misère Subtraction | 96 / 94 | 366 / 364 |
| normal Subtraction | 98 / 98 | 369 / 369 |
| normal l-Welter | 2 / 2 | 3 / 3 |
| normal Wythoff with subtraction set | 177 / 177 | 207 / 207 |
| normal 1st-restricted Wythoff | 119 / 119 | 219 / 219 |
| normal 3rd-restricted Wythoff | 392 / 392 | 492 / 492 |
| normal 4th-restricted Wythoff | 327 / 279 | 427 / 413 |

当前过滤脚本根据 Sheet1 的数量，在 summary 中执行 `rows[:target_count]`。这会按工作簿顺序保留前 N 条，而不是依据实例 ID 或原始运行日志确认每个实例的最终状态。由此共忽略：

- normal Enum：602 条 formula 成功记录、647 条 strategy 成功记录；
- misère Enum：270 条 formula 成功记录、284 条 strategy 成功记录。

如果 report 的修改只保存了聚合数量，没有保存被改动实例的名称，那么以下统计无法被可靠恢复：

- 每个方法独有 solved cases；
- 两方法共同 solved cases；
- 括号内 common-case time；
- 括号内 common-case size；
- 依赖具体实例运行时间的累计曲线。

**推荐处理：重新运行 Enum，并为每个实例产生唯一 ID、状态、时间、大小、超时原因和日志。** 如果无法重跑，至少应找到 report 修改时的逐实例记录；不能继续以“前 N 条”作为实例身份的替代。

### P0-3：实验使用混合代次数据，比较条件不统一

当前实验口径是：

- Enum：旧 report 筛选后的旧 summary；
- SynMS：新 summary；
- SynMS 的 `1.2 Subtraction`：改用旧 summary；
- 新 SynMS 中额外的 4 个 k-Diet Chomp：排除以保持 3,720 例。

这一口径可以作为内部临时修订方案，但不应作为最终投稿实验。不同方法和类别来自不同数据代次，可能对应不同代码、solver、机器状态、参数或 bug fix。即使 benchmark 名称相同，也不能默认是严格公平的同条件比较。

最终实验应满足：

1. 两种方法使用同一 commit、同一 benchmark manifest、同一硬件和软件环境；
2. 每个实例使用相同超时、内存限制和预处理；
3. normal/misère、formula/strategy 的成功判定由同一脚本给出；
4. 每个实例仅有一个规范结果记录；
5. 表格、正文和曲线均从同一份 tidy result 文件自动生成；
6. 生成脚本加入断言：总实例数为 3,720，Chomp 为 8，每条曲线终点必须等于表格 solved count。

### P0-4：19 条曲线与当前表格不一致

20 张图共有 40 条 SynEnum/SynMS 曲线，以下 19 条终点与当前表格不一致：

| 规则 | 类别 | 任务 | 方法 | 图中旧终点 | 当前表格 | 差值（表-图） |
|---|---|---|---|---:|---:|---:|
| normal | Subtraction | formula | SynMS | 467 | 460 | -7 |
| normal | Subtraction | strategy | SynMS | 466 | 460 | -6 |
| normal | Nim | formula | SynMS | 95 | 107 | +12 |
| normal | Nim | strategy | SynMS | 86 | 104 | +18 |
| normal | Welter | formula | SynMS | 5 | 7 | +2 |
| normal | Welter | strategy | SynMS | 5 | 7 | +2 |
| normal | Wythoff | formula | SynMS | 2,679 | 2,716 | +37 |
| normal | Wythoff | strategy | SynMS | 2,200 | 2,693 | +493 |
| normal | Chomp | formula | SynMS | 3 | 2 | -1 |
| misère | Subtraction | formula | SynMS | 466 | 465 | -1 |
| misère | Subtraction | strategy | SynMS | 466 | 465 | -1 |
| misère | Nim | formula | SynMS | 85 | 77 | -8 |
| misère | Nim | strategy | SynMS | 70 | 72 | +2 |
| misère | Welter | formula | SynMS | 7 | 6 | -1 |
| misère | Welter | strategy | SynMS | 5 | 6 | +1 |
| misère | Wythoff | formula | SynMS | 2,691 | 2,684 | -7 |
| misère | Wythoff | strategy | SynEnum | 1,919 | 1,912 | -7 |
| misère | Wythoff | strategy | SynMS | 2,420 | 2,665 | +245 |
| misère | Chomp | strategy | SynMS | 2 | 3 | +1 |

在数据口径尚未冻结前，不建议只“手工改图”。应先解决 P0-2 和 P0-3，再从最终实例级结果统一重画。

### P0-5：理论陈述和证明中已有可见错误

除缺失定理外，至少存在以下需要逐条核查的问题：

1. `thm:consWinRule` 的第四项说 exhaustive strategy 当且仅当“constraint for the redundant rule”有效，显然应核对为 exhaustive-strategy constraint。
2. 冗余规则证明中需要推出某个 `j \neq i` 满足 `s \models \psi_j`，正文却再次写成 `s \models \psi_i`。
3. 论文证明的是“算法若返回，则返回结果 sound”，但没有清楚说明：
   - 候选语言不含真实 winning formula 时会怎样；
   - enumeration 或 partial MaxSAT 何时保证找到候选；
   - 整体 CEGIS 是否终止；
   - SynMS 相对何种假设具有 completeness/relative completeness。
4. misère 扩展只有很短的一节，以“easy to carry forward”带过，修改了终止状态和约束，却没有重新给出 soundness theorem 或证明。
5. 引言第 318--319 行对 Take-away-3 的 losing 条件重复使用 `v \nmodulo_4 0`；第二处按上下文应是可被 4 整除的条件。

AIJ 对 regular paper 强调 mature、complete、novel，并要求相关证明和实验数据完整。理论主张不能仅靠直觉性文字或注释掉的证明支撑。

### P0-6：当前 PDF 仍是明显的内部修订稿

- 实验部分约第 45--59 页连续使用红色文字和红色表格数据；
- 活动占位符：第 415 行 `(Structure ??)`，第 421 行 `(??)`；
- 未定义引用：`thm:gameIsICG`、`thm:isWinState`；
- 未定义 citation：`FengFLG2026`；
- 重复标签：`table:NimMaxSatTheory`；
- 编译日志仍报告 undefined references/citation。

提交前应得到“零未定义引用、零未定义 citation、零活动 TODO、零修订色”的干净构建。

## 4. 分章节审查

### 4.1 标题

当前标题：*Strategy synthesis of LIA-definable impartial combinatorial games*。

优点是准确、简洁，并覆盖核心对象。问题是 `LIA` 是缩写，而 AIJ 指南建议标题尽量避免缩写；标题也没有体现自动化、无限状态或 winning-formula synthesis。可考虑在不夸大贡献的前提下改为：

- *Automated synthesis of winning formulas and strategies for linear-integer-arithmetic impartial games*
- *Symbolic winning-region and strategy synthesis for infinite-state impartial games*

最终标题应在理论边界确定后再定；如果只对 terminating 或 finite-depth 子类成立，必须在标题或摘要中明确范围。

### 4.2 摘要

当前摘要存在以下问题：

- `two approach` 等基础语法错误；
- 开头两句过于泛化，占用了最宝贵的摘要空间；
- 没有说明相对 IJCAI-2020/AAMAS-2024 的新增贡献；
- 没有说明 soundness、termination 或适用范围；
- 只说“several games”，没有给出 32 类、3,720 个实例；
- 没有给出核心 solved-count 结果和主要代价；
- “demonstrate effectiveness”缺乏可验证含义。

建议采用五句结构：问题与缺口；形式化和目标；核心算法；理论保证及适用条件；统一重跑后的定量结果与局限。实验数据冻结前不要在摘要中写最终数字。

### 4.3 关键词与首页信息

- 关键词目前用逗号分隔，而 `elsarticle` 模板建议使用 `\sep`；这可能影响元数据提取。
- 所有作者都没有 `\ead{}`；没有 `\corref`/`\cortext` 指定通讯作者。
- affiliation 只有学校、城市、邮编和国家，没有完整邮寄地址。
- Highlights 已注释。AIJ 将 highlights 列为可选但强烈建议，要求单独可编辑文件、3--5 条、每条不超过 85 个字符。

### 4.4 引言

主要问题：

1. Take-away-3 的 losing 条件写反/重复，直接损害读者对全文逻辑的信任。
2. 六条贡献过长，混合了定义、算法步骤、solver 名称、实验和证明；应压缩为 3--4 条可验证贡献。
3. “standard benchmark”缺少社区标准或公开采纳证据，建议改成“a benchmark suite”，除非有充分依据证明其标准性。
4. 只说本文是两个会议论文的 extended and revised version，没有逐项说明哪些定义、定理、算法、实验和 benchmark 是新增的。
5. 第 406--407 行用缺失定理支撑期刊增量，是当前最危险的贡献说明。
6. 路线图与实际章节对应不够准确，并保留 `(Structure ??)` 和 `(??)`。

建议在引言末增加一张“conference-to-journal extension matrix”，至少列出：

| 内容 | IJCAI-2020 | AAMAS-2024 | 当前 AIJ 稿新增 |
|---|---|---|---|
| winning formula synthesis | 有/无 | 有/无 | 具体新增内容 |
| strategy synthesis | 有/无 | 有/无 | 新算法或证明 |
| decidability results | 有/无 | 有/无 | 经核查后的新定理 |
| benchmark | 规模 | 规模 | 32 类、3,720 例及新增类别 |
| normal/misère | 覆盖情况 | 覆盖情况 | 新扩展与证明 |
| experiments | 方法与数据 | 方法与数据 | 新统一实验 |

AIJ 官方指南明确说明，同作者的会议论文不会自动使期刊稿失去新颖性；但 regular paper 仍必须清楚说明什么是新的、为什么成熟完整、预期科学影响是什么。

### 4.5 Preliminaries 与逻辑框架

- ICG 的定义、terminating ICG、finite game、finite-depth 的边界需要统一。当前“每个实例有限结束”与后文状态判定算法之间的关系没有充分说明。
- `FengFLG2026` 缺失；而该文可能改变当前稿件的可判定性边界。
- “By Zermelo's theorem”一段应明确适用的是每个终止实例，而不是把无限状态整体直接当作有限博弈。
- 第 594 行后的 PDDL-like formalization 应更清楚地区分标准 numeric PDDL 与本文采用的 fragment/extension，避免让读者误以为语法完全符合标准 PDDL。
- 如果判断输入 game 是否满足 terminating/ICG 条件本身不可判定，工具如何接收并信任这一前提，需要作为显式输入假设说明。

### 4.6 Winning-formula synthesis

优点是候选生成与 SMT 验证的分工清楚，exact binary classification 到 partial MaxSAT 的连接也具备论文价值。

需要加强：

- 明确定义候选 atom universe、常数和模数如何生成，以及这些选择如何影响 completeness；
- 说明 partial MaxSAT 的目标到底最小化 atom 数、公式大小还是其他成本；
- 解释 NuWLS 是 incomplete solver 时，算法如何处理 unknown、suboptimal 和 timeout；
- 把 soundness、termination、completeness 三类性质分开陈述；
- 证明中避免把“由 winning formula 定义可知是 losing”作为反向证明的一部分，以免出现循环论证的观感；
- 给出所有算法返回失败/unknown/timeout 的规范语义。

### 4.7 Winning-strategy synthesis

本节是论文最有潜力的部分，因为输出的是显式 action-condition rules，而不是只得到 winning region。但目前应重点核查：

- action 是否确定性；若 transition relation 可能有多个 successor，`\suc(s,a)` 的单值记号与 `\forall \statevar'` 的约束必须一致；
- winning、complete、exhaustive、redundant 四个性质的定义和约束需要逐一机械核对；
- 规则简化是否只保持 exhaustiveness，还是同时保持 winning；
- 算法可能产生大量规则时的终止条件和 size measure；
- strategy size 的定义应在实验前明确，尤其 Excel 中 strategy size 被解析为 tuple 的第二项。

### 4.8 Misère rule

当前一节过短，不足以支持后续一半实验表格。至少应：

1. 给出 normal 与 misère 的统一参数化定义，减少重复；
2. 清楚解释 ending state 在 misère 下为何 winning，以及 ending winning state 不执行动作如何进入策略语义；
3. 给出修改后 winning-formula 和 winning-rule 约束的 soundness theorem；
4. 说明原有 CEGIS 终止/正确性结论哪些保持不变；
5. 加一个完整例子验证定义。

### 4.9 实验设置

当前已给出 Python 3.7、Z3、NuWLS、各 solver timeout、总 cutoff、CPU、内存和 Windows 10，这是一个好的起点。仍缺：

- 代码 commit hash、Z3/NuWLS 精确版本、Cygwin 版本；
- 随机种子和 NuWLS 是否具有随机性；
- 每个实例运行次数、报告均值还是单次运行；
- 内存限制、并发设置和 CPU 核使用方式；
- timeout/unknown/crash/invalid output 的区分；
- 结果验证方式和验证失败如何处理；
- benchmark manifest 与每类实例 ID；
- 从 raw log 到 summary、report、表格、图片的完整脚本；
- 是否包含 I/O、解析和验证时间；
- 机器负载控制。

Python 3.7 已停止维护。复现包最好迁移到受支持版本，或至少提供容器/虚拟环境以固定旧环境。

### 4.10 实验指标与统计表达

当前表格中：

- `Solved` 括号内表示仅该方法解出的实例数；
- `Time` 和 `Size` 括号内表示两方法共同解出实例上的均值；
- time/size 只加粗括号内更优值，括号外总体均值不加粗。

这一设计能够部分缓解“两个方法在不同 solved set 上计算均值”的不可比性，方向是对的。但仍需改进：

1. solved count 应作为主要指标；
2. common-case time/size 必须建立在可追踪的同一实例 ID 上，当前 Enum 截断不满足；
3. 增加中位数、四分位数或 cactus/quantile plot，避免均值被极端值控制；
4. 对 timeout 使用性能剖面或 PAR-2/PAR-10 等明确的 censored metric；
5. 若 solver 有随机性，应重复运行并报告方差/置信区间；
6. 区分 formula synthesis time、strategy synthesis incremental time 和 total pipeline time；
7. 解释 size 单位：atom、AST node、字符数、rule 数还是其他；
8. 不应从不同 solved set 的括号外均值直接推断哪个方法更快。

### 4.11 Baseline、ablation 与公平性

目前实验基本是两个自有变体 SynEnum 与 SynMS 的比较，外部方法只在 related work 中叙述。对于 AIJ regular paper，这可能不足以证明方法相对于当前技术的价值。

建议至少补充：

- 与 IJCAI-2020/AAMAS-2024 版本的统一环境重跑；
- candidate-generation ablation：enumeration、partial MaxSAT、不同 atom set/目标函数；
- strategy simplification 前后 solved/time/size；
- Z3/NuWLS timeout 的敏感性分析；
- 对无法直接运行的外部方法，给出明确的不可比原因和小规模可比子集；
- 对文中 SimSynth “10 分钟失败”与本方法 “3.91 秒”的比较，必须说明硬件、版本、输入和 timeout 是否一致，否则只能作为文献报告，不应作为直接性能结论。

### 4.12 Related work

相关工作覆盖了 ICG analysis、Sprague-Grundy、无限状态博弈、LTL synthesis、generalized planning，以及 2023--2025 年的 symbolic game solving，广度较好。小范围 OpenAlex 核验找到的最相关近年工作，例如 acceleration、bounded-safety-player reachability games、localized attractors 和 generalized invariant strategy synthesis，当前稿件大多已经引用或讨论。这说明“完全遗漏主线文献”不是当前首要问题。

更大的问题是组织方式和论证强度：

- 相关工作较长，但每段多为逐篇摘要，缺少统一比较维度；
- 应按 game class、objective、state representation、output、soundness/completeness、automation 和 scalability 做表格比较；
- 多处使用 “does not”“fails”“not a full mechanization”等强判断，需要精确来源或实验支持；
- 2026 年同作者可判定性论文必须纳入并处理结论冲突；
- `FengFLG2026` 不能只补一个引用而不重写理论边界。

### 4.13 结论

当前结论重复摘要和方法流程，仍有 `infinite many`、`two approach`、`Our approach have`、`multiple operator` 等基础语法问题。“effectiveness and scalability”也未限定适用范围。

建议结论只保留：

1. 一句回答研究问题；
2. 两到三个经统一实验确认的定量结论；
3. 明确的理论和实验边界；
4. 与这些边界对应的未来工作。

不要在结论中首次引入重要限制；应在实验后的 Discussion 中提前分析失败类别、formula/strategy size 膨胀、候选语言限制和不同 game family 的差异。

## 5. LaTeX、引用与 PDF 技术审查

### 5.1 构建状态

- 手工 `pdflatex → bibtex → pdflatex × 2` 可以生成 PDF；
- PDF 为 82 页、Letter、约 1.25 MB，字体均嵌入；
- `latexmk` 在当前机器受 Cygwin Perl 模块冲突影响而失败，这是本地环境问题，但应提供一个稳定构建命令或容器；
- PDF 未 tagged/optimized，这不是初投稿阻断项。

### 5.2 活动引用与标签

静态扫描得到：68 个 label、117 次引用、113 个不同 citation key。问题包括：

- 缺失定理引用：`thm:gameIsICG`、`thm:isWinState`；
- 缺失参考文献：`FengFLG2026`；
- citation 大小写漂移：正文使用 `lomM2014/lomM2016`，bib 中是 `LomM2014/LomM2016`。BibTeX 当前仍解析成功，但应统一；
- 重复 label：`table:NimMaxSatTheory`；
- 2 个活动占位符；
- `.bib` 有 271 条记录但只有 236 个唯一 key，即 35 个 key 重复；
- 约 126 个唯一 bib 条目未被正文引用；
- `.bib` 没有 DOI 字段，且 `Dem2001` 等条目存在字段疑似错位。

建议用一个干净的 bibliography 文件只保留实际引用条目，统一 key 大小写，补 DOI/URL/页码，并逐条核查 2024--2026 年文献。

### 5.3 版面问题

日志中的主要版面警告：

- 最大横向越界约 49.15 pt，另有约 48.43、46.08、35.65 和 15.74 pt；
- 一个 float 比页面高约 25.94 pt；
- 多个 algorithm/table 产生约 22--30 pt 的 overfull vbox；
- 第 50 页仅含浮动体；
- 多个 `[h]`/`[!h]` 被 LaTeX 自动改为 `[ht]`。

82 页 contact-sheet 检查显示：

- 前半部分多个算法、长公式和宽表非常密集；
- 实验部分 table/figure 密度高，描述与对应浮动体有时跨页分离；
- 第 45--59 页大面积红色文字破坏投稿观感；
- 页面总体可读，但过长会增加审稿负担。

AIJ 官方 FAQ 说明 regular article 没有绝对页数上限，但建议约 20--30 个标准单栏页面，长文更难找到审稿人且审理更慢。当前 82 页、PDF 提取约 21,578 个英文词，建议把详细 benchmark 定义、长例子、部分证明和完整 per-class tables 转入 appendix/supplementary material；正文保留主论证和聚合结果。

## 6. 可复现性与公开仓库

论文给出的两个链接目前可访问：

- [SynMS code repository](https://github.com/caro2357/SynMS)
- [Domain benchmark repository](https://github.com/caro2357/Domain)

但它们尚不足以支撑 AIJ 级复现：

- 两个仓库页面均显示只有 1 次 commit；
- 没有 release、tag、Zenodo DOI 或论文版本快照；
- SynMS README 只有简短安装和单例命令，存在拼写/命令格式错误；
- requirements 虽固定了 `z3-solver==4.11.2.0`，但包含大量看似与论文无关的依赖；
- 仓库包含 Windows `.exe`、stackdump 和 `__pycache__`，但没有许可证说明；
- Domain README 只有两行，没有 3,720 实例 manifest、参数生成规则或校验脚本；
- 没有 raw logs、最终 tidy results、制表/绘图脚本和预期输出；
- 论文中的新 summary/report 并未形成可公开验证的数据发布。

建议建立 artifact release：

```text
artifact/
  README.md
  LICENSE
  CITATION.cff
  environment.yml / requirements-lock.txt / Dockerfile
  benchmark-manifest.csv
  domains/
  src/
  scripts/run_all.*
  scripts/validate_results.*
  scripts/make_tables.*
  scripts/make_figures.*
  raw-results/
  processed-results/results.csv
  paper-tables/
  paper-figures/
```

为 release 创建永久 DOI，并在论文中把 software 和 dataset 作为正式参考文献引用，而不是只放脚注 URL。

## 7. AIJ 官方要求对照

以下判断依据 2026-08-24 可访问的 [AIJ Guide for Authors](https://www.sciencedirect.com/journal/artificial-intelligence/publish/guide-for-authors)、[AIJ 投稿 FAQ](https://aij.ijcai.org/submitting-an-article/)、[AIJ Formatting Requirements](https://aij.ijcai.org/formatting-requirements/) 和 [Elsevier Publishing Ethics](https://www.elsevier.com/about/policies-and-standards/publishing-ethics)。提交前仍应再次打开最新指南核对。

| 官方要求/建议 | 当前状态 | 动作 |
|---|---|---|
| 与 AI 相关、方法有新颖性和深入验证 | 范围匹配；验证目前不可靠 | 统一重跑并强化实验 |
| regular paper 应 mature、complete、novel | 未达到 | 修复理论和数据链 |
| 清楚说明什么新、与文献关系及科学影响 | 不充分 | 增加期刊增量矩阵和影响陈述 |
| 单栏、至少约 11 pt、便于批注 | review PDF 基本符合 | 保留单栏评审格式 |
| 建议约 20--30 页；长文审理更慢 | 当前 82 页 | 大幅压缩并转附录/补充材料 |
| 指定通讯作者、邮箱、完整邮寄地址 | 缺失 | 在 front matter 与系统中补齐 |
| keywords | 有，但分隔不规范 | 改用 `\sep` |
| 图表引用和文件一致 | 不符合 | 统一数据源并自动验证 |
| 所有文献双向一致 | 不符合 | 修复缺失/重复/未引用条目 |
| competing interests statement，即使无冲突 | 未见 | 准备官方 declaration 文件/声明 |
| CRediT author contributions | 未见 | 与全体作者确认 14 类角色 |
| funding source 及 sponsor role | 未见 | 有资助则列基金和角色，无则明确说明 |
| research data/data statement | 未见 | 给出代码、benchmark、结果和可用性声明 |
| highlights 可选但强烈建议 | 未准备 | 准备 3--5 条独立文件 |
| 正确英语；可能因语言问题 desk reject | 当前不满足 | 全文专业语言编辑 |
| editable LaTeX source | 有 | 清理注释、临时文件和未使用宏 |
| AI-assisted writing disclosure | 当前项目已使用 AI 辅助修订 | 按最新政策在参考文献前加入声明，并由作者审核 |

AIJ 指南允许在已有会议论文基础上投稿期刊扩展，会议论文不会自动使稿件失去新颖性。但当前稿必须透明引用 IJCAI-2020 和 AAMAS-2024，并明确展示实质增量。建议在 cover letter 中附一页差异表，说明没有重复投稿、哪些结果已发表、哪些理论/算法/实验为新内容。

## 8. 建议的整改路线

### 阶段 A：立即冻结错误传播（1--2 天）

1. 暂停继续手工修改表格和图片。
2. 为当前 tex、数据和脚本创建只读快照或 tag。
3. 由作者确认 `FengFLG2026` 的准确文献及状态可判定性结论。
4. 决定 Enum 是否可以完整重跑；若不能，寻找逐实例原始日志。
5. 建立唯一 benchmark manifest，给 3,720 个实例稳定 ID。

### 阶段 B：重建实验数据链（约 1--2 周，视运行时间而定）

1. 在同一环境重跑 SynEnum/SynMS、normal/misère。
2. 每个实例输出 JSONL/CSV 原始记录，不再手工维护聚合 report。
3. 写 validator 检查实例数、重复 ID、成功判定、时间、size 和验证结果。
4. 从同一结果文件生成 20 张表和 20 张曲线。
5. 自动断言表格 solved count 等于曲线终点。
6. 增加聚合总表、失败原因表、common-case 分析、分布统计和 ablation。

### 阶段 C：理论修订（可与阶段 B 并行，约 1--2 周）

1. 重写 game class、termination、finite-depth 和 decision problem 的定义边界。
2. 修复或删除两个被注释定理。
3. 逐项核对 `thm:consWinForm` 与 `thm:consWinRule`。
4. 分开写 soundness、termination 和 completeness/relative completeness。
5. 为 misère 扩展给出正式定理与证明。
6. 由另一位作者独立检查所有公式替换、量词方向和 action semantics。

### 阶段 D：论文架构和语言（约 1 周）

1. 重写标题、摘要、引言贡献、期刊增量和结论。
2. 增加 Results 后的 Discussion/Limitations。
3. 把 benchmark 百科式描述、长例子和次要表格移到 supplementary/appendix。
4. 用统一术语：`SynEnum` 不与 `Enum` 混用；统一 winning formula、winning strategy、exact binary classification、partial MaxSAT、CEGIS。
5. 做一次全篇英文专业编辑，重点处理主谓一致、冠词、单复数和不自然搭配。

### 阶段 E：投稿包（2--3 天）

1. 清除红色修订和所有 TODO。
2. 零 warning 构建，至少确保零 undefined citation/reference 和零明显 overfull。
3. 指定通讯作者，补邮箱和完整地址。
4. 准备 CRediT、Funding、Competing Interests、Data/Code Availability、AI-use declaration。
5. 准备 Highlights 和 cover letter。
6. 发布代码/数据 artifact release 和 DOI。
7. 让所有作者检查最终 PDF、作者顺序、贡献声明和会议扩展差异表。

## 9. Go/No-Go 检查表

只有以下项目全部通过后，才建议进入“可以投稿”评估：

- [ ] 状态可判定性结论已与 2026 论文统一，所有核心定理存在且证明通过独立检查。
- [ ] Enum 和 SynMS 有统一环境下的实例级结果，或有可验证的逐实例历史记录。
- [ ] 不再按“前 N 行”代替 report 修改后的实例身份。
- [ ] 所有表格、描述和曲线由同一结果文件生成。
- [ ] 40 条曲线终点全部等于相应表格 solved count。
- [ ] 3,720 个 benchmark 实例具有公开 manifest 和稳定 ID。
- [ ] 摘要包含范围、方法、理论保证、benchmark 和定量结果。
- [ ] 清楚列出相对 IJCAI-2020/AAMAS-2024 的实质增量。
- [ ] 至少完成必要 baseline/ablation，并公平解释无法比较的方法。
- [ ] 代码、数据、环境、脚本、原始日志和结果已发布为版本化 artifact。
- [ ] PDF 无红色修订、无 `??`、无 undefined citation/reference。
- [ ] 主要 overfull box 和浮动体问题已处理，篇幅显著压缩。
- [ ] 通讯作者、CRediT、Funding、Competing Interests、Data Statement 和 AI-use declaration 已准备。
- [ ] 全文经过人工学术英语终审。

## 10. 最终判断

这篇稿件不是“不适合 AIJ”，而是“当前证据链还没有达到 AIJ regular paper 的成熟度”。其最强卖点应是：在明确的 LIA/termination 边界下，自动合成精确 winning formula 和覆盖所有 winning states 的显式 generalized strategy，并在统一 benchmark 上显著扩大 solved coverage。

要让这个卖点成立，优先级必须是：

1. **先确认理论结论正确；**
2. **再重建可追踪、统一的实验数据链；**
3. **随后重画图表并重写结果解释；**
4. **最后处理语言、篇幅和投稿材料。**

如果只做语言润色和 LaTeX 美化，而不解决理论冲突和实例身份问题，稿件仍然不具备安全投稿条件。完成 P0 和主要 P1 项后，再做第二轮“模拟编辑初筛 + 模拟审稿”会更有效。

## 11. 本次使用的审查技能及其影响

- `nature-polishing`：用于按算法类论文的证据链和章节功能检查标题、摘要、引言、方法、结果、讨论和结论，重点评估公平比较、可复现性、边界条件与过度主张。
- `pdf`：用于渲染并检查完整 82 页 PDF，而不是只依据 tex 源码判断版面。
- `literature-search`：用于 OpenAlex 小范围检索近年无限状态博弈、符号策略综合和 CEGIS 文献；该步骤发现了 2026 年同作者论文与当前状态可判定性主张的关键冲突。

