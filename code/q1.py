"""q1.py —— 问题一求解程序

在此实现问题一的核心求解代码。
"""


def optimal_sample_size(alpha=0.05, power=0.8, p0=0.10, p1=0.20):
    """根据显著性水平 alpha 与检验功效 power 估计最小样本量。

    基于正态近似的单侧假设检验：
        H0: p = p0   vs   H1: p > p0

    返回使检验功效达到 power 的最小样本量（向上取整）。
    """
    from math import sqrt
    from scipy.stats import norm

    z_alpha = norm.ppf(1 - alpha)
    z_beta = norm.ppf(power)
    n = ((z_alpha * sqrt(p0 * (1 - p0))
          + z_beta * sqrt(p1 * (1 - p1))) / (p1 - p0)) ** 2
    return int(n) + 1


if __name__ == "__main__":
    n = optimal_sample_size()
    print(f"建议最小抽样样本量: n = {n}")
