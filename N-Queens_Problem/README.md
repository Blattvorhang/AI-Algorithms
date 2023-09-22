# N皇后问题
## 问题描述
一般地，$N$​皇后问题描述如下：

在大小为$N \times N$的棋盘上摆放$N$个皇后，使其两两之间不能互相攻击，即任意两个皇后都不能处于棋盘的同一行、同一列或同一斜线上，求出满足条件的所有棋局及局面总数。

特殊地，当$N=8$​​时为著名的以国际象棋棋盘为背景的8皇后问题，易解得符合条件的局面总数为92。本实验主要探究$N \times N$​​的棋盘上摆放$N$​​​个皇后的一般问题，特别地，使用优化方法（全态形式化）而非搜索方法（增量形式化）。

## 代码内容
代码包含对$N$皇后问题使用不同优化算法进行求解，最终对各算法优劣进行比较。

## 算法目录
1. 局部搜索
    1. 爬山法
    2. 首选爬山法
    3. 随机重启爬山法
    4. 局部束搜索
2. 元启发式
    1. 模拟退火算法
    2. 遗传算法