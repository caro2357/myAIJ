# Multi-agent systems 相关工作综述（修订版）

第二、三、四章分别收录 **10、8、5 篇论文，共 23 篇**。
文献条目中的 `L`、`V`、`S` 编号分别对应逻辑、验证、策略生成，也可作为后续整理 BibTeX 的检索键。

## 一、研究范围与阅读主线

| 方向 | 核心问题 | 与 AIJ 本文的联系 |
| --- | --- | --- |
| 战略推理的逻辑与语义基础 | 如何表达路径性质、联盟能力、知识以及策略之间的依赖？增加表达能力需要付出怎样的计算代价？ | 为“某方能够保证获胜”提供形式化语义，也界定哪些问题能够自动求解。 |
| 多智能体系统的形式化验证 | 给定系统和性质，如何通过符号表示、抽象或参数化方法检查性质？ | 提供处理庞大或无限状态空间的参照，需要区分验证结论与策略生成。 |
| 策略生成、博弈求解与策略表示 | 如何找出可执行策略，或保留多个满足要求的策略选择？ | 直接联系获胜策略的生成、表示与覆盖范围。 |



## 二、战略推理的逻辑与语义基础（10 篇）

### 2.1 发展脉络

**从路径性质到联盟能力。**
CTL 用存在路径量词 `E` 和全称路径量词 `A` 描述系统可能或必然怎样运行。
例如，`EF goal` 表示存在一条最终到达目标的路径，`AF goal` 表示所有路径最终都到达目标。
但存在一条成功路径，并不意味着某个智能体能够控制系统沿着它运行。
Coalition Logic 用 `[C]φ` 表达联盟通过一次联合选择能够保证的结果；ATL 则将联盟能力与时间算子结合，表达跨越多步的战略目标。
例如，`⟨⟨C⟩⟩F goal` 表示联盟 `C` 有策略保证最终到达目标，无论联盟外的参与者如何行动。[L1–L3]

**从 ATL 到 ATL\*。**
ATL 中，每个战略量词后直接接一个基本时间目标，如下一步、直到、最终或始终。
ATL\* 允许在同一个战略量词范围内自由组合和嵌套时间算子，例如 `⟨⟨C⟩⟩(GF p ∧ GF q)`，要求同一个联合策略保证两个条件都反复成立。
不能简单地把它拆成 `⟨⟨C⟩⟩GF p ∧ ⟨⟨C⟩⟩GF q`，因为拆开后两部分可以选择不同策略。
这种对同一策略下完整路径行为的描述能力，带来了比 ATL 高得多的模型检测复杂度。
CTL\* 与 CTL 的关系也体现了路径公式表达能力的扩展，但 CTL\* 仍然量化路径，并不显式区分联盟与对手。[L3、L10]

**ATL 的扩展形成多条分支。**
ATEL/ATLK 加入知识算子；不完备信息语义要求策略只能依据可观察信息执行；ATL with strategy contexts 在嵌套推理时保留已经选定的策略；资源扩展则把动作成本、资源消耗或生产加入战略能力判断。
这些方向分别改变“知道什么”“能够观察什么”“哪些策略继续生效”和“具备多少资源”，不能用一个统一复杂度概括。[L4–L6、L9–L10]

**从隐式联盟量化到显式策略量化。**
Strategy Logic 将策略作为可量化对象，允许表达策略组合、偏离和依赖。
2010 年的原始版本主要研究两人轮流博弈；2014 年的工作推广到多智能体并发博弈，引入独立的策略量化与智能体绑定机制，并分析多个语法片段。
完整逻辑具有很高的计算代价，而单目标片段 SL[1G] 在严格强于 ATL\* 的同时，保持了与 ATL\* 相同的模型检测复杂度等级。[L7–L8]

### 2.2 复杂度对照与适用条件

以下主要比较**模型检测**：输入模型 `M`、状态 `s` 和公式 `φ`，判断 `M,s ⊨ φ`。
除专门标明的资源模型外，基准是有限、显式给出的状态图或并发博弈结构；涉及策略时还需明确可观察信息与记忆假设。
`|M|` 包括显式转移编码的规模，`|φ|` 表示公式长度。

| 逻辑或语义 | 新增能力或主要假设 | 模型检测结论 | 依据与边界 |
| --- | --- | --- | --- |
| CTL | 对执行路径作存在或全称量化 | 可在 `O(|M|·|φ|)` 时间内完成 | 显式有限状态图；不要把图规模误当作模块化程序长度。[L1] |
| CTL\* | 在路径量词内部自由组合时间公式 | PSPACE-complete | 指模型和公式均作为输入时的复杂度；这里作为 ATL\* 的参照。[L10] |
| ATL | 联盟通过策略保证基本时间目标；完备信息 | PTIME-complete；经典无公平约束算法为 `O(|M|·|φ|)` | 该语义下基本 ATL 目标可用无记忆策略实现。[L3] |
| ATL\* | 同一策略下的复合路径目标；完备信息、完美记忆 | 2EXPTIME-complete | 不能把该结论直接用于限制为无记忆策略的 ATL\* 变体。[L3] |
| 经典 ATEL | ATL 加知识算子，采用原论文的模型与策略语义 | 保持多项式时间可检测 | 加入知识算子不等于自动要求所有策略满足局部观察下的一致性。[L4] |
| ATL，局部观察、无记忆策略 | 不可区分状态必须采用一致动作 | `Δ₂ᴾ = Pᴺᴾ`-complete | 针对完整 ATL_ir 的模型检测；受限正公式片段可有更低复杂度。[L5] |
| ATL，局部观察、完美记忆 | 策略可依赖全部观察历史 | 一般情况下不可判定 | 即使底层状态图有限，也可能因分布式观察与历史依赖而不可判定。[L6] |
| ATL with strategy contexts | 嵌套战略量化时保留策略上下文 | 一般模型检测具有非初等复杂度 | 战略量词嵌套深度影响指数塔高度；受限深度应单独分析。[L9] |
| 完整 Strategy Logic | 多智能体并发博弈上的显式策略量化与绑定 | 可判定，但具有非初等复杂度 | 此处指 [L8] 的完整 SL；不是所有称为 Strategy Logic 的变体。[L8] |
| SL[1G] | 每个量化—绑定前缀对应一个时间目标 | 2EXPTIME-complete | 与 ATL\* 同一复杂度等级，不代表实际运行时间相同。[L8] |
| RB±ATL | 在该论文的资源模型中允许资源生产与消耗 | 2EXPTIME-complete；资源种类数固定时属于 EXPTIME | 后者是上界，不能直接写成 EXPTIME-complete；结论不能套用于全部资源逻辑。[L10] |

**模型检测、可满足性和策略生成是不同问题。**
模型检测检查给定模型；可满足性只给公式，询问是否存在某个模型满足它；策略生成还需构造策略见证。
例如，Pauly 对 Coalition Logic 证明的 PSPACE-complete 是**可满足性**结果，不能填入 ATL 的模型检测一栏。[L2]

**显式模型上的低复杂度不消除状态爆炸。**
多个智能体的局部状态组合后，显式全局模型可能远大于输入的模块化描述。
因此，CTL 或 ATL 的线性时间算法与实际多智能体验证困难并不矛盾。[L1、L3、V6]

**非初等复杂度与不可判定也不同。**
前者仍可能有总能结束的算法，但无法用固定高度的指数塔给出所需的复杂度界；后者表示不存在能够对所有输入都终止并正确判定的通用算法。
将信息、记忆或语法限制写清楚，才能正确理解这些边界。[L6、L8–L9]

### 2.3 代表论文

#### [L1] Automatic Verification of Finite-State Concurrent Systems Using Temporal Logic Specifications

- **作者与发表信息：** Edmund M. Clarke、E. Allen Emerson、A. Prasad Sistla，1986，ACM Transactions on Programming Languages and Systems，8(2)：244–263。
- **解决的问题：** 如何自动判断一个有限并发系统是否满足分支时间性质。
- **方法与贡献：** 采用状态标记算法，自底向上计算子公式成立的状态集合，并用固定点处理直到、始终等性质。这篇论文是 CTL 模型检测的经典工作，为后续战略逻辑验证提供算法基础。
- **复杂度与局限：** 算法对显式全局状态图规模和公式长度的乘积呈线性增长。CTL 描述执行路径，不区分路径是否可由某个联盟强制实现；全局状态图本身也可能发生组合爆炸。
- **文献来源：** [论文全文](https://ix.cs.uoregon.edu/~michal/Classes/04u/fsv/readings/ClarkeEmersonSistla-86.pdf)；[DOI](https://doi.org/10.1145/5397.5399)。

#### [L2] A Modal Logic for Coalitional Power in Games

- **作者与发表信息：** Marc Pauly，2002，Journal of Logic and Computation，12(1)：149–166。
- **解决的问题：** 怎样描述一组参与者通过联合行动能够保证哪些结果。
- **方法与贡献：** 用联盟的效力刻画其可以强制进入哪些结果集合，形成 Coalition Logic。它把逻辑表达的重心从路径是否存在推进到联盟具有何种能力，是理解 ATL 联盟算子的概念基础。
- **复杂度与局限：** 论文证明其可满足性问题为 PSPACE-complete。其基本联盟算子描述一次选择的能力，缺少 ATL 那样的时间结构；这项复杂度结论也不是策略生成算法的代价。
- **文献来源：** [出版页面与摘要](https://academic.oup.com/logcom/article/12/1/149/1064211?searchresult=1)。

#### [L3] Alternating-Time Temporal Logic

- **作者与发表信息：** Rajeev Alur、Thomas A. Henzinger、Orna Kupferman，2002，Journal of the ACM，49(5)：672–713；早期会议版本发表于 1997 年。
- **解决的问题：** 某个联盟能否在其他参与者任意行动时保证一个时间目标。
- **方法与贡献：** 在并发博弈结构上引入战略量词，系统研究 ATL 与 ATL\*。ATL 通过联盟前驱和固定点计算获胜区域；ATL\* 则允许同一策略下更复杂的路径要求。
- **复杂度与局限：** 完备信息下，ATL 模型检测为 PTIME-complete，ATL\* 为 2EXPTIME-complete。二者对应的策略记忆需求不同；转向局部观察后，需要重新分析复杂度。ATL 没有可供公式后续引用的显式策略变量，但模型检测算法可以保存并提取策略见证，不能把“语言中不显式量化策略”理解成“算法不能输出策略”。
- **文献来源：** [作者提供的期刊全文](https://www.cis.upenn.edu/~alur/Jacm02.pdf)。

#### [L4] Cooperation, Knowledge, and Time: Alternating-time Temporal Epistemic Logic and its Applications

- **作者与发表信息：** Wiebe van der Hoek、Michael Wooldridge，2003，Studia Logica，75(1)：125–157。
- **解决的问题：** 如何在同一种语言中描述联盟能力、时间演化和智能体知识。
- **方法与贡献：** 构造 ATEL，将 ATL 与知识模态结合。这样可以比较一个目标能否实现，以及智能体是否知道相关事实或能力。
- **复杂度与局限：** 原论文的模型检测保持可处理的多项式复杂度。需要区分“把知识写进公式”和“限制策略只能读取局部观察”：`Kᵢ⟨⟨C⟩⟩F p` 不能不加语义条件就解释为智能体拥有一套知道如何执行的统一策略。
- **文献来源：** [期刊页面](https://link.springer.com/article/10.1023/A%3A1026185103185)。

#### [L5] Model Checking Abilities under Incomplete Information Is Indeed Δ₂ᴾ-complete

- **作者与发表信息：** Wojciech Jamroga、Jürgen Dix，2006，EUMAS，CEUR Workshop Proceedings，223。部分文献将标题简称为 Model Checking ATL_ir Is Indeed Δ₂ᴾ-complete。
- **解决的问题：** 准确确定局部观察、无记忆策略语义下 ATL 模型检测的复杂度。
- **方法与贡献：** 延续 Schobbens 提出的 ATL_ir 语义，通过 SNSAT 归约证明 `Δ₂ᴾ` 下界，与既有上界结合得到完全性结果。这纠正了作者此前的 NP-complete 判断，也将早期猜测推进为正式证明。
- **复杂度与局限：** 完整 ATL_ir 模型检测为 `Δ₂ᴾ`-complete，文中的正公式片段为 NP-complete。不可区分状态上的动作必须一致；结论不能直接套用于完美记忆、任意有限记忆或 ATL\*。
- **文献来源：** [EUMAS 正式会议全文](https://ceur-ws.org/Vol-223/66.pdf)。

#### [L6] Model-Checking ATL under Imperfect Information and Perfect Recall Semantics Is Undecidable

- **作者与发表信息：** Cătălin Dima、Ferucio Laurențiu Țiplea，2011，arXiv:1102.4225，**预印本**。
- **解决的问题：** 为不完备信息与完美记忆组合下 ATL 模型检测的不可判定性提供正式证明。
- **方法与贡献：** 通过图灵机非停机问题的归约建立不可判定性。困难来自分布式观察与历史依赖策略的组合，而不只是底层状态数量。
- **复杂度与局限：** 一般问题不可判定。这不排除特殊观察结构、受限逻辑或受限记忆下存在算法，也不意味着所有近似验证都没有意义。
- **文献来源：** [作者预印本及版本信息](https://arxiv.org/abs/1102.4225)。

#### [L7] Strategy Logic

- **作者与发表信息：** Krishnendu Chatterjee、Thomas A. Henzinger、Nir Piterman，2010，Information and Computation，208(6)：677–693。
- **解决的问题：** 如何在逻辑中显式讨论策略，而不只说某个联盟存在获胜能力。
- **方法与贡献：** 将策略视为可量化的一阶对象，在两人轮流博弈中表达策略组合以及偏离后的结果。其单次量词交替片段已经能够表达 Nash equilibrium、secure equilibrium 的存在性。
- **复杂度与局限：** 论文给出基于树自动机的非初等判定过程，并对受限片段给出更好的界。介绍发展历史时，应与 [L8] 的多智能体并发版 SL 区分，不能把后者完整的绑定语法和复杂度下界都归到这篇早期论文。
- **文献来源：** [作者机构记录、摘要与全文入口](https://research-explorer.ista.ac.at/record/3861)。

#### [L8] Reasoning About Strategies: On the Model-Checking Problem

- **作者与发表信息：** Fabio Mogavero、Aniello Murano、Giuseppe Perelli、Moshe Y. Vardi，2014，ACM Transactions on Computational Logic，15(4)，Article 34。
- **解决的问题：** 怎样推广显式策略逻辑，并找到表达能力与复杂度之间的可用折中。
- **方法与贡献：** 研究多智能体并发博弈上的 SL，将策略量化与智能体绑定分离，并分析 SL[NG]、SL[BG]、SL[1G] 等片段。
- **复杂度与局限：** 完整 SL 的模型检测可判定但具有非初等复杂度；SL[1G] 则为 2EXPTIME-complete，且表达能力严格强于 ATL\*。这是针对给定模型的验证结论，不能据此认定能直接得到无限整数状态上的简洁规则。
- **文献来源：** [正式发表记录与摘要](https://iris.uniroma1.it/handle/11573/1403438)；[作者全文](https://people.na.infn.it/~murano/pubblicazioni/TOCL-preprint.pdf)。

#### [L9] Augmenting ATL with Strategy Contexts

- **作者与发表信息：** François Laroussinie、Nicolas Markey，2015，Information and Computation，245：98–123。
- **解决的问题：** 在内层战略推理中，如何继续使用外层已经选定的策略。
- **方法与贡献：** ATL 的普通战略量化不会自动保留外层玩家的既有策略承诺；ATL with strategy contexts 则把这些承诺保存在上下文中，使公式能讨论其他参与者在这些策略约束下还能做什么。
- **复杂度与局限：** 一般模型检测具有非初等复杂度，嵌套战略量词的深度直接影响计算代价。一般可满足性不可判定，但轮流博弈等受限情形有不同结论，应分别说明。
- **文献来源：** [期刊页面](https://doi.org/10.1016/j.ic.2014.12.020)。

#### [L10] On the Complexity of Resource-Bounded Logics

- **作者与发表信息：** Natasha Alechina、Nils Bulling、Stéphane Demri、Brian Logan，2018，Theoretical Computer Science，750：69–100。
- **解决的问题：** 联盟动作会消耗或生产资源时，战略性质是否仍可判定，需要多大计算代价。
- **方法与贡献：** 将资源逻辑的模型检测与带状态向量加法系统及其交替变体联系起来，分析 RB±ATL 和相关逻辑。此时有限控制状态与无界资源计数结合，可以产生无限配置空间。
- **复杂度与局限：** RB±ATL 模型检测为 2EXPTIME-complete，资源种类数固定时属于 EXPTIME；RB±ATL\* 的模型检测也被证明可判定。不同资源所有权、共享方式与执行语义可能改变结论，不能把这一结果概括成所有资源扩展都可判定。
- **文献来源：** [发表记录与摘要](https://research.ou.nl/en/publications/on-the-complexity-of-resource-bounded-logics/)；[作者全文](https://webspace.science.uu.nl/~alech001/Alechina%2B%2B-18a.pdf)。

## 三、多智能体系统的形式化验证（8 篇）

### 3.1 技术路线与近年进展

本章保留三篇基础文献，并收录五篇 2020 年后正式发表的工作。
其中[V5]–[V8] 是新增文献。
选择依据是与多智能体验证的直接关系、方法的代表性，以及能否补充原稿中的技术缺口。

| 编号 | 年份与发表场所 | 方法与验证对象 | 本版处理 |
| --- | --- | --- | --- |
| V1 | 2006，LICS | 联盟能力的三值抽象与精化 | 保留基础框架 |
| V2 | 2017，STTT | MCMAS 的符号模型检测 | 用完整期刊版替换原稿 2009 年工具短文 |
| V3 | 2016，AAMAS | 无限数据域系统的 ATLK 谓词抽象 | 保留 |
| V4 | 2023，Artificial Intelligence | 不完备信息、完美记忆下的战略验证 | 保留并明确适用片段 |
| V5 | 2023，IJCAI | Strategy Logic 的三值抽象 | 新增 |
| V6 | 2023，KR | 模块化模型上的变量抽象，ACTL\* | 新增，按正式发表年标注 |
| V7 | 2024，IJCAI | 参数化神经符号系统，有界 CTL 片段 | 新增 |
| V8 | 2025，AAMAS | 连续时间系统，TCTL 全称片段 | 新增 |

这些工作解决的瓶颈有所不同：BDD 压缩状态和转移的表示；谓词抽象压缩数据域；三值语义允许对粗模型给出可靠但可能不确定的结论；模块化抽象尽量避免先生成完整全局模型；参数化验证处理智能体数量不固定的系统。
因此，“新工具验证了更复杂的系统”需要落实到它具体扩展了哪类模型、哪类性质，以及保留了什么保证。

### 3.2 代表论文

#### [V1] An Abstraction-Refinement Framework for Multi-Agent Systems

- **作者与发表信息：** Thomas Ball、Orna Kupferman，2006，LICS，379–388。
- **解决的问题：** 缩小多人博弈模型时，如何避免错误夸大或削弱联盟能力。
- **方法与贡献：** 用抽象交替转移系统同时保存每个智能体能力的上近似和下近似，并在 alternating μ-calculus 上定义真、假、未知三值语义。若当前抽象不足以判定，则通过精化增加必要区别。
- **局限：** 大型或无限状态系统的精化不保证总能结束；方法主要输出可靠验证结论。它与本文都有迭代改进，但这里改进的是验证抽象，本文关注获胜公式和规则的发现。
- **文献来源：** [作者机构发表记录与摘要](https://cris.huji.ac.il/en/publications/an-abstraction-refinement-framework-for-multi-agent-systems/)；[DOI](https://doi.org/10.1109/LICS.2006.10)。

#### [V2] MCMAS: An Open-Source Model Checker for the Verification of Multi-Agent Systems

- **作者与发表信息：** Alessio Lomuscio、Hongyang Qu、Franco Raimondi，2017，International Journal on Software Tools for Technology Transfer，19(1)：9–30。期刊版于 2015 年在线发表，本版按卷期年份标为 2017。
- **解决的问题：** 如何在统一工具中检查多智能体系统的时间、知识和战略性质。
- **方法与贡献：** 使用 ISPL 描述智能体的局部状态、动作、协议和演化规则，再以 OBDD 表示全局状态、转移及知识关系。工具实现符号固定点算法，并提供公平性和反例生成等功能。
- **局限：** 基础版本要求有限编码，性能受模型结构和 BDD 变量顺序影响。符号表示可以压缩状态空间，但不能直接替代无限状态算术规则的归纳。
- **文献来源：** [期刊全文与版本信息](https://link.springer.com/article/10.1007/s10009-015-0378-x)。

#### [V3] Verification of Multi-Agent Systems via Predicate Abstraction against ATLK Specifications

- **作者与发表信息：** Alessio Lomuscio、Jakub Michaliszyn，2016，AAMAS，662–670。
- **解决的问题：** 含无界数据变量的多智能体程序，如何通过有限模型验证知识和战略性质。
- **方法与贡献：** 利用 SMT 自动生成谓词，将具体数据状态抽象为有限布尔组合，并在三值 ATLK 下验证。MCMAS-PA 将抽象构造、BDD 编码和模型检测连接起来；抽象模型中的确定真或假可以可靠地传回具体系统。
- **局限：** 可靠性不意味着完备性，抽象可能返回未知。它已经处理无限状态程序，因此比较本文时不能笼统地说既有 MAS 方法只支持有限状态；应比较其输出是验证结论还是覆盖无限状态的显式策略规则。
- **文献来源：** [正式会议全文](https://aamas.csc.liv.ac.uk/Proceedings/aamas2016/pdfs/p662.pdf)。

#### [V4] An Abstraction-Refinement Framework for Verifying Strategic Properties in Multi-Agent Systems with Imperfect Information

- **作者与发表信息：** Francesco Belardinelli、Angelo Ferrando、Vadim Malvone，2023，Artificial Intelligence，316，103847；DOI 中的 2022 对应在线发表阶段。
- **解决的问题：** 在不完备信息和完美记忆使一般问题不可判定时，如何仍然自动获得可靠验证结论。
- **方法与贡献：** 为并发博弈构造完备信息抽象，采用三值战略语义。当结果为未知时，借助自动机分析定位 failure states，再精化抽象。
- **局限：** 主要保证针对战略算子使用同一固定联盟的公式片段。已得到的确定结论可靠，但不保证所有输入最终摆脱未知；不能将其写成一般 ATL\* 不完备信息模型检测的完全判定算法。
- **文献来源：** [期刊页面与摘要](https://www.sciencedirect.com/science/article/abs/pii/S0004370222001874)。

#### [V5] Scalable Verification of Strategy Logic through Three-Valued Abstraction

- **作者与发表信息：** Francesco Belardinelli、Angelo Ferrando、Wojciech Jamroga、Vadim Malvone、Aniello Murano，2023，IJCAI，46–54。
- **解决的问题：** 面对完整 Strategy Logic 的高复杂度，如何借助抽象提高实际验证能力。
- **方法与贡献：** 为 SL 定义三值语义与抽象方法，证明其对经典二值语义的可靠近似关系，并扩展 MCMAS 实现验证。它把原稿主要围绕 ATL/ATLK 的抽象路线推进到显式策略量化与绑定。
- **局限：** 抽象可能产生未知，实验中的规模收益并不改变完整 SL 的一般复杂度。论文着重于验证，并未把策略变量自动转化为无限整数域上的算术规则。
- **文献来源：** [IJCAI 正式页面与全文入口](https://www.ijcai.org/proceedings/2023/6)。

#### [V6] Practical Abstraction for Model Checking of Multi-Agent Systems

- **作者与发表信息：** Wojciech Jamroga、Yan Kim，2023，KR，384–394。2022 年已有 arXiv 预印本，此处引用 2023 年正式版本。
- **解决的问题：** 能否在生成庞大的全局状态图之前，就完成模型约简。
- **方法与贡献：** 在模块化 MAS 图表示上移除或聚合变量，生成抽象的模块化描述。论文为 ACTL\* 提供相应保持性：may 抽象用于可靠证明，must 抽象用于可靠否证，并在邮寄投票模型上验证效果。
- **局限：** 保持性具有方向性，且对应 ACTL\*，不能据此声称保留任意联盟战略性质。其优势是减少模型构造成本，尚不等于生成获胜策略。
- **文献来源：** [KR 正式页面](https://proceedings.kr.org/2023/38/)；[会议全文](https://proceedings.kr.org/2023/38/kr2023-0038-jamroga-et-al.pdf)。

#### [V7] Formal Verification of Parameterised Neural-symbolic Multi-agent Systems

- **作者与发表信息：** Panagiotis Kouvaros、Elena Botoeva、Cosmo De Bonis-Campbell，2024，IJCAI，103–110。
- **解决的问题：** 由任意数量同类神经符号智能体组成的系统，是否满足要求，以及某些群体现象何时出现。
- **方法与贡献：** 智能体模板由神经网络感知单元与传统程序决策机制组成。针对有界 CTL 片段定义验证和涌现识别问题，通过抽象将其转化为具有有界智能体数量的 Neural Interpreted Systems 检查问题，并给出实现与实验。
- **局限：** 结论依赖模板、模型和逻辑片段的限制。参数化的智能体数量、神经网络感知和无限整数状态博弈是不同问题，不应把这项工作视为任意学习型 MAS 的通用正确性证明。
- **文献来源：** [IJCAI 正式页面与全文入口](https://www.ijcai.org/proceedings/2024/12)。

#### [V8] Practical Abstractions for Model Checking Continuous-Time Multi-Agent Systems

- **作者与发表信息：** Yan Kim、Wojciech Jamroga、Wojciech Penczek、Laure Petrucci，2025，AAMAS，1117–1126。
- **解决的问题：** 含连续时间约束的多智能体系统，如何在可管理的模型规模下验证实时性质。
- **方法与贡献：** 将变量抽象推广到实时 MAS 图，在模块化表示上进行约简，并证明对 TCTL 全称片段的正确性。论文使用 UPPAAL，在简化的爱沙尼亚投票系统上评估效果。
- **局限：** 连续时间不意味着任意连续动力系统，其建模与验证框架有明确约束。该方法处理实时性质验证，也没有自动提供联盟获胜策略或无限整数域规则。
- **文献来源：** [AAMAS 正式会议全文](https://www.ifaamas.org/Proceedings/aamas2025/pdfs/p1117.pdf)。

## 四、策略生成、博弈求解与策略表示（5 篇）

### 4.1 问题与输出形式

策略生成需要明确两件事：首先，策略对哪些环境行为提供保证；其次，输出究竟是一个动作选择函数、有限状态控制器，还是表示多个策略的约束集合。
“存在获胜策略”“生成一个获胜策略”和“保留所有需要覆盖的获胜选择”是不同要求。

| 编号 | 问题与语义 | 输出或构造对象 | 与本文比较的重点 |
| --- | --- | --- | --- |
| S1 | 有限模型上的 SL[1G] 战略规范 | 对存在量化策略的实现 | 从公式判定到显式策略提取 |
| S2 | 有限两人零和奇偶博弈 | 允许多个动作的获胜策略结构 | 保留正确选择的范围，以及是否具有最大性 |
| S3 | 有限、不完备信息博弈 | 基于局部观察的无记忆获胜策略 | 策略的可执行性与搜索代价 |
| S4 | 有限随机多人博弈，概率与奖励目标 | 数值结果、Pareto 信息与玩家策略 | 概率保证和多目标权衡 |
| S5 | 有限多人可达博弈，均衡语义 | 满足均衡要求的多策略组合 | 多个允许选择能否在任意组合后仍保持要求 |

### 4.2 代表论文

#### [S1] Verifying and Synthesising Multi-Agent Systems against One-Goal Strategy Logic Specifications

- **作者与发表信息：** Petr Čermák、Alessio Lomuscio、Aniello Murano，2015，AAAI，2038–2044。
- **解决的问题：** 给定多智能体模型和 SL[1G] 规范，如何既检查战略性质，又构造策略实现。
- **方法与贡献：** 将目标自动机、公式中的策略量化依赖和博弈模型组合起来，通过奇偶博弈求解得到验证结果并提取策略；数据结构和操作可以用 BDD 实现。论文报告原型工具及公平调度实验。
- **局限：** 面向有限模型和 SL[1G] 片段，复杂度仍为双指数等级。内部会处理时间目标及自动机，但核心是多智能体战略量化与策略提取，因此保留在本章。
- **与本文关系：** 它提供从战略规范到可执行策略的直接参照；本文还要求对无限整数状态形成可读且精确的算术规则，这不是该工具的直接输出。
- **文献来源：** [AAAI 正式页面与全文入口](https://ojs.aaai.org/index.php/AAAI/article/view/9444)。

#### [S2] Permissive Strategies: From Parity Games to Safety Games

- **作者与发表信息：** Julien Bernet、David Janin、Igor Walukiewicz，2002，RAIRO - Theoretical Informatics and Applications，36(3)：261–275。
- **解决的问题：** 能否在保证获胜的同时，保留多个正确动作，而不只任意选择一个策略。
- **方法与贡献：** 按策略所允许的行为集合比较策略，构造覆盖所有无记忆获胜策略行为的 permissive strategy。方法将奇偶博弈转化为带进展信息的安全博弈，再求解安全选择。
- **局限：** 对全部获胜策略一般不存在一个包含所有行为的最大获胜策略。论文覆盖的是无记忆获胜策略所产生的行为，构造出的 permissive strategy 自身可能使用记忆，不能简化成在每个原状态直接取所有获胜动作的并集。
- **与本文关系：** 适合比较“保留多少正确选择”。但有限图上的允许行为结构，与覆盖无限算术状态的条件—动作规则在表示和证明上仍有区别。
- **文献来源：** [正式发表记录与全文入口](https://www.numdam.org/item/ITA_2002__36_3_261_0/)；[作者全文](https://www.labri.fr/perso/igw/Papers/igw-perm.pdf)。

#### [S3] STV: Model Checking for Strategies under Imperfect Information

- **作者与发表信息：** Damian Kurpiewski、Wojciech Jamroga、Michał Knapik，2019，AAMAS，2372–2374，工具演示论文。
- **解决的问题：** 在局部观察约束下，怎样实际搜索、检查并展示联盟策略。
- **方法与贡献：** STV 在显式有限模型上实现固定点上下近似，以及基于支配关系剪枝的深度优先策略搜索。成功搜索可以给出基于局部观察的无记忆获胜策略，案例包括桥牌残局、无人机和投票模型。
- **局限：** 不同算法的结论能力不同，近似不能保证总能判定；显式模型和策略搜索仍可能很大。该版本也不处理任意完美记忆策略。
- **与本文关系：** 它强调策略必须依赖实际可获得的信息。比较时应同时说明本文的完备信息假设和无限状态范围，不能只比较工具是否输出了策略。
- **文献来源：** [AAMAS 正式会议全文](https://aamas.csc.liv.ac.uk/Proceedings/aamas2019/pdfs/p2372.pdf)。

#### [S4] PRISM-games: Verification and Strategy Synthesis for Stochastic Multi-player Games with Multiple Objectives

- **作者与发表信息：** Marta Kwiatkowska、David Parker、Clemens Wiltsche，2018，International Journal on Software Tools for Technology Transfer，20(2)：195–210。
- **解决的问题：** 当多人博弈包含随机转移、概率要求和奖励目标时，如何计算联盟策略以及目标之间的权衡。
- **方法与贡献：** 使用随机多人博弈和 rPATL 等规范，通过相应博弈求解与数值算法计算概率或奖励值，支持多目标、组合式验证和策略生成。多个要求之间的取舍可用 Pareto 信息表达。
- **局限：** 该文所述版本主要处理有限、轮流行动的随机博弈。所需策略的随机化和记忆能力取决于目标；数值求解的精度、收敛条件与模型假设需要具体分析。
- **与本文关系：** 它提供定量多智能体策略生成的参照。概率阈值、期望奖励与确定性的必胜条件是不同保证，不能在比较中直接互换。
- **文献来源：** [PRISM 项目官方文献页面、摘要与全文入口](https://www.prismmodelchecker.org/bibitem.php?key=KPW18)。

#### [S5] Permissive Equilibria in Multiplayer Reachability Games

- **作者与发表信息：** Aline Goeminne、Benjamin Monmege，2025，CSL，LIPIcs 326，23:1–23:17。
- **解决的问题：** 在多人可达博弈中，每个玩家都保留多个动作时，能否保证所有与之相容的策略组合仍为均衡。
- **方法与贡献：** 用 multi-strategy 为每个历史指定允许动作集合，再研究每一种相容策略组合都是 Nash equilibrium 或 subgame-perfect equilibrium 的条件。论文利用禁止动作的惩罚度量限制程度，并分析带惩罚上界和获胜要求的存在性问题。
- **复杂度与局限：** 当惩罚上界采用一元编码时，相关存在性问题属于 PSPACE。论文重点是形式化与可判定性，不应描述成已经提供成熟的大规模策略生成工具；其均衡保证也不同于对任意敌手都获胜。
- **与本文关系：** 它为“允许多个动作仍整体正确”提供了近期比较对象。研究核心是有限图上的多人可达目标与均衡，不依赖从一般 LTL 规范开始的反应式合成。
- **文献来源：** [CSL 正式出版页面与全文](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CSL.2025.23)。

### 4.3 与 AIJ 本文的比较重点

将这些工作写入相关工作时，可以按**状态空间、保证语义、输出形式和覆盖范围**四个维度比较。
ATL、SL 及其扩展为战略能力提供表达语言；验证工作通过符号表示和抽象得到性质结论；策略生成工作进一步构造满足要求的策略或允许行为集合。
本文若主张在无限状态 ICG 上生成精确获胜公式及完整规则，应具体说明哪些状态得到覆盖、哪些动作被规则保留，以及允许动作反复组合后为何仍保证获胜。

需要避免两种概括。
第一，已有谓词抽象和资源逻辑已经能够分析某些无限状态系统，不能将本文与既有工作的区别写成“无限状态与有限状态”的绝对二分。[V3、L10]
第二，允许动作集合的正确性不总能由各个动作分别属于某个获胜策略推出；在具有长期目标的博弈中，进展条件和记忆可能不可缺少。[S2]
更准确的比较应落在本文特定博弈类别中的算术表示、精确性与规则覆盖保证上。

## 修订记录

以下仅说明相对原 PDF 的编辑处理，不构成额外文献章节，也不计入 23 篇收录论文。

| 原稿内容 | 本版处理 |
| --- | --- |
| 第二章主要介绍 ATL 与 Strategy Logic | 加入 CTL、CTL\* 对照，单独解释 ATL\*，扩充知识、信息与记忆、策略上下文、资源约束分支；增加复杂度表及适用条件。 |
| 第三章偏重早期验证论文 | 压缩为 8 篇，其中 5 篇在 2020 年后正式发表；新增 SL 三值抽象、模块化变量抽象、参数化神经符号验证与连续时间验证。 |
| Synthesis of Reactive(1) Designs | 删除，核心是 GR(1) 反应式合成。 |
| Rational Synthesis | 删除，以各方 LTL 目标为输入，是反应式合成在理性环境下的直接扩展。 |
| Automated Temporal Equilibrium Analysis: Verification and Synthesis of Multi-Player Games | 删除，其 EVE 路线直接围绕 LTL 目标、时间性质和均衡策略合成展开。 |
| Strategy Representation by Decision Trees in Reactive Synthesis | 本版从严删除；论文中心是反应式合成所得策略的表示，和本次排除方向直接重叠。 |
| 第五章“多智能体协调与分布式优化” | 整章删除，包括任务分配、社会规则、ADOPT、DPOP，以及原第五章中的 Dec-POMDP、MAA\* 条目。 |
| 开头的五类划分及原第七章总结 | 改为三个方向，删除已移出文献的推荐项和相关论述；比较结论并入第四章末。 |

原第四章中直接涉及 LTL synthesis 的内容不止第一篇；本版依据原文的问题定义作上述筛选。
原文件中的勾选符号已移除，避免在新版本中继续表示未经定义的推荐等级。
