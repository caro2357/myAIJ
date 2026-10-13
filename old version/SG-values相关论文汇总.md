# 直接分析游戏 SG Values 的相关论文

## 标记说明

- **bib 已有**：已收录在 `AIJ-2025.bib` 中。
- **新发现**：目前尚未收录在 `AIJ-2025.bib` 中的新文献。
- **SG=0**：有些论文主要分析 P-positions。因为位置为 P-position 当且仅当其 SG 值为 0，所以也纳入 SG 分析。

## 1. Sub

| 状态 | 文章 | 对应游戏 | 分析层次 | SG 分析内容 |
|---|---|---|---|---|
| bib 已有 | Fraenkel, *Aperiodic Subtraction Games* (2011) | Mark、UpMark、Mark-\(t\) | 较完整 SG | 刻画 Mark 的 SG 序列结构，给出线性时间计算方法，并讨论 SG 序列的非周期性。 |
| bib 已有 | Sopena, *\(i\)-Mark: A New Subtraction Division Game* (2016) | \(i\)-Mark 减法—整除游戏 | 较完整 SG | 研究 SG 序列的非周期性和近似周期性，并在多种参数情形下给出 \(O(\log n)\) 计算方法。 |
| 新发现 | Friman and Nivasch, *Some \(i\)-Mark Games* (2021) | 多类 \(i\)-Mark | 完整或部分 SG | 补全若干单除数情形的 SG 函数；对 \(i\)-Mark\((\{1\},\{2,3\})\) 证明 SG=0、1、2 均无限出现。 |
| 新发现 | Nivasch and Rubinstein, *A Convergence Technique for the Game \(i\)-MARK* (2025) | 多除数 \(i\)-Mark | SG 算法 | 用收敛技术为许多 \(\lvert D\rvert>1\) 的 \(i\)-Mark 给出多项式时间 SG 序列算法。 |

## 2. Nim

| 状态 | 文章 | 对应游戏 | 分析层次 | SG 分析内容 |
|---|---|---|---|---|
| bib 已有 | Bouton, *Nim, a Game with a Complete Mathematical Theory* (1901/1902) | 标准 Nim | 完整 SG | 用二进制 nim-sum 刻画所有 P-positions 和获胜走法。按现代术语，单堆大小就是其 SG 值。 |
| 新发现 | Jenkyns and Mayberry, *The Skeleton of an Impartial Game and the Nim-Function of Moore’s Nim\(k\)* (1980) | Moore’s Nim | 完整 SG，受限情形 | 对 \(k+1\) 堆的 Moore’s Nim 给出显式 nim-function，成为后来 JM 公式的基础。 |
| 新发现 | Boros et al., *On the Sprague–Grundy Function of Exact \(k\)-Nim* (2018) | Exact \(k\)-Nim | 完整 SG，受限参数 | 对每步恰好减少 \(k\) 堆的游戏，在 \(2k\geq n\) 时给出显式 SG 公式。 |
| 新发现 | Boros et al., *Sprague–Grundy Function of Symmetric Hypergraphs* (2019) | symmetric hypergraph Nim | 完整 SG，特定类别 | 刻画哪些对称超图上的 Nim 满足 Jenkyns–Mayberry SG 公式。 |
| 新发现 | Boros et al., *Sprague–Grundy Function of Matroids and Related Hypergraphs* (2019) | matroid/hypergraph Nim | 完整 SG，特定类别 | 对若干超图类给出显式 SG 公式，并刻画二维超图和拟阵中公式成立的条件。 |
| 新发现 | Boros et al., *On the Sprague–Grundy Function of Extensions of Proper Nim* (2021) | Proper Nim 的 Tetris 扩展 | 完整 SG | 研究 Proper Nim 扩展中 SG 函数何时等于 Tetris function，并给出相应刻画。 |
| 新发现 | Farr and Ho, *The Sprague–Grundy Function for Some Nearly Disjunctive Sums of Nim and Silver Dollar Games* (2018) | Star Nim、Star Silver Dollar | 较完整 SG | 把弱交互子游戏的 SG 计算约化到较小位置，并计算任意 \(g\)-positions 及其最终加法周期性。 |
| 新发现 | Horrocks and Horrocks, *Sprague–Grundy Values of Modular Nim* (2019) | Modular/Kotzig’s Nim | 部分 SG | 不只计算 P-positions，还计算若干参数情形下的非零 SG values。 |
| bib 已有 | Ho, *Three-Pile Sharing Nim and the Quadratic Time Winning Strategy* (2016) | 三堆 Sharing Nim | 部分 SG | 给出 P-position 公式、SG=1 位置公式，研究 nim-sequence 的回文性、分布和周期性。 |
| bib 已有 | Dufour and Heubach, *Circular Nim Games* (2013) | Circular Nim \(CN(n,k)\) | SG=0 | 对若干较小的 \(n,k\) 完整刻画 P-positions，并据此得到获胜走法。 |
| bib 已有 | Albert and Nowakowski, *Nim Restrictions* (2004) | 带限制的 Nim | SG=0 或策略 | 研究对下一步动作施加限制后的 Nim，给出相关游戏的解和获胜位置结构。 |
| bib 已有 | Gavel and Strimling, *Nim with a Modular Muller Twist* (2004) | 带模限制的 Muller-twist Nim | SG=0 或策略 | 玩家可以限制对手下一步取子数的模类；论文求解一大类参数情形。 |
| bib 已有 | Smith and Stănică, *Comply/Constrain Games or Games with a Muller Twist* (2002) | Comply/Constrain Nim-like games | SG=0 或策略 | 研究玩家为对手指定或限制下一步动作的游戏，给出多种游戏的 P/N 结构和策略。 |
| bib 已有 | Albert and Nowakowski, *The Game of End-Nim* (2001) | End-Nim | SG=0 或策略 | 求解只能从序列两端堆取子的 impartial 与 partizan 版本；其 impartial 解可以视为 P-position 分析。 |

## 3. Welter

| 状态 | 文章 | 对应游戏 | 分析层次 | SG 分析内容 |
|---|---|---|---|---|
| bib 已有 | Welter, *The Advancing Operation in a Special Abelian Group* (1952) | Welter’s game | 完整 SG | 建立后来称为 Welter function 的 nimber 计算结构，用公式表示多枚棋子位置的游戏值。 |
| bib 已有 | Kahane and Fraenkel, *\(k\)-Welter—A Generalization of Welter’s Game* (1987) | \(k\)-Welter | 部分至较完整 SG | 完整求解两枚棋子的任意 \(k\) 情形和若干一般情形，并证明 SG 函数在平移 \(k+1\) 下不变。 |
| bib 已有 | Ho, *The Max–Welter Game* (2014) | Max-Welter | 部分 SG | 完整刻画 P-positions 和 SG=1 位置，给出降维计算关系并研究 SG 周期性。 |

## 4. Wythoff

| 状态 | 文章 | 对应游戏 | 分析层次 | SG 分析内容 |
|---|---|---|---|---|
| bib 已有 | Blass and Fraenkel, *The Sprague–Grundy Function for Wythoff’s Game* (1990) | Wythoff’s game | 较完整 SG | 给出生成 SG 值的算法，刻画 SG=1 的位置，并研究这些位置与 P-positions 的距离关系。 |
| 新发现 | Dress, Flammenkamp, and Pink, *Additive Periodicity of the Sprague–Grundy Function of Certain Nim Games* (1999) | Wythoff 及更一般的 Nim-like graph games | SG 周期性 | 给出 SG 函数具有加法周期性的条件，并由 Wythoff 推广到有向图上的一类 impartial games。 |
| 新发现 | Nivasch, *More on the Sprague–Grundy Function for Wythoff’s Game* (2009) | Wythoff’s game | 部分 SG | 证明任意固定 SG 值 \(g\) 的位置靠近相应 P-positions，并提出快速递归计算的收敛猜想。 |
| 新发现 | Gu, *Sprague–Grundy Values of the \(\mathcal{R}\)-Wythoff Game* (2015) | \(\mathcal{R}\)-Wythoff | 部分 SG | 在已知 SG=0、1 的基础上完整刻画 SG=2、3 的位置，并猜测一般 \(g\)-positions 的形式。 |

## 5. Chomp

| 状态 | 文章 | 对应游戏 | 分析层次 | SG 分析内容 |
|---|---|---|---|---|
| bib 已有 | Zeilberger, *Three-Rowed CHOMP* (2001) | 三行 Chomp | SG=0 | 使用 Maple 和符号模式发现固定第三行时的 P-positions，并生成快速获胜算法。 |
| bib 已有 | Sun, *Improvements on Chomp* (2002) | 多行 Chomp | SG=0 | 扩展程序以计算任意行数的 P-positions，并给出部分特殊形状的 P-position 公式。 |
| bib 已有 | Brouwer et al., *On Three-Rowed Chomp* (2005) | 三行 Chomp | SG=0 | 定义递推函数表示 P-positions，给出计算三行 Chomp 获胜位置的三次时间算法。 |
| bib 已有 | Ahn et al., *On Variations of Nim and Chomp* (2018) | Monotonic Nim、Diet Chomp | SG=0 或策略 | 研究两种 Nim/Chomp 变体的获胜位置、受限动作和相应策略。 |

## 6. 其他游戏与通用方法

| 状态 | 文章 | 对应游戏 | 分析层次 | SG 分析内容 |
|---|---|---|---|---|
| bib 已有 | Guy and Smith, *The G-values of Various Games* (1956) | 多种 octal games，包括 Dawson’s Chess 等 | 完整或计算 SG | 系统计算一系列 octal game 的 G-value 序列并研究最终周期性，是计算 SG 序列的经典工作。 |
| bib 已有 | Grossman, *Periodicity in One-Dimensional Peg Duotaire* (2004) | 一维 Peg Duotaire | 部分至较完整 SG | 确定两个连续棋子区间被一个空位分隔时的 nim-values，并证明若干 SG 序列具有周期性。 |
| bib 已有 | Nivasch, *The Sprague–Grundy Function of the Game Euclid* (2006) | 等数时终止的 Euclid 版本 | 完整 SG | 给出该 Euclid 变体的显式 SG 函数公式。 |
| bib 已有 | Cairns, Ho, and Lengyel, *The Sprague–Grundy Function of the Real Game Euclid* (2011) | 出现 0 时终止的原始 Euclid game | 完整 SG | 给出原始 Euclid game 的显式 SG 公式，并解释它与另一 Euclid 版本的关系。 |
| 新发现 | Gurvich, *On the Misère Version of Game Euclid and Miserable Games* (2007) | misère Euclid、Nim | normal/misère SG | 比较 normal 与 misère SG 函数，精确说明二者在哪些 Fibonacci 型位置上不同。 |
| bib 已有 | Beling and Rogalski, *On Pruning Search Trees of Impartial Games* (2020) | Nim、Chomp、Cram | SG 计算算法 | 为 mex 型 SG 搜索设计通用剪枝算法，并直接在 Nim、Chomp、Cram 上计算 SG values。 |
| bib 已有 | Lemoine and Viennot, *Nimbers Are Inevitable* (2012) | Sprouts、Cram | SG 计算算法 | 证明对可分解游戏，计算子游戏 nimber 比直接搜索总和更有效，并给出 Sprouts、Cram 的计算结果。 |
| bib 已有 | Uiterwijk, *Solving Cram Using Combinatorial Game Theory* (2019) | Cram | SG 或分解计算 | 将棋盘拆成独立子游戏，计算各子游戏 nimber，再用 nim-sum 合并并构建终局数据库。 |
| bib 已有 | Beaulieu, Burke, and Duchêne, *Impartial Coloring Games* (2013) | 六类图染色游戏，重点是路径和环 | SG=0 及部分完整 SG | 对路径和环研究 P/N positions 与 Grundy values，并给出部分多项式计算结果。 |
| bib 已有 | Gurvich and Ho, *On Tame, Pet, Domestic, and Miserable Impartial Games* (2018) | Nim、Euclid、Wythoff 变体、subtraction games | SG 分类 | 比较 normal 与 misère SG 函数，根据二者的取值关系把游戏分成 tame、pet、domestic 和 miserable 等类。 |
| bib 已有 | Fraenkel and Yesha, *The Generalized Sprague–Grundy Function and Its Invariance under Certain Mappings* (1986) | 含环或 loop 的有向图博弈 | 广义 SG | 统一三种广义 SG 定义，给出多项式计算算法和求和游戏策略，并证明映射下的不变性。 |
| bib 已有 | Fraenkel and Rahat, *Infinite Cyclic Impartial Games* (2001) | 无限、允许循环的 impartial games | 广义 SG | 将 SG/nimber 思想推广到无限循环博弈，处理普通有限无环 SG 理论不能覆盖的重复状态。 |

- 
