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

这一节承担的是全文的核心形式化工作：它不仅要把前面的预备知识落到统一的框架里，还要为后续的 `winning formula`、`strategy synthesis` 和理论结果提供严格的定义基础。  
从 AIJ 投稿标准看，这一节当前主要有四类问题：

1. 若干核心定义的记号还不够统一，局部存在自洽性风险。
2. 个别位置存在明显的草稿痕迹或占位符，不适合投稿版本保留。

---

### 1. 章节开头的定位还可以更精确

**位置**  
`AIJ-2025 (ver 2.3).tex:595-596`

**主要问题**

- 当前开头能表达本节大意，但还不够明确地点出本节的目标是“为 ICGs 提供 LIA-definable formalization”。
- `based on numeric states and actions` 这样的说法略泛，和后面真正引入的形式化对象之间还可以连接得更紧。
- 这一节在全文中的角色非常关键，因此节首导语应更明确地说明它与后续 synthesis/verification 部分的关系。

**修改方法**

- 将本节开头改写为更明确的定位句，强调这是本文的正式建模框架。
- 在导语中直接说明：本节将定义游戏表示、winning formula，以及后续策略表示所依赖的基本对象。

---

### 2. `Numeric states and actions` 小节存在若干记号不统一与形式化表达问题

**位置**  
`AIJ-2025 (ver 2.3).tex:601-646`

**主要问题**


- successor-state 的分段定义行内还带有数学模式符号混排痕迹，当前公式可读性不够好。
- `For brevity, we sometimes use a for (semi-ground) actions.` 后面紧接着出现占位符 `(Do we need ground actions ??)`，这是投稿前必须删除的草稿痕迹。



### 5. `Rule` 与 `strategy` 的定义需要更清楚地区分“winning”“complete”“exhaustive”

**位置**  
`AIJ-2025 (ver 2.3).tex:738-758`

**主要问题**

- `A rule (\psi, a) is a pair of semi-ground formulas \psi and semi-ground actions a.` 这里 `formula` 应为单数
- `\suc(s, a)` 与前文 successor notation 的顺序再次出现不一致。
- 后面的解释段也存在若干语言问题，如 `each of its rule`、`winning forced action` 等。



### 7. 这一节存在投稿前必须清理的草稿痕迹

**位置**

- `AIJ-2025 (ver 2.3).tex:599`
- `AIJ-2025 (ver 2.3).tex:646`

**主要问题**

- 存在明显的内部备注和占位语句，例如：
  - `(Do we need ground actions ??)`
- 这类内容即便当前是注释或单独一行，也不应继续留在投稿版本附近。

**修改方法**

- 删除所有草稿式备注和占位符。
- 如果这些备注对应的是尚未决定的写法，应先在 `fix.md` 或外部笔记中保留，不要继续留在正文文件里。

---

## `4. Synthesizing winning formulas` 部分审阅建议



### 3. Algorithm `IsWinningState` 中对 `\phi` 的使用存在严重符号复用问题

**位置**  
`AIJ-2025 (ver 2.3).tex:980-1031`

**主要问题**


- 后文 `AIJ-2025 (ver 2.3).tex:1265` 又明确写了 `We use \phi(s) for the formula that denotes state s`，这与 algorithm input 中 `\phi` 作为 winning formula 发生了直接冲突。


### 4. Figure / Example / Algorithm 之间存在局部不一致

**位置**  
`AIJ-2025 (ver 2.3).tex:1138-1155`

**主要问题**

- Figure `\ref{tab:IsWinningState}` 里只有 `(a)`, `(b)`, `(c)` 三个子图，但 Example `\ref{exm:IsWinningState}` 最后引用了 `(d)`。
- line 1153 将 state $2$ 对应到 Figure `(c)`，而图示过程更像是在描述中间图 `(b)`。
- 该图的 label 用的是 `tab:IsWinningState`，但对象实际是 figure；这不影响编译，但会破坏交叉引用命名的一致性。

**修改方法**

- 逐句核对 Example `\ref{exm:IsWinningState}` 与图中三个子图的对应关系。
- 修正不存在的 `(d)` 引用，并统一每一步对应的子图标号。
- 将 figure 的 label 命名风格统一为 `fig:*`。

---

### 5. Algorithm `IsWinningState'` 当前显示版本的语义表达不够稳

**位置**  
`AIJ-2025 (ver 2.3).tex:1170-1275`

**主要问题**

- 该算法上方的注释版伪代码引入了 `\statevar^0, \statevar^1, ...` 等时间点变量，看起来比当前显示版本更完整；这意味着当前显示版本可能是简化版，但简化后语义已经不够透明。
- line 1188 和 line 1195 中的替换式容易引发变量捕获/替换方向不清的问题。
- line 1253 说使用 `\statevar^i`，但 line 1254 举例又写成 `v_0`, `v_1`，再次出现 superscript/subscript 混用。
- line 1265 又继续使用 `\phi(s)` 表示状态公式，与前面 winning formula 的 `\phi` 冲突未解决。
- Theorem `\ref{thm:isWinState}` 只给了陈述，没有 proof 或 proof sketch；而 Introduction 里还强调加入了该 theorem 的完整证明，因此这里缺 proof 会很显眼。

**修改方法**

- 优先决定到底采用哪一套表示法：保留当前简化版算法，还是回到带时间索引变量的更完整表示。
- 无论采用哪一套，都要确保正文解释与展示的算法是同一套符号系统。
- 明确处理 line 1188/1195 的 substitution semantics，避免变量替换方向、绑定变量和自由变量混淆。
- 统一 `\statevar^i` 与 `v_i` 的记号，不要在同一段里混用 superscript/subscript 来表示时间层。
- 补上 Theorem `\ref{thm:isWinState}` 的证明或至少完整 proof sketch，并与算法描述一一对应。

---

### 6. 枚举法的小节把“样本一致性问题”和“全空间刻画问题”写混了

**位置**  
`AIJ-2025 (ver 2.3).tex:1304-1333`

**主要问题**

- line 1320 写  
  `The enumeration process terminates when it finds candidates formula \phi such that {s | s |= \phi \land \constraint} = \positiveSet`.  
  这与本节整体设定不一致。
- `GenerateCandidate(\positiveSet, \negativeSet)` 的任务应是找到一个与正负样本一致的 candidate formula，而不是直接要求其在所有 legal states 上恰好等于 `\positiveSet`。
- 如果 line 1320 按字面理解，它把“样本集上的一致性问题”写成了“全空间上的精确刻画问题”，这会与 CEGIS 的分层结构矛盾。

**修改方法**

- 将枚举法的小节目标改写为：搜索与当前 `\positiveSet` / `\negativeSet` 一致的公式。
- 如果你想强调在当前 sample 上完全分离，可以显式写成对 `\positiveSet`、`\negativeSet` 的一致性条件，而不是集合等式。
- 保持这一小节与前面 `GenerateCandidate` 的伪代码接口完全一致。

---

### 7. `Exact binary classification` 部分有若干集合记号与编码记号不一致

**位置**  
`AIJ-2025 (ver 2.3).tex:1352-1482`

**主要问题**

- Definition `\ref{def:extBinClass}` 使用的是 `\featureSet`，但后面 partial MaxSAT encoding 中 line 1432 写成了 `\psi \in \Psi`。
- Example `\ref{exm:NimMaxSatTheory}` line 1466 也把 atom set 写成 `\Psi`，而非前文统一使用的 `\featureSet`。
- hard constraint 的写法  
  `\bigvee_{\psi(s) \neq \psi(t)} Sel(\psi)`  
  省略了 `\psi \in \featureSet` 这一域说明；作为正式编码定义并不够严谨。
- partial MaxSAT encoding 实际上只完成了“选取一组 distinguishing atoms”，但“如何由选中的 atoms 构造最终公式”这一步在这一段里没有被清楚写成方法步骤。

**修改方法**

- 将这一子节中关于 feature set 的记号统一为同一个符号，不要在 `\featureSet` / `\Psi` 之间切换。
- 在 hard constraints 的定义里显式写出析取范围。
- 在 partial MaxSAT encoding 之后单独补一句或一个步骤，明确说明 solver 选中 atom 子集后如何构造 candidate formula。

---

### 8. `Correctness verification` 的证明部分存在更严重的逻辑问题

**位置**  
`AIJ-2025 (ver 2.3).tex:1484-1571`

**主要问题**

- Definition `\ref{def:consWinForm}` 的三个约束整体思路是合理的，但 substitution notation 的说明最好与前文的替换记号保持完全一致。
- 在 Theorem `\ref{thm:consWinForm}` 的 `(\Leftarrow)` 方向证明中，line 1536 写 `by induction on s`，这在形式上是不成立的；这里需要的是对“到终局的剩余步数”或某个 well-founded rank 进行归纳，而不是对状态对象本身归纳。
- 更严重的是，line 1541 在尚未证明 `\phi` 是 winning formula 的情况下，直接写  
  `By the definition of winning formula ..., s is a losing state.`  
  这构成了明显的循环论证风险。
- 同一 proof 中继续使用 `\tau(s, a)`，而前文 successor notation 并不始终一致；如果正文决定用 `\suc` 或 `\tau`，这里应统一。
- Corollary `\ref{cor:winForm}` 的 proof sketch 依赖 `VerifyWinForm` 返回 `\emptyset` 等价于“所有约束有效”，但这一点在当前算法接口描述中没有被足够明确地 formalize。

**修改方法**

- 统一 substitution notation，使 Definition `\ref{def:consWinForm}` 与前文替换记法严格一致。
- 将 Theorem `\ref{thm:consWinForm}` 的 `(\Leftarrow)` 方向 proof 重写为基于 well-founded game length / remaining moves 的归纳证明。
- 删除 proof 中对“winning formula 定义”的循环调用，改为直接用三个约束与 `winning/losing states` 的递归定义推出结论。
- 统一 successor notation，在 theorem、proof、definition 中使用同一套记号。
- 在 `VerifyWinForm` 的描述里更明确地写出它与 Definition `\ref{def:consWinForm}` 的关系，使 Corollary `\ref{cor:winForm}` 的 proof sketch 更可追溯。

---

### 9. 本节仍有若干应尽快修正的直接错误或草稿痕迹

**位置**

- `AIJ-2025 (ver 2.3).tex:801`
- `AIJ-2025 (ver 2.3).tex:927`
- `AIJ-2025 (ver 2.3).tex:1253-1255`

**主要问题**

- `winnig` 是直接拼写错误。
- 注释中仍残留 `(The difference and descriptions of the two algorithms ??)` 这类草稿痕迹。
- 时间索引变量的说明里 `\statevar^i`、`v_0`、`v_1`、`v^i` 混杂使用，属于明显的符号管理问题。

**修改方法**

- 先扫掉所有直接拼写错误和草稿占位符。
- 再统一时间索引变量的记法，确保正文、算法和公式说明都使用同一体系。

---

## 建议的修改优先级

对这一节，建议优先按下面顺序处理：

1. 先修 Algorithm `IsWinningState` / `IsWinningState'` 中 `\phi` 的符号复用问题，以及 transition / successor 相关记号不一致。
2. 再修 Theorem `\ref{thm:consWinForm}` 与 Theorem `\ref{thm:isWinState}` 附近的证明严谨性问题。
3. 然后统一 `\featureSet` / `\Psi`、`\statevar^i` / `v_i`、`\suc` / `\tau` 等整节范围内的符号系统。
4. 最后再处理拼写、小型图号引用错误和注释残留。

这一节如果只做语言润色而不修这些符号与证明层面的硬问题，审稿人很可能仍会把它视为“形式化尚未完全收口”的稿件。
