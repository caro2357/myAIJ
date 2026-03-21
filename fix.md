# `AIJ-2025 (ver 2.3).tex` 审阅建议

本文档汇总对待投稿 AIJ 版本的文本审阅建议。

说明：

- 目前**不直接修改** `tex` 正文。
- `Introduction` 部分保留此前的审阅结论。
- `2. Preliminaries` 部分按照你这次的要求，**只写需要修改的地方与修改方法，不附具体替换文本**。

---

## `1. Introduction` 部分审阅结论

### 总体判断

`1. Introduction` 需要修改，建议采用“学术化重写 + 结构压缩 + 术语统一”的方式处理，而不是只做零散语法修补。

主要问题集中在以下几个方面：

1. 英语表达还不够期刊化，存在若干非母语式搭配、主谓一致、冠词和句法问题。
2. 引言叙事结构已经具备雏形，但“研究空缺”和“本文贡献”的层次还可以更凝练。
3. 贡献列表过细，混合了技术流程与高层贡献，不够符合 AIJ 论文常见的平行表达方式。
4. 有投稿前必须清理的风险点，例如占位符、术语/拼写疑点、标签与例子内容不一致等。

### 需要重点处理的点

1. 开头三句建议整体重写，使背景引入更像 AIJ 稿件的标准 opening。
2. Take-away-3 例子的导入与正文需要改得更正式，并统一例子标签与内容。
3. “两个核心问题”的表述建议改成更标准的研究问题写法，突出 `winning region characterization` 与 `generalized strategy synthesis`。
4. 贡献列表建议改写为更高层、平行的 5 条左右贡献陈述。
5. “扩展版本说明”段落建议压缩，避免防御性过强的解释语气。
6. 论文结构段落中的占位符必须删除，并统一章节描述风格。

### 额外提醒

1. `MathSMT 5` 很可能应核对为 `MathSAT 5`。
2. `force to win` 建议统一替换为更自然的学术表达，如 `force a win`、`have a winning strategy`、`be winning for the player to move`。
3. `winning states` 与 `winning region` 建议配合使用，提升术语凝练度。

---

## `2. Preliminaries` 部分审阅建议

### 总体判断

`2. Preliminaries` 需要修改，而且这一节的问题不只是语言层面。

### 3. `Counter machine` 小节存在多处高优先级记号与语义不一致问题

**位置**  
`AIJ-2025 (ver 2.3).tex:481-524`

**主要问题**

- 前文说寄存器保存 `non-negative integer`，后文配置定义却写成 `positive integer`，与 `jumpZero` 的语义直接冲突。
- `halting configuration` 的判定写法不够标准，当前记号不利于读者直接把语义读出来。
- 一步转移定义中出现了未清楚定义的记号，例如 `v_0`，以及若干本应作用在“配置中的寄存器值”上的判断，却写成了对寄存器符号本身的比较。
- `M^i(C)` 的递归定义和索引范围写法不够严谨。
- 若干数学英语表达不够标准，例如关于“机器在某配置上终止”的说法。

**修改方法**

- 先统一配置、寄存器取值域和 `jumpZero` 相关语义，确保“自然数/非负整数/正整数”的表述前后一致。
- 将 `halting condition`、`single-step transition`、`iterated transition` 的记号全部整理成标准且自洽的形式。
- 清楚区分三类对象：寄存器本身、配置中的寄存器值、指令标签。
- 逐条检查转移函数中的条件与结果，确保判断对象是配置值而不是变量名。
- 按“定义机器 - 定义配置 - 定义一步转移 - 定义终止 - 引出不可判定性”的逻辑重新梳理本小节。

---

### 4. `Partial maximum satisfiability` 小节过于简略

**位置**  
`AIJ-2025 (ver 2.3).tex:527-532`

**主要问题**

- 当前只有概念性介绍，但缺少最基本的正式定义层。
- 由于后文把 partial MaxSAT 当作方法核心组件之一，这里的背景如果过于简略，会导致 Section 4 的形式化显得突然。
- 一些用语还不够标准，例如对 MaxSAT 的问题类型描述可进一步学术化。

**修改方法**

- 为 partial MaxSAT 增补一个最小但正式的问题定义。
- 明确问题实例由什么构成、什么是 hard clauses、什么是 soft clauses、目标函数是什么。
- 如果后文依赖某种特定编码形式或输入习惯，可以在此处做最简说明，但不必展开实现细节。

---

### 5. `Impartial combinatorial games` 小节需要同时修语言、概念边界和与后文的一致性

**位置**  
`AIJ-2025 (ver 2.3).tex:534-590`

**主要问题**

- 小节开头写成了 `In this section`，但这里是 subsection。

## `3. A logical framework` 部分审阅建议

### 总体判断

`3. A logical framework` 需要修改，而且这一节的修改优先级也比较高。

### 5. `Rule` 与 `strategy` 的定义需要更清楚地区分“winning”“complete”“exhaustive”

**位置**  
`AIJ-2025 (ver 2.3).tex:738-758`

**主要问题**

- `A rule (\psi, a) is a pair of semi-ground formulas \psi and semi-ground actions a.` 这里 `formula` 应为单数
- `\suc(s, a)` 与前文 successor notation 的顺序再次出现不一致。


## `4. Synthesizing winning formulas` 部分审阅建议



### 3. Algorithm `IsWinningState` 中对 `\phi` 的使用存在严重符号复用问题

**位置**  
`AIJ-2025 (ver 2.3).tex:980-1031`

**主要问题**


- 后文 `AIJ-2025 (ver 2.3).tex:1265` 又明确写了 `We use \phi(s) for the formula that denotes state s`，这与 algorithm input 中 `\phi` 作为 winning formula 发生了直接冲突。

---

## `5. Synthesizing winning strategies` 部分审阅建议

### 总体判断

这一节需要修改，而且问题主要集中在符号系统、算法接口、约束公式和对象层次的统一性上，而不是一般性的语言风格。

从形式化一致性的角度看，这一节最需要优先处理的是：

1. `action schema`、`semi-ground action`、`ground action` 在算法与正文中混用。
2. `IsValid`、`VerifyWinningRule`、`VerifyCompleteRule` 这几类过程的返回类型不一致。
3. `covers`、`\delta^c`、`\delta^w`、`\act^f`、`\act^u` 等辅助对象的含义还不够形式化。
4. rule verification 的约束公式和 proof 中存在括号缺失、记号漂移和作用域不清的问题。

---

### 1. `SynWinStrat` 主算法里，动作对象的层次没有统一

**位置**  
`AIJ-2025 (ver 2.3).tex:1704-1797`

**主要问题**

- 这一算法里 `a` 有时看起来是 action schema，有时又像 semi-ground action。
- line 1736-1738 使用 `\pre(a)` 和 `\suc(s, a)`，但如果 `a` 仍然是带参数的 action schema，这里语义并不完整。
- line 1723 中 `{\tt EnumerateActions}(\positiveSet'')` 输出的到底是 action schema、parameter instantiation，还是 semi-ground actions，没有在算法接口层说明清楚。
- line 1715 中 `\act^f`、`\act^u` 被声明为动作集合，但后续把它们同时用于“待补充 condition formula 的 action”和“已被 complete rules 覆盖的 action”，对象层次混杂。

**修改方法**

- 在这一节开头先明确：后续算法中的 `a` 到底表示 action schema 还是 semi-ground action。
- 如果 `EnumerateActions` 返回的是 semi-ground actions，那么正文和约束验证部分统一按 semi-ground action 书写。
- 如果返回的是 action schema，则必须把参数实例化显式写出来，不能在 `\pre(a)` 和 `\suc(s,a)` 里省略。
- 为 `\act^f` 和 `\act^u` 给出更精确的集合语义，区分“动作已完成”“动作被覆盖”“动作仍需 refinement”。

---

### 2. `covers` 关系被频繁使用，但没有正式定义

**位置**  
`AIJ-2025 (ver 2.3).tex:1727-1730`  
`AIJ-2025 (ver 2.3).tex:1983-1987`

**主要问题**

- 主算法中多次出现 `\delta^c$ covers $a`、`covered by \delta^c`，但全文没有给出这个关系的正式定义。
- line 1985 的自然语言说明只提供了直观含义，但仍然不足以作为算法判定条件的正式规范。
- 在没有正式定义的情况下，line 1727 的测试条件很难被理解为一个可验证的运算。

**修改方法**

- 单独给出 `\delta^c$ covers $a` 的形式化定义。
- 明确该关系是针对：
  - 所有 winning states；
  - 所有使 `a` 通向 losing states 的 winning states；
  - 还是当前已知的 sampled states。
- 若该判定实际只在 sample 上做近似检查，也应明确写出，否则容易被误认为是全局语义判定。

---

### 3. `\psi'_a` 在主算法中被使用，但没有被正式引入

**位置**  
`AIJ-2025 (ver 2.3).tex:1770`  
`AIJ-2025 (ver 2.3).tex:1776`

**主要问题**

- 当前算法直接使用 `(\psi'_a, a)`，并在注释中说它是 “the existing incomplete but winning rule of `\delta^w`”。
- 但 `\psi'_a` 没有在算法输入、数据结构定义或正文解释中正式引入。
- 读者无法确定：
  - 是否总存在唯一的 `(\psi'_a, a)`；
  - 若存在多个 rule 具有同一 action `a` 时如何处理；
  - 若不存在对应 rule 时该操作是否仍然定义。

**修改方法**

- 在算法说明部分明确 `\delta^w` 中关于同一 action 的 rule 是否唯一。
- 若唯一，直接在正文中写明：对每个 `a \in \act^u`，`\delta^w` 至多保存一个当前 condition formula。
- 若不唯一，则必须重写 line 1770 / 1776 的更新规则。

---

### 4. `IsValid` 的返回类型在 strategy synthesis 中出现明显不一致

**位置**  
`AIJ-2025 (ver 2.3).tex:1786-1795`

**主要问题**

- line 1786 写  
  `$S^e \assign {\tt IsValid}((\constraint \land \phi) \leftrightarrow ... )$`
- 但 `IsValid` 在前文算法中一直被当作返回布尔值的判定过程使用。
- 这里随后又比较 `S^e = \emptyset`，并在 else 分支中把 `S^e` 当成状态集合加入 `\positiveSet'`。
- 这说明这里的过程实际上不应叫 `IsValid`，或者它不应返回布尔值。

**修改方法**

- 统一这一类过程的接口。
- 如果这里需要的是“返回违反 exhaustiveness 的 counterexample states”，那么应使用与 `VerifyWinForm` 更一致的命名和返回类型。
- 若想保留 `IsValid`，则它必须始终返回布尔值，不能在这一处把返回值当作状态集合。

---

### 5. `EnumerateActions` 算法中，`a` 与 `a(k)` 的使用存在严重符号错误

**位置**  
`AIJ-2025 (ver 2.3).tex:2059-2095`

**主要问题**

- line 2069 迭代的是 `a \in \act`，看起来 `a` 是 action schema。
- line 2071 又写 `k \in Dom(k)` 和 `\pre(a(k))`，说明这里实际在考虑参数实例化。
- 但 line 2079 写的是 `s \models \pre(a)` 和 `\suc(s, a) \in \loseSet`，这里又把 `a(k)` 退化成了 `a`。
- line 2083 加入到 `\act_p` 的也是 `a`，而不是具体实例化后的动作。
- 如果 strategy synthesis 是基于 semi-ground action 生成 rules，那么这里丢失参数实例化会直接影响后续 correctness。

**修改方法**

- 明确 `EnumerateActions` 输出的是：
  - action schemas；
  - ground/semi-ground actions；
  - 还是 action schemas together with admissible instantiations。
- 若目标是返回可直接参与 rule synthesis 的动作，则 line 2079 和 line 2083 应统一使用实例化后的动作对象。
- 对 `Dom(k)` 的写法也要补定义，说明参数域来自何处。

---

### 6. `EnumerateActions` 中若干集合和中间变量似乎没有真正参与算法结果

**位置**  
`AIJ-2025 (ver 2.3).tex:2075-2088`

**主要问题**

- `\positiveSet_a` 和 `\negativeSet_a` 在 `EnumerateActions` 里被构造出来，但最终输出只有 `\act_p`。
- 从当前伪代码看，这两个集合在该算法内部没有实质作用，只是被临时构造后丢弃。
- 这容易让人误判 `EnumerateActions` 的职责：它究竟只是枚举动作，还是同时完成动作级 sample collection。

**修改方法**

- 若这两个集合仅用于判断某个动作是否值得加入 `\act_p`，可以将该逻辑压缩为更简单的存在性条件。
- 若后续确实需要保留它们，则应调整算法接口，使其显式输出这些集合或缓存它们。
- 让 `EnumerateActions` 的输出与主算法 line 1723 的实际需要保持一致。

---

### 7. strategy synthesis 的示例中存在动作记号前后不一致

**位置**  
`AIJ-2025 (ver 2.3).tex:2120-2124`  
`AIJ-2025 (ver 2.3).tex:2140-2142`

**主要问题**

- Table \ref{table:synWinRule} 第二轮中出现了动作 `take(v  \%  4)`。
- 但 example 文本 line 2141 中对应动作却写成了 `take(v - 4)`。
- 这不是简单的排版差异，而是两个完全不同的动作实例化表达。

**修改方法**

- 统一表格与 example 文本中的动作记号。
- 同时检查该动作在 game formalization 中是否真的允许这种参数表达方式。
- 若 `%` 表示取模而前文统一使用的是 `\modulo`，也应统一动作参数表达的符号体系。

---

### 8. rule verification 的约束公式存在括号缺失和 `\trans(a)` 语义未定义的问题

**位置**  
`AIJ-2025 (ver 2.3).tex:2150-2156`

**主要问题**

- line 2153 的 winning-rule constraint 括号不平衡。
- 同样的问题在后面的 proof 中 line 2170 和 line 2175 又重复出现。
- 此外，前文正式定义过的是 `\trans(a(\actparm))` 和 `\trans(\act)`，但这里直接使用 `\trans(a)`，没有说明当 `a` 为 semi-ground action 时该记号如何解释。
- line 2155 的 complete-rule constraint 也使用了 `\trans(a)`，同样依赖这一定义。

**修改方法**

- 先修正所有括号缺失问题，确保约束公式语法完整。
- 明确引入 `\trans(a)` 的含义：如果 `a` 是 semi-ground action，应说明它是对应 action instance 的 transition formula。
- 让这一节中的 `\trans(a)` 用法与前文 transition-formula 部分正式接轨，而不是临时缩写。

---

### 9. `Theorem \ref{thm:consWinRule}` 的 proof 依赖未说明的语义桥接

**位置**  
`AIJ-2025 (ver 2.3).tex:2159-2196`

**主要问题**

- proof 中多次从  
  `s \models \forall \statevar' [\trans(a) \rightarrow ... ]`  
  直接推出  
  `\suc(s, a)` 是 losing state。
- 这个推理在直觉上成立，但需要依赖“`\trans(a)` 正确刻画了从 `s` 到其 successor 的状态转移”这一语义桥接。
- 如果 `a` 在此处仍有 schema / instance 不清的问题，那么 proof 的这一步就不够严谨。
- complete-rule 的 `(\Leftarrow)` 方向也默认了  
  `\suc(s, a)$ is losing $\Rightarrow s \models \exists \statevar' [\trans(a) \land ... ]`
  这一点，需要同样的桥接说明。

**修改方法**

- 在 theorem 前或 proof 开头明确调用 transition-formula 的语义正确性。
- 若需要，可补一条简单 lemma：对任一 semi-ground action `a` 和 state `s`，`\trans(a)` 与 `\suc(s,a)` 的定义一致。
- 这样可避免 proof 中的关键一步显得像“默认成立”。

---

### 10. `complete`、`winning`、`exhaustive` 三者在算法说明里仍有轻微层次混杂

**位置**  
`AIJ-2025 (ver 2.3).tex:1980-2051`

**主要问题**

- `\delta^c` 被定义为 complete winning rules，`\delta^w` 被定义为 winning but incomplete rules，这一点是清楚的。
- 但 line 1983-1987 对 `\act^f` 的说明把“action has a complete rule”与“action is covered by \delta^c”两种不同情形放在一起，语义层次不完全一致。
- line 2043-2051 又通过 global equivalence 检查 strategy exhaustiveness，这与 action-level `covered` 之间的关系没有完全说清楚。

**修改方法**

- 将 action-level `finished / unfinished / covered` 与 strategy-level `winning / exhaustive` 这两层概念分开说明。
- 明确指出：`covered` 只是 pruning criterion，而不是 strategy correctness 本身。
- 避免让读者误以为“action 被覆盖”等价于“全局策略已经 exhaustive”。

---

### 11. `SynWinStrat` 的全局检查与反例回灌规则在语义上不自洽

**位置**  
`AIJ-2025 (ver 2.3).tex:1786-1795`  
`AIJ-2025 (ver 2.3).tex:2043-2051`

**主要问题**

- 当前主算法使用的是  
  `(\constraint \land \phi) \leftrightarrow [\constraint \land (\bigvee_{(\psi_a, a) \in \delta} \psi_a)]`
  的双向等价检查。
- 但 line 1794 无论得到什么反例，都统一把 `S^e` 加入 `\positiveSet'` 和 `\positiveSet`。
- 这与双向等价检查不匹配，因为等价失败的反例理论上有两类：
  - winning state 被策略漏掉；
  - losing state 被策略错误覆盖。
- line 2050-2051 的正文解释只描述了第一类情形，因此算法、解释和返回值语义目前没有完全对齐。

**修改方法**

- 在这里二选一统一语义：
  - 若该步真正只想检查 strategy 的 exhaustiveness，那么把双向等价改成单向检查，只寻找“winning 但未被覆盖”的反例；
  - 若坚持使用双向等价，则必须把反例分成正反两类，分别更新 `\positiveSet` 与 `\negativeSet`，而不能全部加入 `\positiveSet`。
- 正文说明、伪代码变量名和后面的 proof sketch 必须与这一选择同步修改。
- 建议显式写出该过程返回的到底是“missing winning states”还是“general counterexample states”。

---

### 12. strategy-level 全局反例的符号与术语没有统一

**位置**  
`AIJ-2025 (ver 2.3).tex:1786-1795`  
`AIJ-2025 (ver 2.3).tex:2149-2157`  
`AIJ-2025 (ver 2.3).tex:2168-2175`  
`AIJ-2025 (ver 2.3).tex:2245-2247`

**主要问题**

- 伪代码中 strategy-level 全局检查的反例记号是 `S^e`。
- 但表格最后一列写的是 `S^c`，example 文本里也写 `S^c = \{6\}` 和 `S^c = \emptyset`。
- 同时正文有时把这一步叫 `exhaustiveness check`，有时又叫 `completeness check`，容易与单条 rule 的 `complete rule` 混淆。
- 这会导致读者难以区分：
  - `S^c_a`：单条 rule 的 completeness counterexamples；
  - `S^e` 或 `S^c`：全局 strategy 检查返回的 counterexamples。

**修改方法**

- 统一 strategy-level 反例的记号，建议与 `exhaustive` 对应，单独保留一个符号并全文一致使用。
- 单条 rule 的 `S^c_a` 和全局 strategy 的 counterexample set 不要共用同一个上标字母体系。
- 在表格标题、列名、example 文字和 proof sketch 中统一术语：
  - rule level 用 `complete / completeness`；
  - strategy level 用 `exhaustive / exhaustiveness`。

---

### 13. `SynWinStrat` 的示例表格与正文文字在第二轮结果上明显对不上

**位置**  
`AIJ-2025 (ver 2.3).tex:2155-2157`  
`AIJ-2025 (ver 2.3).tex:2173-2175`

**主要问题**

- 表格第二轮第三行写的是动作 `take(v \% 4)`。
- 但 example 正文写成了 `take(v - 4)`，这是完全不同的动作。
- 表格中该行对应的 condition formula 是 `v < 8 \vee v \modulo_4 3`，正文却写成了 `v = 5 \vee v = 6 \vee v \modulo_4 3`。
- 这说明目前表格与正文至少有一处不是同一次运行结果。

**修改方法**

- 重新核对第二轮第三个 action 的真实实例化形式，到底是 `take(v \bmod 4)`、`take(v-4)`，还是别的 semi-ground action。
- 核对该 action 对应的真实 `\positiveSet_a`、`\negativeSet_a`、`\psi_a` 和 counterexample，再统一更新表格与 example 文字。
- 若采用模运算表达，动作参数符号应与正文统一，避免同时出现 `%`、`\mod`、`\modulo` 三种写法。

---

### 14. `table:synWinRule` 中至少有一行训练集与公式本身不一致

**位置**  
`AIJ-2025 (ver 2.3).tex:2157`

**主要问题**

- 表格第二轮第三行给出：
  - `\positiveSet_a = \{1,2,3,5,6,7\}`
  - `\negativeSet_a = \{4\}`
  - `\psi_a = v < 8 \vee v \modulo_4 3`
- 但该公式在 `v=4` 时也为真，因此它不可能把 `\negativeSet_a = \{4\}` 排除在外。
- 这不是措辞问题，而是“表中样本集”和“表中学到的公式”之间的直接冲突。

**修改方法**

- 重新计算这一行的训练集和 candidate formula，二者必须满足最基本的一致性：
  - 公式在所有 `\positiveSet_a` 中为真；
  - 公式在所有 `\negativeSet_a` 中为假。
- 如果该公式其实是简化前或简化后的另一个版本，需要在表格中统一写成同一阶段的结果。
- 建议把整张表按“algorithm raw result”还是“simplified result”固定成一种口径，避免混用。

---

### 15. `proof sketch` 中引用的行号和变量仍对应旧版算法

**位置**  
`AIJ-2025 (ver 2.3).tex:2244-2248`

**主要问题**

- proof sketch 中使用了 `Line 13`、`Line 15`、`Line 19`、`Line 20` 以及 `S^c` 等说法。
- 这些说法和当前 `SynWinStrat` 伪代码中的实际步骤、变量名已经不完全对应。
- 尤其是全局 strategy 检查在当前算法里用的是 `S^e`，而 proof sketch 仍在说 `S^c`。

**修改方法**

- 在主算法定稿后，最后回头统一刷新 proof sketch 中的行号引用。
- 证明草稿中的变量名必须与当前算法完全一致，尤其是 `S^w_a`、`S^c_a` 和 strategy-level 的全局反例集合。
- 若投稿版本希望减少行号敏感性，也可以把 proof sketch 改成“the winning-rule verification step / the global exhaustiveness check”这类表述。

---

### 16. `SynWinForm` 的 `The main algorithm` 基本自洽，但可以做一处小幅澄清

**位置**  
`AIJ-2025 (ver 2.3).tex:832-912`

**主要问题**

- 这一段整体上比 strategy synthesis 部分更自洽，表格与文字描述大体是对得上的。
- 但 line 866 写“verification procedure yields some states of `S'` ... and incorporates them into `\positiveSet` and `\negativeSet`, respectively”，这里略显简写。
- 从读者视角看，最好明确 `ClassifyStates(S')` 会把这些 counterexample states 分成 winning 与 losing 两类，再分别并入 `\positiveSet` 和 `\negativeSet`。

**修改方法**

- 保持算法主体不变。
- 仅把这句解释写得更明确，避免与 strategy synthesis 那里“把所有反例都并入 `\positiveSet`”形成歧义对照。

---

## 建议的修改优先级

对这一节，建议优先按下面顺序处理：

1. 先决定 strategy-level 全局检查到底是“单向 exhaustiveness 检查”还是“双向等价检查”，并据此统一 `S^e` 的语义和回灌规则。
2. 再统一动作对象层次，尤其是 `a`、`a(k)`、semi-ground action、`\trans(a)` 的含义。
3. 然后修 `IsValid` 返回类型不一致，以及 `\psi'_a`、`covers` 未正式定义的问题。
4. 接着修 rule-verification 约束与 proof 中的括号、记号和语义桥接问题。
5. 最后统一 example/table 中的动作、公式、反例记号和术语。

这一节的主要风险不是“说得不够漂亮”，而是算法对象到底是什么、验证约束到底对应哪一层语义还没有完全收紧。
