# Sprague–Grundy 函数论文

## 标准

- **完整 SG 分析**：在相应定理明确覆盖的参数范围或游戏子类中，能够确定每个合法局面的 SG 值。
- 因此，一篇论文不必解决其所定义的全部推广游戏；只要它对一个边界清楚的参数族给出任意合法局面的完整 SG 计算方法，就纳入本表。

## 论文对比

| 年份 | BibTeX 键 | 论文 | 分析的具体游戏 | 主要 SG 结果 | 适用范围与局限 |
|---|---|---|---|---|---|
| 2025 | `NivR2025` | Nivasch and Rubinstein, *A Convergence Technique for the Game \(i\)-MARK* | \(i\)-Mark\((\{1\},\{d_1,d_2\})\) | 提出基于收敛技术的多项式时间算法，可以计算任意位置 \(n\) 的 SG 值，从而在算法意义上完整确定该子类中每个游戏的 SG 函数。 | 该结果是一种高效的计算刻画，而不是简单的闭式公式；它也不能覆盖 \(S\) 和 \(D\) 的任意取值。 |
| 2021 | `BorGHM2021` | Boros et al., *On the Sprague–Grundy Function of Extensions of Proper Nim* | Proper Nim 的选择性复合扩展，也称 Tetris 型扩展 | 对至少包含三个堆的相应复合游戏给出完整的 SG 闭式公式。 | 公式仅适用于 \(n\geq3\)；\(n=2\) 的情形更加复杂，论文只给出了部分结果。 |
| 2019 | `BorGHMM2019a` | Boros et al., *Sprague–Grundy Function of Symmetric Hypergraphs* | 对称超图 Nim（symmetric hypergraph Nim） | 刻画其 SG 函数满足 Jenkyns–Mayberry 公式的对称超图；对于这些游戏，该公式能够确定每个局面的 SG 值。 | 结果对所刻画的 JM 类是完整的，但没有为所有对称超图给出统一的 SG 公式。 |
| 2019 | `BorGHMM2019b` | Boros et al., *Sprague–Grundy Function of Matroids and Related Hypergraphs* | 拟阵及相关超图上的 Nim（matroid and related hypergraph Nim） | 为若干超图类别给出显式 SG 公式，并刻画该公式适用的图和拟阵。 | 公式完整解决了满足相应条件的类别，包括论文所述的自对偶拟阵情形，但不能处理任意超图 Nim。 |
| 2018 | `BorGHMM2018` | Boros et al., *On the Sprague–Grundy Function of Exact \(k\)-Nim* | Exact \(k\)-Nim，即每一步必须恰好减少 \(k\) 个堆 | 当 \(2k\geq n\) 时，给出每个局面 SG 值的显式公式及其高效计算方法。 | 对于剩余的 \(2k<n\) 参数范围，论文没有给出一般性的完整刻画。 |
| 2016 | `Sop2016` | Sopena, *\(i\)-Mark: A New Subtraction Division Game* | 整数型减法—整除游戏 \(i\)-Mark\((S,D)\)：从 \(n\) 可移动到 \(n-s\)，或在 \(d\mid n\) 时移动到 \(n/d\) | 对 \(i\)-Mark\(([1,t-1],\{t\})\)、\(i\)-Mark\(([1,t-1],\{2\})\) 以及若干 \(i\)-Mark\((\{a,2a\},\{2\})\) 情形刻画 SG 序列的近似周期结构，并由此在 \(O(\log n)\) 时间内计算相应定义域中任意局面 \(n\) 的 SG 值。 | 完整计算结论只适用于论文明确证明的参数族；论文证明一般有限 \(S,D\) 的 SG 序列非周期，但没有解决任意 \(S,D\) 的完整 SG 函数。 |
| 2011 | `Fra2011` | Fraenkel, *Aperiodic Subtraction Games* | Mark：从整数 \(n\) 可移动到 \(n-1\) 或 \(\lfloor n/2\rfloor\) | 借助整数二进制表示刻画 Mark 的三值 SG 序列，并给出计算任意 \(n\) 的 SG 值的线性时间算法，因此也能处理多个 Mark 局面的和。 | 完整 SG 算法针对 Mark；论文对 UpMark 和 Mark-\(t\) 的讨论主要给出必胜策略与非周期性，不能统一视为这些推广游戏的完整 SG 解。 |
| 2011 | `cairns2011` | Cairns, Ho, and Lengyel, *The Sprague–Grundy Function of the Real Game Euclid* | 原始 Euclid game：局面为一对非负整数，每步从较大数中减去较小数的正整数倍，并以某一分量变为零作为终止条件 | 给出原始 Euclid game 的显式 SG 公式，可以确定定义域内任意整数对的 SG 值；同时说明该函数与“两个分量相等时终止”的 Euclid 变体之间的关系。 | 公式依赖原始 Euclid game 的移动规则与终止条件，不能直接用于其他 Euclid 变体。 |

##  BibTeX 条目

```bibtex
@article{NivR2025,
	title     = {{A Convergence Technique for the Game {$i$}-{MARK}}},
	author    = {Gabriel Nivasch and Oz Rubinstein},
	journal   = {Theoretical Computer Science},
	volume    = {1057},
	pages     = {115557},
	year      = {2025}
}

@article{BorGHM2021,
	title     = {{On the Sprague--Grundy Function of Extensions of Proper {Nim}}},
	author    = {Endre Boros and Vladimir Gurvich and Nhan Bao Ho and Kazuhisa Makino},
	journal   = {International Journal of Game Theory},
	volume    = {50},
	number    = {3},
	pages     = {635--654},
	year      = {2021}
}

@article{BorGHMM2019a,
	title     = {{Sprague--Grundy Function of Symmetric Hypergraphs}},
	author    = {Endre Boros and Vladimir Gurvich and Nhan Bao Ho and Kazuhisa Makino and Peter Mursic},
	journal   = {Journal of Combinatorial Theory, Series A},
	volume    = {165},
	pages     = {176--186},
	year      = {2019}
}

@article{BorGHMM2019b,
	title     = {{Sprague--Grundy Function of Matroids and Related Hypergraphs}},
	author    = {Endre Boros and Vladimir Gurvich and Nhan Bao Ho and Kazuhisa Makino and Peter Mursic},
	journal   = {Theoretical Computer Science},
	volume    = {799},
	pages     = {40--58},
	year      = {2019}
}

@article{BorGHMM2018,
	title     = {{On the Sprague--Grundy Function of Exact {$k$}-{Nim}}},
	author    = {Endre Boros and Vladimir Gurvich and Nhan Bao Ho and Kazuhisa Makino and Peter Mursic},
	journal   = {Discrete Applied Mathematics},
	volume    = {239},
	pages     = {1--14},
	year      = {2018}
}

@article{Sop2016,
	title     = {{$i$-Mark: A new subtraction division game}},
	author    = {Eric Sopena},
	journal   = {Theoretical Computer Science},
	volume    = {627},
	pages     = {90--101},
	year      = {2016}
}

@article{Fra2011,
	title     = {{Aperiodic subtraction games}},
	author    = {Aviezri S. Fraenkel},
	journal   = {Electronic Journal of Combinatorics},
	volume    = {18},
	number    = {19},
	pages     = {1--12},
	year      = {2011}
}

@article{cairns2011,
	title     = {{The Sprague--Grundy function of the real game Euclid}},
	author    = {Grant Cairns and Nhan Bao Ho and Tam{\'a}s Lengyel},
	journal   = {Discrete Mathematics},
	volume    = {311},
	number    = {6},
	pages     = {457--462},
	year      = {2011},
	publisher = {Elsevier}
}
```

## Manuscript-ready paragraph

Complete Sprague–Grundy analyses have been obtained for Mark \cite{Fra2011}, several parameterized subfamilies of \(i\)-Mark \cite{Sop2016,NivR2025}, extensions of proper Nim with at least three piles \cite{BorGHM2021}, and the original Euclid game \cite{cairns2011}.
