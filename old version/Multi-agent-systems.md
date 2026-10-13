# Multi-agent systems 相关工作扩充方案



## 一、核心文献

### 1. Coalition Logic：从“单个智能体做什么”转向“联盟能保证什么”

- **标题：** A Modal Logic for Coalitional Power in Games
- **作者：** Marc Pauly
- **发表年份：** 2002
- **简要描述：** 这篇论文提出 Coalition Logic，用来描述一组智能体联合行动后能够保证实现什么结果。公式 `[C]φ` 可以直观地理解为：联盟 `C` 存在一套联合选择，使得无论联盟外的智能体如何行动，结果都能满足 `φ`。它为后来的 ATL 和多智能体战略推理提供了一个重要起点，因为研究重点从“系统中是否存在某条路径”转向了“某个联盟是否有能力迫使目标成立”。

### 2. ATL：用时序逻辑直接表达联盟的战略能力

- **标题：** Alternating-Time Temporal Logic
- **作者：** Rajeev Alur、Thomas A. Henzinger、Orna Kupferman
- **发表年份：** 2002
- **简要描述：** 这篇论文提出 Alternating-Time Temporal Logic（ATL），把传统 CTL 中的“存在一条路径”和“所有路径”替换为“某个智能体联盟能够通过策略保证某种未来”。例如，它可以表达一组智能体能否保证最终到达目标状态，或者能否一直避免危险状态，而不用假设环境会配合。ATL 因此成为验证开放系统、博弈系统和多智能体系统战略能力的基础语言。

### 3. ATEL：把战略能力与智能体知识放进同一种逻辑

- **标题：** Cooperation, Knowledge, and Time: Alternating-Time Temporal Epistemic Logic and Its Applications
- **作者：** Wiebe van der Hoek、Michael Wooldridge
- **发表年份：** 2003
- **简要描述：** 这篇论文在 ATL 的战略与时序表达能力上加入知识算子，形成 Alternating-Time Temporal Epistemic Logic。它不仅能问“联盟有没有策略完成任务”，还可以进一步问“智能体是否知道如何完成任务”“成员之间是否具有合作所需的共同知识”。这很贴近真实分布式系统，因为策略通常只能依据各智能体掌握的局部信息来执行，而不能凭空读取完整的全局状态。

### 4. Strategy Logic：把策略本身当作可以量化和绑定的对象

- **标题：** Strategy Logic
- **作者：** Krishnendu Chatterjee、Thomas A. Henzinger、Nir Piterman
- **发表年份：** 2010
- **简要描述：** ATL 只能隐式地说“存在某种策略”，而这篇论文进一步允许在逻辑公式中显式量化策略，并把策略绑定给参与博弈的主体。这样便能比较不同策略、描述多个主体之间更复杂的策略依赖，并表达部分 ATL 难以表达的均衡或非零和博弈性质。代价是验证复杂度显著上升，因此它也自然引出了后续对可计算片段和高效模型检测方法的研究。

### 5. MCMAS：把知识、时间和战略性质变成可自动验证的问题

- **标题：** MCMAS: A Model Checker for the Verification of Multi-Agent Systems
- **作者：** Alessio Lomuscio、Hongyang Qu、Franco Raimondi
- **发表年份：** 2009
- **简要描述：** MCMAS 是一个面向多智能体系统的符号模型检测工具。用户输入智能体的局部状态、行动规则和待验证公式后，工具利用二元决策图（BDD）压缩并搜索庞大的全局状态空间，自动判断时序性质、知识性质和部分战略性质是否成立。它的重要性在于把多智能体逻辑从纯理论研究推进到可复现实验和实际系统验证。

### 6. 不可判定性边界：不完备信息加完美记忆为什么特别困难

- **标题：** Model-Checking ATL under Imperfect Information and Perfect Recall Semantics Is Undecidable
- **作者：** Cătălin Dima、Ferucio Laurențiu Țiplea
- **发表年份：** 2011
- **简要描述：** 这篇论文证明：当智能体看不到完整状态，却能够记住全部观察历史时，ATL 模型检测在一般情况下是不可判定的。通俗地说，不存在一个对所有此类系统都能保证终止并给出正确答案的通用算法。这个结果划出了自动验证的理论边界，也说明为什么后续工作需要限制记忆、限制逻辑表达能力，或者采用近似、抽象与精化方法。

### 7. 多智能体抽象—精化的早期统一框架（在AAAI-25中出现）

- **标题：** An Abstraction-Refinement Framework for Multi-Agent Systems
- **作者：** Thomas Ball、Orna Kupferman
- **发表年份：** 2006
- **简要描述：** 这篇论文把大型或无限状态的多智能体系统压缩成较小的抽象博弈，并用三值语义给出“真、假、未知”三种结果。抽象模型同时对智能体的能力进行上近似和下近似；如果公式在抽象模型中已经确定为真或假，就可以安全地把结论传回原系统；如果结果为未知，则只精化造成不确定性的部分。它奠定了后续多智能体抽象—精化研究的基本工作流。

### 8. 面向 ATL 的状态抽象与动作抽象（在AAAI-25中出现）

- **标题：** An Abstraction Technique for the Verification of Multi-Agent Systems Against ATL Specifications
- **作者：** Alessio Lomuscio、Jakub Michaliszyn
- **发表年份：** 2014
- **简要描述：** 这篇论文针对 interpreted systems 中的 ATL 验证，同时压缩状态和动作，构造三值抽象模型。若抽象模型把公式判定为真或假，该结论对具体系统仍然可靠；只有“未知”才意味着抽象过粗，需要继续拆分相关状态或动作。文章展示了如何把抽象理论具体用于多智能体战略能力验证，是从一般框架走向 ATL 专门方法的重要一步。

### 9. 用智能体专属谓词自动精化抽象模型（在AAAI-25中出现）

- **标题：** Agent-Based Refinement for Predicate Abstraction of Multi-Agent Systems
- **作者：** Francesco Belardinelli、Alessio Lomuscio、Jakub Michaliszyn
- **发表年份：** 2016
- **简要描述：** 这篇论文面向可能具有无限状态空间的多智能体系统，先用少量谓词把大量具体状态归并为有限抽象状态。如果验证结果是未知，算法会定位导致不确定性的 failure states，并利用 Craig interpolation 自动生成新的、与特定智能体有关的谓词。换句话说，它不是盲目扩大整个模型，而是只补上当前证明缺少的区分信息，从而逐步把粗糙模型变得足够精确。

### 10. 不完备信息和完美记忆下的三值抽象—精化（在AAAI-25中出现）

- **标题：** An Abstraction-Refinement Framework for Verifying Strategic Properties in Multi-Agent Systems with Imperfect Information
- **作者：** Francesco Belardinelli、Angelo Ferrando、Vadim Malvone
- **发表年份：** 2023
- **简要描述：** 这篇论文处理一个特别困难的场景：智能体只能看到局部信息，但策略可以依赖完整的观察历史。作者用完备信息抽象模型和三值 ATL/ATL* 语义近似原系统，再借助 LTL 自动机寻找造成“未知”的 failure states，并据此精化模型。由于原问题不可判定，该方法能够保证已经给出的真或假结论是可靠的，但不能保证每个输入最终都得到确定答案；这是一种有明确理论边界的可靠近似方法。

## 二、可扩展文献

### 11. 用有限记忆在真实性与可计算性之间折中

- **标题：** Alternating-Time Logic with Imperfect Recall
- **作者：** Pierre-Yves Schobbens
- **发表年份：** 2004
- **简要描述：** 这篇论文系统讨论智能体拥有完备或不完备信息、完美或不完美记忆时，ATL 会发生什么变化。它把智能体的记忆显式限制为有限结构，使模型比“能够看到一切”的假设更真实，同时又避免完美记忆与部分观察组合导致的许多不可判定问题。它适合作为“为什么限制记忆能够换回可验证性”的直观桥梁文献。

### 12. 更一般的 Strategy Logic 及其可计算片段

- **标题：** Reasoning About Strategies: On the Model-Checking Problem
- **作者：** Fabio Mogavero、Aniello Murano、Giuseppe Perelli、Moshe Y. Vardi
- **发表年份：** 2014
- **简要描述：** 这篇论文提出一种更一般的 Strategy Logic，其中策略不是天然固定给某个智能体，而是先量化为变量，再通过绑定算子交给智能体使用。因此，同一策略可以被共享、复用，也能更自然地表达策略之间的依赖。论文同时指出完整逻辑的模型检测具有非初等复杂度，并研究 SL[NG]、SL[BG]、SL[1G] 等片段，说明增加表达能力会怎样提高计算代价，以及如何通过限制语法恢复较可控的验证复杂度。

### 13. 用 BDD 实现知识与策略的符号模型检测

- **标题：** Symbolic Model Checking Epistemic Strategy Logic
- **作者：** Xiaowei Huang、Ron van der Meyden
- **发表年份：** 2014
- **简要描述：** 这篇论文针对带知识算子的策略逻辑设计了基于 BDD 的符号模型检测算法。在其观察语义下，智能体只能依据自己能够区分的信息选择策略，因此比假设全局可见更符合真实系统。作者实现了模型检测器，并在列车控制案例中测试，展示了符号表示相较于此前部分符号化方案在处理状态空间时的优势。

### 14. 在表达能力和可实现验证之间选择 SL[1G]

- **标题：** Verifying and Synthesising Multi-Agent Systems against One-Goal Strategy Logic Specifications
- **作者：** Petr Čermák、Alessio Lomuscio、Aniello Murano
- **发表年份：** 2015
- **简要描述：** 完整 Strategy Logic 很强，但验证代价过高；这篇论文转而研究 One-Goal Strategy Logic（SL[1G]）。SL[1G] 的表达能力严格强于 ATL*，却保留了相对可控的复杂度，并允许算法不仅判断策略是否存在，还实际合成策略。作者提出基于自动机和 BDD 的验证、综合方法，并用公平进程调度案例说明这种折中具有实际实现价值。

### 15. 用 SMT 自动生成 ATLK 谓词抽象（在AAAI-25中出现）

- **标题：** Verification of Multi-Agent Systems via Predicate Abstraction against ATLK Specifications
- **作者：** Alessio Lomuscio、Jakub Michaliszyn
- **发表年份：** 2016
- **简要描述：** 这篇论文针对可能包含整数变量等无限数据域的多智能体系统，用谓词把无限多具体状态映射到有限抽象状态，再用三值 ATLK 同时分析时间、知识和战略能力。实现工具 MCMAS-PA 将 BDD 与 SMT 求解器结合，自动产生并处理抽象谓词。其结论是可靠但可能不完备的：确定的真或假可以传回原模型，而未知表示当前抽象还不够精细。

### 16. CEGAR：抽象—检查反例—精化的通用方法论来源

- **标题：** Counterexample-Guided Abstraction Refinement
- **作者：** Edmund M. Clarke、Orna Grumberg、Somesh Jha、Yuan Lu、Helmut Veith
- **发表年份：** 2000
- **简要描述：** 这篇论文提出经典的 Counterexample-Guided Abstraction Refinement（CEGAR）思想：先在较小的粗抽象上验证性质；如果出现反例，就检查它在具体系统中是否真的可执行；若反例只是抽象造成的假象，就找出缺失的状态区别并精化模型，然后重新验证。它本身并不专门面向多智能体系统，但“从粗模型开始，只根据伪反例补充必要细节”的循环成为后来多智能体抽象—精化方法的核心方法论基础。

### 17. 用三值抽象提高 Strategy Logic 验证的可扩展性（在AAAI-25中出现）

- **标题：** Scalable Verification of Strategy Logic through Three-Valued Abstraction
- **作者：** Francesco Belardinelli、Angelo Ferrando、Wojciech Jamroga、Vadim Malvone、Aniello Murano
- **发表年份：** 2023
- **简要描述：** Strategy Logic 能表达复杂的策略量化、策略绑定以及智能体之间的策略依赖，但完整逻辑的模型检测具有非初等复杂度，很难直接用于较大系统。这篇论文没有通过删减逻辑语法来降低表达能力，而是为 Strategy Logic 定义三值语义和抽象方法：抽象模型给出的“真”或“假”可以可靠地传回具体模型，“未知”则表示当前抽象还不足以作出判断。作者进一步扩展 MCMAS，使其能够执行这种抽象验证，并通过实验说明三值抽象有助于缓解状态空间和策略空间带来的计算压力。

### 18. 将 Situation Calculus 抽象扩展到多智能体同步博弈（在AAAI-25中出现）

- **标题：** Abstraction of Situation Calculus Concurrent Game Structures
- **作者：** Yves Lespérance、Giuseppe De Giacomo、Maryam Rostamigiv、Shakil M. Khan
- **发表年份：** 2024
- **简要描述：** 这篇论文把 Situation Calculus 中的高层—低层抽象方法扩展到多智能体同步博弈。系统中的多个智能体在每一轮同时选择动作，所有动作的组合共同决定下一状态；作者分别给出抽象和具体的 synchronous game structures，并用 refinement mapping 描述一个高层动作如何由具体的 Golog 程序实现。论文还使用一阶版本的 alternating-time μ-calculus 表达联盟的战略性质，因此它直接连接了多智能体博弈、Situation Calculus、战略逻辑以及抽象验证，也与图片出处论文的研究路线最为接近。

## 三、建议写入论文的组织方式

1. **逻辑基础。** 先用 Coalition Logic 和 ATL 说明多智能体验证关注的是“某个联盟是否有策略保证目标”，再用 ATEL 和 Strategy Logic 分别引入知识与显式策略量化。
2. **信息和记忆带来的困难。** 用 Schobbens 的有限记忆工作说明现实建模中的折中，再用 Dima 和 Țiplea 的不可判定性结果明确一般算法的理论边界。
3. **从逻辑到工具。** 介绍 MCMAS、BDD 符号模型检测以及 SL[1G] 的验证和策略合成，说明理论语言如何进入自动化工具。
4. **抽象—精化主线。** 从 CEGAR 和 Ball–Kupferman 的三值框架开始，依次介绍 ATL 状态/动作抽象、ATLK 谓词抽象、智能体专属谓词精化、不完备信息和完美记忆下的近似框架，以及 Strategy Logic 和 Situation Calculus concurrent games 中的扩展。

如果篇幅有限，建议优先引用第 2、5、6、7、8、9、10、16、17、18 篇；其余文献用于补充逻辑演化、知识语义、有限记忆和工具实现。
