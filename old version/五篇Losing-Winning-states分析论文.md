# Losing/Winning States 分析论文

## 标准

- **Losing state（P-position）**：在 normal play 下，轮到当前玩家行动时，若双方都采取最优策略，则当前玩家必败。
- **Winning state（N-position）**：在 normal play 下，轮到当前玩家行动时，当前玩家至少有一步能够保证最终获胜。
- 对终止的两人无偏组合博弈，只要完整刻画 losing states，winning states 就是其补集；相应获胜策略是从 winning state 移动到某个 losing state。
- 本文档只记录论文对 losing/winning states 的判定、公式和获胜走法，不讨论非零 Grundy 值、nimber 或完整 Sprague--Grundy 函数。
- 个别论文还包含其他分析。例如，*Nim Restrictions* 的后半部分研究两堆 Greedy Nim 的非零取值，*The Game of End-Nim* 还研究 partizan 版本；这些内容均不纳入本文档。

## 论文对比

| 年份 | BibTeX 键 | 论文 | 期刊 | 分析的具体游戏 | Losing/Winning states 结果 | 适用范围与局限 |
|---|---|---|---|---|---|---|
| 2026 | `DufH2026` | Dufour and Heubach, *On the P-Positions of Some Infinite Families of Slow A-Nim* | *INTEGERS: Electronic Journal of Combinatorial Number Theory* | Slow \(A\)-Nim：给定 \(n\) 个堆和集合 \(A\subseteq\{1,\ldots,n\}\)，每步选择某个 \(a\in A\)，再从恰好 \(a\) 个非空堆中各取一枚棋子 | 完整刻画两个非平凡无限族 \(A=\{n-1\}\) 和 \(A=\{n-1,n\}\) 的 losing states，并把它们表示为总棋子数的模信息与奇数堆数量所满足的区域条件。 | 尚未解决任意集合 \(A\)。对于 \(A=\{1,2\}\) 只处理了 \(n=3,4,5\)，而“至少选择 \(k\) 个堆”的更一般结构仍是猜想。 |
| 2025 | `OgiS2025` | Oginuma and Shinoda, *Shrinking Circular Nim* | *Journal of Information Processing* | Shrinking Circular Nim：沿圆周排列若干堆并选择连续堆取子，但一个堆清空后会从圆中删除，剩余堆重新相邻 | 给出不超过五堆时所研究参数的 winning conditions，特别完整刻画 \(SCN(4,2)\)、\(SCN(5,2)\) 和 \(SCN(5,3)\) 的 losing states | 没有统一求解任意 \(SCN(n,k)\)。\(SCN(6,2)\)、\(SCN(6,3)\)、\(SCN(6,4)\) 和 \(SCN(7,4)\) 等情形仍未完全解决 |
| 2021 | `DufHV2021` | Dufour, Heubach, and Vo, *Circular Nim Games CN(7,4)* | *INTEGERS: Electronic Journal of Combinatorial Number Theory* | Circular Nim \(CN(7,4)\)：七个堆首尾相接，每步选择四个连续堆，并从其中至少一个堆取走正数枚棋子 | 完整刻画 \(CN(7,4)\) 的 losing states。 | 结论完整解决的是单个参数情形 \(CN(7,4)\)，不是任意 Circular Nim 的统一公式； |
| 2013 | `DufH2013` | Dufour and Heubach, *Circular Nim Games* | *The Electronic Journal of Combinatorics* | Circular Nim \(CN(n,k)\)：\(n\) 个堆首尾相接，每步可同时减少至多 \(k\) 个连续堆中的任意若干堆 | 完整刻画若干参数族的 losing states：一般情形 \(CN(n,1)\)、\(CN(n,n)\) 和 \(CN(n,n-1)\)，以及 \(CN(4,2)\)、\(CN(5,2)\)、\(CN(5,3)\)、\(CN(6,3)\)、\(CN(6,4)\) 和 \(CN(8,6)\)。例如，\(CN(4,2)\) 的 losing states 恰为循环旋转意义下的 \((a,b,a,b)\)； | 不是对任意 \((n,k)\) 的统一求解；论文明确留下 \(CN(6,2)\) 等情形，并指出 \(n\) 增大后 losing set 的结构迅速复杂化。 |
| 2004 | `AlbN2004` | Albert and Nowakowski, *Nim Restrictions* | *INTEGERS: Electronic Journal of Combinatorial Number Theory* | 每步只能操作一个指定堆的多种 Nim 变体，包括 Greedy Nim、greedy small-cells、greedy explosive-cells 和 Pointed Nim | Greedy Nim 的 losing states 恰为“最大堆出现偶数次”的局面。Greedy small-cells 的 losing states 是空局面，或最大占用格编号为偶数且其前一格也被占用的局面。Greedy explosive-cells 通过从最大棋子向下读取连续奇偶对的递归结构刻画 losing states。Pointed Nim 的 losing states 恰为“非空堆数为偶数且指针指向一个最小堆”的局面。 | P/N 结论完整覆盖论文前半部分明确给出的四类游戏，但不能据此求解任意“只能动指定堆”的 Nim 规则。 |
| 2004 | `GavS2004` | Gavel and Strimling, *Nim with a Modular Muller Twist* | *INTEGERS: Electronic Journal of Combinatorial Number Theory* | Modular blocking Nim：玩家取子后，用模约束禁止对手下一步取走某些余数类 | 对 \(k\)-blocking modular Nim，论文证明 winning state 要么能改变某个商使异或和归零，要么能在保持商不变时降低余数，并在移动后施加足够严格的约束。 | 定理要求能够使用最严格的约束“禁止 \(1,\ldots,k\)”；若允许的约束组合不包含该约束，原刻画可能失效。任意约束子集下的一般问题仍未解决。 |
| 2002 | `SmiS2002` | Smith and Stănică, *Comply/Constrain Games or Games with a Muller Twist* | *INTEGERS: Electronic Journal of Combinatorial Number Theory* | Odd-or-Even Nim，以及 Fibonacci-or-Not Nim 等由前一位玩家限制下一步取子类型的游戏 | 对 Odd-or-Even Nim 给出完整 losing-state 定理：当前约束为 even 且堆大小的 nim-sum 为 \(0\) 或 \(1\)，或者当前约束为 odd、所有堆均为偶数且 nim-sum 为 \(0\)。论文还用筛法列出一堆 Fibonacci-or-Not Nim 在堆大小不超过 \(500\) 时的 losing states，并给出两堆版本的有限范围数据。 | Odd-or-Even Nim 得到完整 P/N 分类；Fibonacci-or-Not Nim 只有有限范围计算，论文明确说明一般 \(n\) 的简单判定规则仍未知。 |
| 2001 | `AlbN2001` | Albert and Nowakowski, *The Game of End-Nim* | *Electronic Journal of Combinatorics* | Impartial End-Nim：若干非空堆排成一列，每步只能减少最左端或最右端的堆 | 论文给出识别所有 losing states 的有限规则。 | 这里总结的是 normal-play impartial End-Nim 的 losing states。 |

## BibTeX 条目

```bibtex
@article{DufH2026,
	author    = {Matthieu Dufour and Silvia Heubach},
	title     = {{On the {$\mathcal{P}$}-Positions of Some Infinite Families of Slow {$A$}-Nim}},
	journal   = {Integers: Electronic Journal of Combinatorial Number Theory},
	volume    = {26},
	number    = {G3},
	pages     = {1--25},
	year      = {2026}
}

@article{OgiS2025,
	author    = {Hiromi Oginuma and Masato Shinoda},
	title     = {{Shrinking Circular Nim}},
	journal   = {Journal of Information Processing},
	volume    = {33},
	pages     = {1064--1070},
	year      = {2025}
}

@article{DufHV2021,
	author    = {Matthieu Dufour and Silvia Heubach and Anh Vo},
	title     = {{Circular Nim Games {$CN(7,4)$}}},
	journal   = {Integers: Electronic Journal of Combinatorial Number Theory},
	volume    = {21B},
	number    = {A9},
	pages     = {1--18},
	year      = {2021}
}

@article{DufH2013,
	author    = {Matthieu Dufour and Silvia Heubach},
	title     = {{Circular Nim Games}},
	journal   = {The Electronic Journal of Combinatorics},
	volume    = {20},
	issue     = {2},
	number    = {P22},
	pages     = {1--26},
	year      = {2013}
}

@article{AlbN2004,
	title     = {{Nim Restrictions}},
	author    = {Michael H. Albert and Richard J. Nowakowski},
	journal   = {Integers: Electronic Journal of Combinatorial Number Theory},
	volume    = {4},
	number    = {G1},
	pages     = {1--10},
	year      = {2004}
}

@article{GavS2004,
	title     = {{Nim with a Modular Muller Twist}},
	author    = {Hillevi Gavel and Pontus Strimling},
	journal   = {Integers: Electronic Journal of Combinatorial Number Theory},
	volume    = {4},
	number    = {G4},
	pages     = {1--9},
	year      = {2004}
}

@article{SmiS2002,
	title     = {{Comply/Constrain Games or Games with a Muller Twist}},
	author    = {Furman Smith and Pantelimon St\u{a}nic\u{a}},
	journal   = {Integers: Electronic Journal of Combinatorial Number Theory},
	volume    = {2},
	number    = {G3},
	pages     = {1--10},
	year      = {2002}
}

@article{AlbN2001,
	title     = {{The Game of End-Nim}},
	author    = {Michael H. Albert and Richard J. Nowakowski},
	journal   = {Electronic Journal of Combinatorics},
	volume    = {8},
	issue     = {2},
	number    = {R1},
	pages     = {1--12},
	year      = {2001}
}
```

## Manuscript-ready paragraph

Existing work characterizes winning and losing states without determining the complete Sprague--Grundy function. Such classifications have been obtained for impartial End-Nim \cite{AlbN2001}, Odd-or-Even Nim and related comply/constrain games \cite{SmiS2002}, several single-heap-restricted Nim variants \cite{AlbN2004}, modular blocking Nim \cite{GavS2004}, and selected parameter families of Circular Nim \cite{DufH2013,DufHV2021}. More recent work has characterized winning conditions for Shrinking Circular Nim \cite{OgiS2025} and the losing positions of several infinite families of Slow $A$-Nim \cite{DufH2026}. These works typically identify a candidate set of losing positions and prove both that no move connects two positions in this set and that every position outside it admits a move into the set. Consequently, they provide exact outcome tests and winning moves for the covered games, while stopping short of assigning a nonzero nimber to every winning position.
