# AIJ-2025 (ver 2.8) 文献检索与修改方案

本文档整理 Wythoff 奇偶限制、Diet Chomp 新测例，以及 multi-agent systems（MAS）相关工作的文献检索结果与论文补充方案。
当前阶段仅形成修改方案，不改动 `AIJ-2025 (ver 2.8).tex`、BibTeX 数据库或 benchmark 文件。

## 1. Wythoff 游戏中的 odd/even restrictions

### 1.1 可作为定义来源的文献

#### 1. Liu and Li (2014)

- 题目：*General Restriction of (s,t)-Wythoff's Game*
- 作者：Xiaodong Liu and Yijia Li
- 期刊：*The Electronic Journal of Combinatorics*, 21(2), P2.44, 2014
- DOI：10.37236/2963
- 链接：[The Electronic Journal of Combinatorics](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v21i2p44)
- 作用：系统讨论 `(s,t)`-Wythoff 游戏的奇偶限制，包括 Odd--Odd、Even--Even、Odd--Even 和 Even--Odd 等类型。其限制可作用于单堆移动以及扩展对角移动，因此适合作为“全局奇偶限制”的主要来源。

#### 2. Liu and Zhao (2015)

- 题目：*General Restrictions of Wythoff-like Games*
- 作者：Xiaodong Liu and Xiaowei Zhao
- 期刊：*Theoretical Computer Science*, 607, 2015
- DOI：10.1016/j.tcs.2015.08.015
- 链接：[ScienceDirect](https://www.sciencedirect.com/science/article/pii/S0304397515007616)
- 作用：将奇偶及其他限制推广至 Wythoff-like 游戏，特别是 `Wyt(f)` 一类规则，可用于支持 benchmark 中若干非标准 Wythoff 家族的受限版本。

#### 3. Li, Liu, Fraenkel, and Liu (2017)

- 题目：*Variants of (s,t)-Wythoff's Game*
- 作者：Yijia Li, Xiaodong Liu, Aviezri S. Fraenkel, and Xiaoqing Liu
- 期刊：*Discrete Applied Mathematics*, 227, 2017
- DOI：10.1016/j.dam.2017.04.020
- 链接：[ScienceDirect](https://www.sciencedirect.com/science/article/pii/S0166218X17301865)
- 作用：研究若干 `(s,t)`-Wythoff 变体，其中一种约定只限制 rook moves，即单堆移动取走棋子的奇偶性，而保留原有的对角移动规则。该文适合作为“仅限制单堆移动”的来源。

### 1.2 与本地 benchmark 的对应关系

本地目录为：

`C:/Users/2357/Desktop/projects/财产转移/代码/benchmarks/4.Wythoff/4.1 Wythoff`

初步检查表明，本地 benchmark 并非只采用一种统一的 odd/even restriction：

- `Odd-Odd-Wythoff.pddl` 和 `Even-Even-Wythoff.pddl` 中的奇偶条件同时出现在 `take1`、`take2` 和 `take3`，更接近 Liu and Li (2014) 的全局奇偶限制。
- 部分 Odd--Even 版本只对 `take1` 和 `take2` 施加限制，而保持对角规则不变，更接近 Li et al. (2017) 的 rook-move restriction。
- 不同 Wythoff 子目录可能组合了基础游戏规则和不同的奇偶约束，因此不能简单声称所有本地变体都由同一篇文章逐一命名和定义。

当前测例数量可概括为：

| 类型 | 数量 |
|---|---:|
| Unrestricted | 794 |
| Odd--Odd | 794 |
| Even--Even | 794 |
| Odd--Even | 542 |
| 合计 | 2924 |

较稳妥的论文表述是：基础的奇偶限制规则来自上述文献，而将这些限制与 benchmark 中九类基础 Wythoff 规则进行组合，部分属于本文的 benchmark construction，不应暗示每一个组合都已作为独立游戏出现在原始论文中。

### 1.3 建议加入 Wythoff 部分的英文说明

> Beyond the unrestricted rulesets, we construct parity-restricted benchmark variants. Parity restrictions for `(s,t)`-Wythoff's game were studied by Liu and Li, while analogous restrictions for `Wyt(f)` were introduced by Liu and Zhao. Two conventions should be distinguished. In global parity restrictions, congruence conditions are imposed on both single-pile and two-pile moves. In rook-restricted variants, only the single-pile moves are constrained, whereas the original diagonal rule is retained. Our benchmark combines these parity conditions with the Wythoff classes described below and includes unrestricted, Odd--Odd, Even--Even, and, where applicable, Odd--Even instances. Some of these combinations are benchmark constructions rather than separately named games in the cited literature.

标准 Wythoff 的测例计数可写为：

> For standard Wythoff, we consider the unrestricted, Odd--Odd, and Even--Even rulesets. For each ruleset, we bound the second pile by `m <= 5` and include one unrestricted instance, yielding `3 x 7 = 21` benchmark instances.

这里建议统一使用 **parity-restricted Wythoff variants**，不要笼统写成 **odd-even restriction**，因为后者无法说明 Odd--Odd、Even--Even、Odd--Even 的区别，也无法区分限制是否作用于对角移动。

## 2. 四个 Diet Chomp 新测例

计划加入的测例为：

- Two-rowed-2-Diet-Chomp
- Two-rowed-3-Diet-Chomp
- Three-rowed-2-Diet-Chomp
- Three-rowed-3-Diet-Chomp

### 2.1 定义来源

#### Ahn et al. (2018)

- 题目：*On Variations of Nim and Chomp*
- 作者：Ahn et al.
- 期刊：*Minnesota Journal of Undergraduate Mathematics*, 4(1), 1--11, 2018
- 预印本：[arXiv:1705.06774](https://arxiv.org/abs/1705.06774)
- 当前可能使用的 BibTeX key：`AhnCCEFGGKMPS2017`
- 作用：定义 `k`-Diet Chomp，即一次合法 Chomp 移动最多只能移除 `k` 个方格，并讨论或计算若干低行数和低参数的情形。

四个名称与原文定义的关系如下：

| 拟加入名称 | 与原文的关系 |
|---|---|
| Two-rowed-2-Diet-Chomp | `k=2`、两行棋盘的直接实例 |
| Three-rowed-2-Diet-Chomp | `k=2`、三行棋盘的实例，文中有明确分析或计算 |
| Two-rowed-3-Diet-Chomp | 一般 `k`-Diet Chomp 在 `k=3`、两行棋盘上的参数化实例 |
| Three-rowed-3-Diet-Chomp | 一般 `k`-Diet Chomp 在 `k=3`、三行棋盘上的参数化实例 |

因此，这四个长名称不是四篇不同论文分别定义的四种游戏，而是同一个 `k`-Diet Chomp 规则在 `k in {2,3}` 和行数 `r in {2,3}` 下的四个实例。

论文正文建议使用 **two-row** 和 **three-row**，而不是 **two-rowed** 和 **three-rowed**。benchmark 文件名若已固定，可以继续保留连字符形式。

### 2.2 建议加入 Chomp 部分的英文说明

> We additionally include `k`-Diet Chomp, introduced by Ahn et al., in which a legal Chomp move may remove at most `k` squares. We instantiate this ruleset with `k in {2,3}` on boards with two or three rows. This produces four benchmark instances: two-row `2`-Diet Chomp, two-row `3`-Diet Chomp, three-row `2`-Diet Chomp, and three-row `3`-Diet Chomp. These names denote parameterized instances of the same `k`-Diet Chomp ruleset rather than four independently introduced games.

若状态按非降序或非升序的行长向量表示，一次从第 `i` 行、第 `q` 列开始的 Chomp move 所删除的方格数可形式化为：

$$
Delta(i,q)=\sum_{j=i}^{r}\max(0,v_j-q+1),
$$

并要求：

$$
1 \leq Delta(i,q) \leq k, \qquad r \in \{2,3\}, \quad k \in \{2,3\}.
$$

最终写入论文时，应将 `Delta`、`v_j` 和行序约定替换为与现有 Chomp 定义一致的 LaTeX 记号。

### 2.3 测例数量和类别数量的建议

推荐把 Diet Chomp 作为一个新的游戏类，其中包含四个参数化实例，而不是将四个实例算作四个新游戏类。

按此方案：

- Chomp 测例数：`8 -> 12`
- benchmark 总数：`3720 -> 3724`
- 游戏类数量：`32 -> 33`

若将四个参数组合分别视为四类，则游戏类数量会变为 36，但从定义来源和论文叙述看不够自然，因此不推荐。

还需要先处理一个语义差异：Ahn et al. 的 Diet Chomp 采用 normal-play 形式，空棋盘为终止状态，并允许最后的方格被移除；当前 benchmark 若采用 poison-square Chomp，即禁止吃掉毒方格并以只剩毒方格为终止状态，则两者不是完全相同的终止语义。在添加测例前，应明确采用以下哪一种方式：

1. 严格复现 Ahn et al. 的 normal-play `k`-Diet Chomp；或
2. 保持现有 poison-square 编码，仅将“每步最多删除 `k` 格”作为新的移动限制，并在论文中说明这是 benchmark adaptation。

## 3. Multi-agent systems 相关工作扩充方案

建议在 Related Work 中单独增加一个小节，例如：

`Strategic Reasoning and Verification in Multi-Agent Systems`

内容不应只围绕 abstraction-refinement，而应覆盖战略逻辑、知识推理、模型检测、信息不完备下的可判定性，以及抽象精化方法。

### 3.1 建议优先纳入的 10 篇核心文献

1. **Pauly (2002), *A Modal Logic for Coalitional Power in Games***  
   奠定 Coalition Logic，用于表达联盟能够强制实现的目标。  
   链接：[Oxford Academic](https://academic.oup.com/logcom/article/12/1/149/942992)

2. **Alur, Henzinger, and Kupferman (2002), *Alternating-Time Temporal Logic***  
   ATL 的奠基论文，是多智能体系统战略能力验证的核心文献。  
   链接：[ISTA Research Explorer](https://research-explorer.ista.ac.at/record/4595)

3. **van der Hoek and Wooldridge (2003), *Cooperation, Knowledge, and Time: Alternating-Time Temporal Epistemic Logic and Its Applications***  
   将 ATL 与知识模态结合，形成 ATEL。  
   链接：[DOI](https://doi.org/10.1023/A:1026171312755)

4. **Chatterjee, Henzinger, and Piterman (2010), *Strategy Logic***  
   将策略本身作为逻辑中的显式对象，扩展 ATL 的表达能力。  
   链接：[ISTA Research Explorer](https://research-explorer.ista.ac.at/record/3861)  
   当前可能使用的 BibTeX key：`ChaHP2010`

5. **Lomuscio, Qu, and Raimondi (2009), *MCMAS: A Model Checker for the Verification of Multi-Agent Systems***  
   多智能体系统符号模型检测工具的代表性工作。  
   链接：[Springer](https://link.springer.com/chapter/10.1007/978-3-642-02658-4_55)

6. **Dima and Tiplea (2011), *Model-Checking ATL under Imperfect Information and Perfect Recall Semantics Is Undecidable***  
   给出信息不完备和完美回忆语义下的重要不可判定性边界。  
   链接：[arXiv:1102.4225](https://arxiv.org/abs/1102.4225)

7. **Ball and Kupferman (2006), *An Abstraction-Refinement Framework for Multi-Agent Systems***  
   将三值语义和抽象精化用于多智能体系统验证，是截图段落所依赖研究脉络中的早期代表作。  
   链接：[Hebrew University Research Portal](https://cris.huji.ac.il/en/publications/an-abstraction-refinement-framework-for-multi-agent-systems/)  
   当前可能重复的 BibTeX key：`BallK2006`

8. **Lomuscio and Michaliszyn (2014), abstraction for ATL verification**  
   结合状态抽象和动作抽象，并依据未知子公式所在状态进行精化。  
   链接：[Imperial College PDF](https://www.doc.ic.ac.uk/~alessio/papers/14/KR14-LM-2.pdf)  
   当前可能使用的 BibTeX key：`LomM2014`

9. **Belardinelli, Lomuscio, and Michaliszyn (2016), agent/predicate abstraction and refinement**  
   以谓词或 agent 维度构造抽象模型，并根据失败状态进行精化。  
   链接：[ECAI 2016 PDF](https://www.doc.ic.ac.uk/~fbelard/Documents/ecai2016b.pdf)  
   当前可能使用的 BibTeX key：`BelLM2016`

10. **Belardinelli, Ferrando, and Malvone (2023), abstraction-refinement for ATL under imperfect information and perfect recall**  
    将抽象精化推进到信息不完备和完美回忆的战略验证场景。  
    链接：[ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S0004370222001874)  
    当前可能使用的 BibTeX key：`BelFM2023`

### 3.2 可作为扩展候选的文献

以下文献可暂时多列，之后根据篇幅和正文实际论点筛选：

- **Schobbens (2004), *Alternating-Time Logic with Imperfect Recall***  
  链接：[DOI](https://doi.org/10.1016/S1571-0661(05)82604-0)

- **Mogavero et al. (2014), Strategy Logic: Reasoning about Strategies**  
  链接：[DOI](https://doi.org/10.1145/2631917)

- **Huang and van der Meyden (2014), symbolic methods for epistemic or strategic verification**  
  链接：[AAAI Proceedings](https://ojs.aaai.org/index.php/AAAI/article/view/8894)

- **Cermak, Lomuscio, and Murano (2015), verification of strategic abilities**  
  链接：[AAAI Proceedings](https://ojs.aaai.org/index.php/AAAI/article/view/9444)

- **Lomuscio and Michaliszyn (2016), abstraction techniques for strategic and epistemic verification**  
  链接：[AAMAS 2016 PDF](https://www.ifaamas.org/Proceedings/aamas2016/pdfs/p662.pdf)  
  当前可能使用的 BibTeX key：`LomM2016`

- **Clarke et al. (2000), *Counterexample-Guided Abstraction Refinement***  
  不是专门针对 MAS，但属于 CEGAR 方法的经典基础文献，可用于交代 abstraction-refinement 的一般背景。  
  链接：[Springer](https://link.springer.com/book/10.1007/10722167)  
  当前可能使用的 BibTeX key：`EOSYH2000`

### 3.3 建议的小节组织方式

可将新小节组织成四个自然段：

1. **战略逻辑基础**：从 Coalition Logic、ATL、ATEL 到 Strategy Logic，说明 MAS 验证所使用的表达语言如何发展。
2. **自动验证与工具**：介绍 MCMAS、符号模型检测以及战略综合方面的代表性工作。
3. **信息和记忆假设**：说明 imperfect information、perfect recall、memoryless strategies 等条件如何影响可判定性和复杂度。
4. **抽象与精化**：介绍三值抽象、状态和动作抽象、谓词抽象、agent abstraction，以及本文方法与这些验证方法的区别。

这种安排能保留现有以 “The abstraction-refinement framework ...” 开始的内容，但应在它之前加入更宽的 MAS 背景，使抽象精化成为整个研究脉络中的一个方向，而不是 MAS 相关工作的全部。

### 3.4 候选英文骨架

> Formal reasoning about multi-agent systems has progressed from logics of coalitional ability to automated verification and synthesis. Coalition Logic characterizes what groups of agents can enforce, whereas ATL and its epistemic extensions add temporal and knowledge objectives. Strategy Logic further treats strategies as explicit objects, enabling richer specifications of strategic interaction.
>
> These logics have supported symbolic verification tools such as MCMAS and BDD-based model-checking procedures. The computational boundary depends strongly on the information and memory assumptions: model checking ATL under imperfect information and perfect recall is undecidable, while restrictions on strategies, observations, or system structure can recover decidability.
>
> Abstraction provides a complementary response to state-space explosion. Early abstraction-refinement frameworks for multi-agent systems introduced three-valued semantics and under- and over-approximations of strategic ability. Subsequent work developed state and action abstraction, predicate abstraction for infinite-state systems, and agent-based refinement driven by failure states. More recently, these ideas have been extended to strategic verification under imperfect information and perfect recall.
>
> In contrast to approaches that primarily determine whether a given multi-agent model satisfies a temporal, epistemic, or strategic specification, our objective is to synthesize generalized winning formulas and rule-based strategies for infinite families of LIA-definable impartial combinatorial games. Verification is used inside the synthesis loop to eliminate incorrect candidate formulas and strategies.

最后一段属于论文定位判断，而不是某一篇文献的直接结论。正式写入时应结合本文方法章节的准确目标和术语进一步校准。

## 4. 术语统一建议

| 当前或可能出现的表述 | 建议表述 | 说明 |
|---|---|---|
| odd-even restriction | parity restriction / parity-restricted variants | 总称更准确 |
| odd Wythoff / even Wythoff | Odd--Odd / Even--Even Wythoff variant | 明确两个移动分量的限制 |
| unrestricted diagonal | original diagonal rule is retained | 用于 rook-only restriction |
| Two-rowed / Three-rowed | two-row / three-row | 正文英语更自然 |
| multi agent systems | multi-agent systems | 复合形容词加连字符 |
| 3-valued semantics | three-valued semantics | 正文通常拼写数字 |
| specific model | concrete model | 与 abstract model 对应 |
| failure state | failure state / inconclusive state | 依据引用论文的术语统一 |

## 5. 后续实施清单

在真正修改 TeX 和 benchmark 前，建议按以下顺序执行：

1. 逐个核对 Wythoff PDDL 中 parity predicate 的作用范围，区分全局限制与 rook-only 限制。
2. 为三篇 Wythoff 文献补全经过 DOI 或出版社页面核验的 BibTeX。
3. 确认 Diet Chomp 采用原论文 normal-play 语义还是现有 poison-square benchmark adaptation。
4. 将 Diet Chomp 计为一个新游戏类和四个新实例，并同步更新统计数字。
5. 更新正文、benchmark 总表、实验结果表、图注和任何使用总测例数作为分母的统计。
6. 重新运行 normal-play 和 misere-play 实验；不能只把总数从 3720 改为 3724。
7. 在 Related Work 中加入 MAS 独立小节，并根据正文实际论点从候选文献中保留约 10--14 篇。
8. 清理 BibTeX：检查 `BallK2006` 是否重复、`Michaliszyn` 是否存在误拼，并核对会议届次、卷期和页码。
9. 编译全文，消除 undefined citations/references，并检查新增段落造成的 overfull boxes。

## 6. 论断与证据边界

| 论断 | 证据强度 | 写作注意事项 |
|---|---|---|
| `(s,t)`-Wythoff 存在全局奇偶限制 | 强 | 可直接引用 Liu and Li (2014) |
| `Wyt(f)` 存在推广限制 | 强 | 可引用 Liu and Zhao (2015) |
| 只限制 rook moves、保留 diagonal rule | 强 | 可引用 Li et al. (2017) |
| 本地九类 Wythoff 的所有奇偶组合均由原文独立定义 | 不足 | 应称为本文构造的 benchmark combinations |
| `k`-Diet Chomp 的一般定义 | 强 | 可直接引用 Ahn et al. |
| 两行或三行 `2`-Diet Chomp 被明确分析 | 较强 | 需在最终引用前核对原文具体定理或表格 |
| `3`-Diet Chomp 是独立命名的新游戏 | 不成立 | 应写成一般 `k`-Diet Chomp 的 `k=3` 实例 |
| MAS 核心文献能够覆盖逻辑、验证和抽象精化 | 强 | 可按第 3 节分组引用 |
| 本文与 MAS 验证工作的差异 | 作者定位 | 需与方法章节保持一致，不能写成外部文献结论 |

## 7. 当前阶段结论

- Wythoff 的 odd/even 限制至少涉及两种不同约定，正文必须先按 PDDL 语义分类，再引用对应来源。
- 四个 Diet Chomp 名称都可追溯到 Ahn et al. 定义的一般 `k`-Diet Chomp，但应描述为四个参数化实例。
- MAS 相关工作适合独立成节，并从战略逻辑、模型检测、信息假设和抽象精化四条线组织。
- 当前只完成方案文档；尚未修改 TeX、BibTeX、PDDL、统计表或实验结果。
