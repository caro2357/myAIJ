# Theoretical results 校对报告（仅报告，未改正文）

状态：`AIJ-2025 (ver 3.3).tex` 中 `Theoretical results on ICGs` 小节已恢复为修改前的 3.3 原文；以下是待作者确认的修改建议，尚未写入该小节。行号以本次恢复后的文件为准。

术语口径：实验方法称 `Enum`、`SynMS`；理论部分保留 `ICG`、`LIA`、Sprague–Grundy（SG）、normal play、misère play 的既有含义。不要把一种游戏的结论推广到所有 ICG。

## 必须先改的数学或引文问题

1. **End Nim 的充要条件错误（第 3340 行；参考文献也有年份错误）。** 原文把“每堆有相同的偶数个筹码”写成所有必败态的充要条件。原论文 Theorem 2 说，相同堆大小且**堆数为偶数**只是一类必败态；此外还有其他非平凡必败态。建议写为“偶数堆且堆大小相同的局面是必败态”，去掉 `iff`。`AIJ-2025.bib` 中 `AlbN2001` 的年份写为 2011，原刊为 **2001**。[Albert–Nowakowski 原文](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v8i2r1)。

2. **Wythoff 非 LIA 可定义性的证明少了一步（第 3352–3354 行）。** 必败态应含两个坐标的交换，以及 `(0,0)`。若直接把完整必败态集合投影到任一坐标，两个互补 Beatty 序列合起来覆盖所有非负整数，不能据此推出“不最终周期”。应先与 `v_1<v_2` 相交，再投影到第一个坐标，得到 `⌊φn⌋` 的非最终周期集合。游戏必败态的出处应引已有的 `Wyt1907`；`Ray1894,Bea1926` 可用于 Beatty 序列背景，但不宜单独承担 Wythoff 游戏结论。

3. **不可判定性段落含无来源的强结论（第 3363–3368 行）。** `Later, ?? extended ...` 不能留在投稿稿件中；目前所引两篇文献分别讨论特定不变多堆游戏的等价性、以及模拟 rule 110 的游戏族中特定周期性问题，不能直接推出“任意 LIA-definable ICG 的必胜集是否 LIA-definable 不可判定”。建议删除 `??` 句，并按原文限定游戏族和判定问题；“single period”的定义也须核对量词、平移向量与标准半线性概念的关系。[Larsson–Wästlund](https://arxiv.org/abs/1202.0664)，[Larsson](https://arxiv.org/abs/1201.1039)。

4. **Take-away 公式不是有效等式（第 3385 行）。** `$G(v) \modulo_{m+1} v$` 缺少等号且模运算左右颠倒。若每次可取 `1,…,m` 枚，应写 `G(v)=v\bmod(m+1)`。

5. **Proper Nim 的 SG 公式被误写为对所有局面成立（第 3386–3388 行）。** `G(v)=∑_i v_i` 只在至少一个堆为空时可这样简化，不是一般公式。例如三堆 `(1,1,1)` 的 SG 值为 0，而总和为 3。原始 Proper Nim SG 描述应归于 Jenkyns–Mayberry，Boros 等的工作是扩展。[Boros 等论文及其原始工作归属](https://link.springer.com/article/10.1007/s00182-020-00707-3)，[可核对公式的作者预印本](https://arxiv.org/abs/1504.06926)。

6. **Euclid 游戏规则与 SG 公式均需更正（第 3390–3406 行）。** 原文一面要求减完仍为正数，一面规定减到零结束，两句互相矛盾。Cole–Davie 原版允许减到零，Grossman 版在两数相等时结束；两版的必败态相同只限于两个正数且不相等的局面。`v_1<v_2` 之后的“对称情形 `v_2>v_1`”也应为 `v_1>v_2`。更严重的是 Cairns 等 Theorem 1 的奇偶分支在稿件里写反了：`I` 偶数时 SG 为 `⌊v_2/v_1⌋`，奇数时减 1；定义里是 `a_0=⋯=a_{i-1}≤a_i`，不是 `<`。最好给 Grossman 版的 SG 函数另记符号。[Cairns–Ho–Lengyel, Theorem 1](https://sites.oxy.edu/lengyel/papers/CairnsBaoLengyelDM2011%20.pdf)。

7. **Chomp 的周期性结论写得过强（第 3407–3409 行）。** Byrnes 的结果是固定 SG 值的局面分布具有最终周期性；文中的单一 `p` 满足所有局面 `G(v_1,v_2,…)=G(v_1+p,v_2+p,…)` 并非所引结果。建议删去该全局等式，按固定 SG 值和适用区域描述。[Byrnes 原文，第 5 节](https://math.colgate.edu/~integers/dg3/dg3.pdf)。

8. **误把 SG 加法写成普通加法（第 3411–3416 行）。** 对 normal-play SG 值，复合游戏的运算是按位异或 `\oplus`，不是通常的 `+`；因此 `\bigl(\mathbb N_0,+,0\bigr)` 不是此处所需的 SG 单位幺半群。若讲 misère quotient，可先用抽象运算 `\circ`，再对照 normal play 的 `\bigl(\mathbb N_0,\oplus,0\bigr)`。[Plambeck–Siegel 原文](https://arxiv.org/abs/math/0609825)。

9. **段末有未完成句子（第 3476–3477 行）。** `The above theoretical results on ICGs are analyzed by` 无谓语补足，紧接的比较句有明显语法问题。建议删除残句，另写一句清楚区分“已有工作求特定游戏的解析性质”与“本文合成给定游戏的公式和策略”，避免声称任何 LIA-definable ICG 都一定可被本方法求解。

## 次级问题：定义边界和文字

- 第 3345 行 Circular Nim 的“reduce `k` consecutive piles”易被理解为必须严格减少全部 `k` 堆；应明确可选择这 `k` 个相邻堆中的非空子集。第 3347 行主谓一致和枚举标点也要修正。
- 第 3372–3382 行 SG 的“任意 ICG 都等价于一堆 Nim”应加上 **normal play、有限终止局面** 等适用条件；无限/有环游戏随后另论。
- 第 3447–3468 行 remoteness 定义最好显式限定 normal play，改为陈列公式以免长公式溢出，并检查合取复合结果的适用前提。当前 PDF 在该定义处有 overfull 警告。
- `Fibonaci` 应统一为 `Fibonacci`；`disjuntive`、`an possible action`、`more than one piles` 等拼写和语法错误可在确认数学内容后一次处理。

## 建议处理顺序

先核实并修正 1、3、5、6、7、8 项，因为它们直接影响理论正确性和引文可信度；再处理 Wythoff 证明、定义边界和语言。以上均是建议，当前 `.tex` 的理论小节没有应用这些改写。
