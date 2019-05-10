Third-Order Sudoku
==================

![](https://img.shields.io/badge/Date-2019%2005%2010-orange.svg?style=flat-square)
![](https://img.shields.io/badge/Puzzles-104%2C9151-FF69B4.svg?style=flat-square)

## Standard Form

0 表示需要求解的数字, 1-9 表示已有的数字

一行一行排列, 一共 81 个数字为一行, 用 LF 换行.

1. 要求解唯一
2. 旋转和镜像意义下同构


## Pipeline

获得一个数独, 用迭代器求出所有解, 如果有多个解标记为非法.

所有解求完, 计算解的旋转于镜像变换, 并作为签名.

接着合并多个数据库, 如果解同构, 取信息最少的那个.

导出数据, 计算问题难度.

## Details

| Hints |  FileSize | Puzzles |
| :---- | --------: | ------: |
| 17    |  3.891 MB |  4,9151 |
| 29    |  0.003 MB |      28 |
| 30    |  0.042 MB |     526 |
| 31    |  0.614 MB |    7748 |
| 32    |  4.839 MB |  6,1122 |
| 33    | 20.891 MB | 26,3913 |
| 34    | 36.016 MB | 45,5004 |
| 35    | 15.748 MB | 19,8940 |
| 36    |  1.003 MB |  1,2662 |
| 37    |  0.005 MB |      57 |
