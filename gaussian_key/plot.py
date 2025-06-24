import math
from math import *

# Given variance of the noise in the output ciphertext, compute a bound on the noise, in the manner of [CCH+21]
def alpha_bound_from_variance(log2variance, n):
    D = 6
    # D * sigma
    log2bound = 1.0/2 * (log2variance) + log2(D)
    return log2bound

gaussian_std0 = 3.19
key_std0 = sqrt(2/3)
L = 32

def get_log2variance(N, depth, std0):
    var0 = math.log2(std0 * std0)
    
    var_indep = [var0]
    for i in range(1, depth):
        var_indep.append(log2(N) + var0 + var_indep[i - 1])
    
    var_dep = [var0]
    for i in range(1, depth):
        var_dep.append(log2(i + 1) + log2(N) + var0 + var_dep[i - 1])
    return var_indep, var_dep

def get_bound(N, depth, std0=gaussian_std0):
    var_indep, var_dep = get_log2variance(N, depth, std0)

    stderr_indep = [var/2 for var in var_indep]
    stderr_dep = [var/2 for var in var_dep]
   
    normal_bound_indep = []
    for i, var in enumerate(var_indep):
        normal_bound_indep.append(alpha_bound_from_variance(var, N))
    
    normal_bound_dep = []
    for i, var in enumerate(var_dep):
        normal_bound_dep.append(alpha_bound_from_variance(var, N))

    bound_canonical = [log2(sqrt(N) * std0 * 6)]
    # BKey = 1
    bound_kpz21 = [log2(6 * std0) if std0 == gaussian_std0 else log2(1)]
    for i, var in enumerate(var_dep):
        if i == 0:
            continue
        bound_canonical.append(bound_canonical[i - 1] + bound_canonical[0])
        bound_kpz21.append(log2(2 * sqrt(N)) + bound_kpz21[i - 1] + bound_kpz21[0])
    
    bounds = {
        "stderr_indep": stderr_indep,
        "stderr_dep": stderr_dep,
        "normal_bound_indep": normal_bound_indep,
        "normal_bound_dep": normal_bound_dep,
        "bound_canonical": bound_canonical,
        "bound_kpz21": bound_kpz21
    }

    return bounds

def read_log(filename):
    array = []
    with open(filename, "r") as f:
        for line in f:
            if "Max:" in line:
                array.append(float(line.split(" ")[-1].strip()))
    return array

data = {}

for poly in ["key"]:
    for noise in ["dep"]:
        for count in [100, 1000, 10000]:
            isKey = 1 if poly == "key" else 0
            filename = f"data/key_dep_32_65536_10_{count}_{isKey}_{noise}.txt"
            data[f"{poly}_{count}_{noise}"] = read_log(filename)

bounds_gaussian = get_bound(65536, L, gaussian_std0)
bounds_key = get_bound(65536, L, key_std0)

# plot the 64 cases for indep and dep

import matplotlib.pyplot as plt
import scienceplots

plt.rcParams.update({
    'text.usetex': True,        # 使用LaTeX渲染文本
    # 'font.family': 'serif',      # 衬线字体
    # 'font.serif': ['T1'],    # Times字体
    'font.size': 8,             # 基础字号(正文是9pt)
    'axes.labelsize': 8,        # 轴标签字号
    'axes.titlesize': 8,        # 标题字号
    'xtick.labelsize': 7,       # x轴刻度字号
    'ytick.labelsize': 7,       # y轴刻度字号
    'legend.fontsize': 7,       # 图例字号
    'lines.linewidth': 1,       # 线宽
    'lines.markersize': 4,      # 标记大小
    'axes.linewidth': 0.5,      # 轴线宽度
    'xtick.major.width': 0.5,   # x轴主刻度宽度
    'ytick.major.width': 0.5,   # y轴主刻度宽度
    'hatch.linewidth': 0.3      # 填充图案线宽
})
plt.style.use(["science"])

x = list(range(1, L+1))
zero = [0] * L

count_to_name = {
    100: "100 Tests",
    1000: "1k Tests",
    10000: "10k Tests",
    100000: "100k Tests",
    300000: "300k Tests"
}

def plot_bound():
    for poly in ["key"]:
        bound = bounds_gaussian if poly == "gaussian" else bounds_key
        for noise in ["dep"]:
            base = bound[f"stderr_{noise}"]
            bound_normal = bound[f"normal_bound_{noise}"]
            diff_normal = [bound_normal[i] - base[i] for i in range(L)]

            # plot the heavy-tailness
            plt.clf()
            plt.plot(x, zero, 'k--', label="StdErr")
            plt.plot(x, diff_normal, ':', label="Gaussian Bound")
            for count in [100, 1000, 10000]:
                line_real = data[f"{poly}_{count}_{noise}"]
                diff = [line_real[i] - base[i] for i in range(L)]
                plt.plot(x, diff, "-", label=f"Max Noise ({count_to_name[count]})")

            plt.legend()
            # plt.ylim(-4, 8.5)
            plt.xlabel('\\#Mult')
            plt.ylabel('$\\log_2(v) - \\log_2(\\sigma)$')
            plt.savefig(f"figure/key_dep_{poly}_{noise}_1.eps", format='eps', bbox_inches='tight', pad_inches=0.02)
            
            # plot canonical and kpz21
            plt.clf()
            bound_canonical = bound["bound_canonical"]
            bound_kpz21 = bound["bound_kpz21"]
            bound_diff_canonical = [bound_canonical[i] - base[i] for i in range(L)]
            bound_diff_kpz21 = [bound_kpz21[i] - base[i] for i in range(L)]
            plt.plot(x, zero, 'k--', label="StdErr")
            plt.plot(x, diff_normal, ':', label="Gaussian Bound")
            plt.plot(x, bound_diff_kpz21, '-.', label="HPS19 Bound")
            plt.plot(x, bound_diff_canonical, '-.', label="Canonical Bound")
            #for count in [300000]:
            for count in [10000]:
                line_real = data[f"{poly}_{count}_{noise}"]
                bound_diff_real = [line_real[i] - base[i] for i in range(L)]
                plt.plot(x, bound_diff_real, '-', label=f"Max Noise ({count_to_name[count]})")

            plt.legend()
            plt.xlabel('\\#Mult')
            plt.ylabel('$\\log_2(v) - \\log_2(\\sigma)$')
            plt.savefig(f"figure/key_dep_{poly}_{noise}_2.eps", format='eps', bbox_inches='tight', pad_inches=0.02)

plot_bound()