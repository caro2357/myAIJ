# Appendix Formalization Fix Summary

This file summarizes the red corrective lines added in Appendix A of [AIJ-2025 (ver 2.3).tex](./AIJ-2025%20(ver%202.3).tex).

## Subtraction Games

### Take Away
- Lines 3558-3559:
  Fixed LaTeX syntax in `\pre(take(k))` and `\eff(take(k))` directly.

### Subtraction
- Line 3584:
  Added red correction
  `\pre(take(k)) : (\bigvee_{s \in S} k = s) \land v \geq k`
  to replace the incorrect use of `v \ge \min(S)`.

### S,D-Mark
- Line 3608:
  Added red correction
  `\pre(take_1(k)) : (\bigvee_{s \in S} k = s) \land v \geq k`.
- Line 3611:
  Added red correction
  `\pre(take_2(k)) : k > 0 \land \bigvee_{d \in D} k \cdot d = v`.

## Nim Games

### Monotonic Nim
- Line 3667:
  Added red correction so the monotonicity check only applies when `i < 3`.

### Empty and Transfer
- Lines 3693, 3698, 3703:
  Added red corrections requiring `k_2 > 0` and strict inequality `v_j > k_2`, matching “transfer some but not all”.

### Empty All But One
- Line 3733:
  Added red correction changing
  `k_1 + k_2 + k_3 \le v_i`
  to
  `k_1 + k_2 + k_3 = v_i`.

### Empty and Redistribute
- Line 3761:
  Added red correction
  `\estate: v_1 + v_2 + v_3 < 3`.
- Line 3763:
  Added red correction to the action set:
  `\act: \set{empty_i(k_1, k_2, k_3) \mid 1 \le i \le 3}`.
- Line 3767:
  Added red correction to the precondition using indexed `empty_i`.
- Line 3770:
  Added red correction to the effect using indexed `empty_i`.

### Min Game
- Line 3833:
  Added red correction changing the action range from `1 \le i \le 3` to `1 \le i \le 2`.

### l-Slow Nim
- Line 3868:
  Added red correction inserting the missing positivity condition `k > 0`.

### Odd-or-Even Nim
- Line 3972:
  Added red correction replacing the action set with
  `\set{specify(k), take_{1e}(k), take_{1o}(k), take_{2e}(k), take_{2o}(k)}`.

### Pointed Nim
- Line 4012:
  Added red correction
  `\estate: \bigwedge_{i=1}^{3} v_i = 0`.
- Line 4015:
  Added red correction to the precondition, requiring a legal next pointer `k_2`.
- Line 4018:
  Added red correction to the effect:
  `\eff(take_i(k_1,k_2)) : \set{\tuple{\true, v_i, v_i-k_1}, \tuple{\true, r, k_2}}`.

### End Nim
- Line 4040:
  Added red correction changing `k > 1` to `k > 0`.

### Staircase Nim
- Line 4085:
  Added red correction for `take_1(k)` so it allows any positive `k`.
- Line 4088:
  Added red correction restricting the generic action line to `1 < i \le 3` and allowing `k > 0`.

### Circular Nim
- Line 4121:
  Added red correction replacing the malformed precondition with a properly indexed one over `k_j`.
- Line 4124:
  Added red correction replacing the malformed circular effect indices with normalized 1-based indices.

## Wythoff Games

### l-Wythoff
- Line 4334:
  Added red correction allowing the case `k_1 = k_2`, since the rule is `|k_1-k_2| < l`.

### Monotonic l-Diet Wythoff
- Line 4356:
  Added red correction replacing comma-separated terminal state with
  `v_1 = 0 \wedge v_2 = 0`.
- Line 4363:
  Added red correction changing `k_1 < m_1` to `k_1 \le m_1`.

### Wythoff with subtraction set S
- Line 4396:
  Added red correction inserting the missing positivity condition `k_1 > 0` for the diagonal move.

### Wythoff with a function f
- Line 4424:
  Added red correction changing `f(k)` to `f(k_1)`.

### 1st (l1, l2)-restricted Wythoff
- Line 4457:
  Added red correction replacing the first disjunction by the required conjunction:
  both piles after the Wythoff move must satisfy the `l_1` lower bound.

### 2nd (l1, l2)-restricted Wythoff
- Lines 4491-4494:
  Fixed the missing closing parenthesis in the original formula directly.

### 4th (l1, l2)-restricted Wythoff
- Line 4561:
  Added red correction moving `v_2 \le m` into `\constraint`.
- Line 4563:
  Added red correction removing `v_2 \le m` from `\estate`.

## Chomp Games

### Chomp
- Line 4597:
  Added red correction restoring the board-shape invariant
  `v_1 \ge v_2 \ge v_3`
  in the state constraint.

### L-shaped Chomp
- No red corrective line was added in this subsection.

## Notes

- The red lines were intentionally added without deleting the original wrong lines, following the requested editing policy.
- LaTeX syntax errors were fixed directly where they would otherwise break compilation.
- After these edits, `pdflatex -interaction=nonstopmode "AIJ-2025 (ver 2.3).tex"` compiled successfully.
