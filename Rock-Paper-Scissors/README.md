下文分别以$x$和$y$表示player1和player2的混合策略，以$x^{*}$和$y^{*}$表示局中人1和2的混策略纳什均衡。

在二人有限零和博弈中，设player1有$m$个纯策略$\alpha_1, \alpha_2, \cdots， \alpha_m$，player2有$n$个纯策略$\beta_1, \beta_2, \cdots, \beta_n$。当player1选定纯策略$\alpha_i$和player2选定纯策略$\beta_j$后，就形成了一个纯策略组合$(\alpha_i, \beta_j)$，可见这样的纯策略组合共有$m\times n$个。对任一纯策略组合$(\alpha_i, \beta_j)$，记player1的收益值为$a_{i j}$，称$\mathbf{A}=(a_{i j})$为player1的收益矩阵。由于对策为零和的，故player2的收益矩阵为$-\mathbf{A}$。在此意义下，二人有限零和博弈可被表示为**矩阵博弈**，这也是下文讨论对偶线性规划的基础，该算法仅可针对二人有限零和博弈给出求解。

在正式引入对偶线性规划法前，先介绍下面两个定理。

### 定理 1
二人零和博弈$G=\left \{\left \{ 1,2 \right \} \left \{ S_1,S_2 \right \} \left \{ u_1,u_2 \right \} \right \}$在混合策略意义下有解的充要条件是：存在$x^* \in S_1, y^* \in S_2$，使得对任意$x \in S_1$和$y \in S_2$，有
$$
E(x,y^*) \le E(x^*,y^*) \le E(x^*,y)
$$
这里，$E(x, y) = x^\top \mathbf{A} y = \sum_i \sum_j a_{i j} x_i y_j$，表示混合策略意义下的收益函数（期望）。这里$(x^*,y^*)$就是对应的均衡混合策略组合。

当解存在时，
$$
V_G = \max_{x \in S_1^*} \min_{y \in S_2^*} E(x,y)
= \min_{y \in S_2^*} \max_{x \in S_1^*} E(x,y)
= E(x^*,y^*)
$$


可以证明，该定理有以下等价表示：

### 定理 2
设$x^* \in S_1, y^* \in S_2$，则$(x^*,y^*)$是$G$的解的充要条件是：对任意$i=1,\cdots,m$和$j=1,\cdots,n$，有
$$
E(i,y^*) \le E(x^*,y^*) \le E(x^*,j)
$$
这里，$E(i,y) = \sum_j a_{i j} y_j$，表示参与人1取纯策略$\alpha_i$而参与人2取混合策略$y$时的收益函数，$E(x,j)$同理。$(x^*,y^*)$就是对应的均衡混合策略组合。


该定理表明，在考虑二人零和博弈的混合策略时，可以先使其中一位player选取纯策略，而研究另一位player的混合策略，不影响最终的结果，可以简化对解的求解与验证。

下面正式引入求解二人零和博弈的对偶线性规划法。

对任一二人零和博弈$G=\left \{\left \{ 1,2 \right \} \left \{ S_1,S_2 \right \} \left \{ u_1,u_2 \right \} \right \}$，为使上述定理中的不等式成立，考虑如下两个线性规划问题：

$$\max w$$
$$
\text{(P)} \left \{
\begin{array}{lr}
    \sum_i a_{i j} x_i \ge w, & j = 1,\cdots,n \\
    \sum_i x_i = 1 & \\
    x_i \ge 0, & i = 1,\cdots,m
\end{array}
\right.
$$
和
$$\min v$$
$$
\text{(D)} \left \{
\begin{array}{lr}
    \sum_j a_{i j} y_j \le v, & i = 1,\cdots,m \\
    \sum_j y_j = 1 & \\
    y_j \ge 0, & j = 1,\cdots,n
\end{array}
\right.
$$

其中问题(P)和(D)是互为对偶的线性规划问题。由线性规划的对偶理论知，问题(P)和(D)分别存在最优解$(x^*,w^*)$和$(y^*,v^*)$，且$v^*=w^*$。

可以证明，$v^*=E(x^*,y^*)$，即线性规划的最优解就是博弈问题$G$在混合策略意义下的解。从而只需求解该对偶线性规划问题，即可得到该博弈问题的解。

以上推导中的形式并不便于使用计算机进行求解，下面进行适当变形，转化为我们熟悉的形式。

首先引入二人零和博弈求解的平移对称定理。

### 定理 3
记二人零和博弈$G$的解集为$T(G)$。设有两个二人零和博弈$G_1 =\left \{\left \{ 1,2 \right \} \left \{ S_1,S_2 \right \} \left \{ u_1,u_2 \right \} \right \}, G_2 =\left \{\left \{ 1,2 \right \} \left \{ S_1,S_2 \right \} \left \{ u_1^{'},u_2^{'} \right \} \right \}$，其中$\mathbf{A}^{'} = \mathbf{A} + L$（或者说$u_1^{'} = u_1 + L$），$L$为一常数，则有
1. $V_{G_2} = V_{G_1} + L$
2. $T(G_1) = T(G_2)$

在问题(P)中，令（不妨设$w > 0$，若不然，由上述定理，只需将收益函数加上一个常数使收益矩阵的元素均大于0）
$$
x_i^{'} = \frac{x_i}{w} \quad i = 1,\cdots,m
$$
则问题(P)的约束条件变为：
$$
\left \{
\begin{array}{ll}
    \sum_i a_{i j} x_i^{'} \ge 1, & j = 1,\cdots,n \\
    \sum_i x_i^{'} = \frac{1}{w} & \\1
    x_i^{'} \ge 0, & i = 1,\cdots,m
\end{array}
\right.
$$

故问题(P)等价于线性规划问题(P$^{'}$)：
$$
\left \{
\begin{array}{ll}
    \min \sum_i x_i^{'} & \\
    \sum_i a_{i j} x_i^{'} \ge 1, & j = 1,\cdots,n \\
    x_i^{'} \ge 0 & i = 1,\cdots,m
\end{array}
\right.
$$

同理，令
$$
y_j^{'} = \frac{y_j}{v} \quad j = 1,\cdots,n
$$
可知问题(D)等价于线性规划问题(D$^{'}$)：
$$
\left \{
\begin{array}{ll}
    \max \sum_j y_j^{'} & \\
    \sum_j a_{i j} y_j^{'} \le 1, & i = 1,\cdots,m \\
    y_j^{'} \ge 0 & j = 1,\cdots,n
\end{array}
\right.
$$

显然，问题(P$^{'}$)和问题(D$^{'}$)是互为对偶的线性规划，且自变量仅位于不等式的一端，故可利用单纯形法进行求解。

针对石头-剪刀-布问题，对应的博弈矩阵为：
$$
\mathbf{A}=\begin{pmatrix}
    0 &  1 & -1 \\
    -1 &  0 &  1 \\
    1 & -1 &  0
\end{pmatrix}
$$

令$\mathbf{A}^{'} = \mathbf{A} + 1$，即
$$
\mathbf{A}^{'}=\begin{pmatrix}
    1 & 2 & 0 \\
    0 & 1 & 2 \\
    2 & 0 & 1
\end{pmatrix}
$$
可化为两个互为对偶的线性规划问题：
$$\min \left( x_1+x_2+x_3 \right)$$
$$
\text{(P)} \left \{
\begin{array}{rl}
    x_1 + 2x_3  & \ge 1 \\
    2x_1 + x_2  & \ge 1 \\
    2x_2 + x_3  & \ge 1 \\
    x_1,x_2,x_3 & \ge 0
\end{array}
\right.
$$

$$\max \left( y_1+y_2+y_3 \right)$$
$$
\text{(D)} \left \{
\begin{array}{rl}
    y_1 + 2y_2  & \le 1 \\
    y_2 + 2y_3  & \le 1 \\
    2y_1 + y_3  & \le 1 \\
    y_1,y_2,y_3 & \ge 0
\end{array}
\right.
$$

上述线性规划问题的解为：
$$x = \left(\frac{1}{3}, \frac{1}{3}, \frac{1}{3}\right)^\top \quad w=1$$
$$y = \left(\frac{1}{3}, \frac{1}{3}, \frac{1}{3}\right)^\top \quad v=1$$

故原问题的解为：
$$V_{G^{'}}=\frac{1}{w}=\frac{1}{v}=1,\quad V_G=V_{G^{'}}-1=0$$
$$x^*=V_{G^{'}} x=\left(\frac{1}{3}, \frac{1}{3}, \frac{1}{3}\right)^\top$$
$$y^*=V_{G^{'}} y=\left(\frac{1}{3}, \frac{1}{3}, \frac{1}{3}\right)^\top$$