from math import *

N = 2 ** 15 # 2^15 now
gaussian_std0 = 3.19
key_std0 = sqrt(2/3)
uni_std0 = sqrt(1/12) # [-1/2, 1/2]
t = 65537 # ptm

L = 32

def log2factorial(k):
    log2factorial = 0
    for i in range(1, k + 1):
        if i == 1:
            log2factorial = log2(i)
        else:
            log2factorial += log2(i)
    return log2factorial

def get_log2std0():
    bgv_std0_indep = []
    bgv_std0_dep = []
    bfv_std0_indep = []
    bfv_std0_dep = []

    for k in range(1, L + 1):
        # BGV indep
        var = 2 * k * log2(t) + (2*k-1) * log2(N) + log2factorial(k+1) + 2 * k * log2(key_std0 * gaussian_std0)
        # actually stderr...
        bgv_std0_indep.append(var * 0.5)

        # BGV dep
        var = 2 * k * log2(t) + (2*k-1) * log2(N) + log2factorial(k+1) + log2factorial(k)  + 2 * k * log2(key_std0 * gaussian_std0)
        bgv_std0_dep.append(var * 0.5)

        # BFV indep
        var = log2(4) + 2 * (k-1) * log2(t) + (2*k-1) * log2(N) + log2factorial(k) + 2 * log2(gaussian_std0) + 2 * k * log2(key_std0) + (2 * k - 2) * log2(uni_std0)
        bfv_std0_indep.append(var * 0.5)

        # BFV indep
        var = log2(2) + 2 * (k-1) * log2(t) + (2*k-1) * log2(N) + log2factorial(k) + log2factorial(k-1) + 2 * log2(gaussian_std0) + 2 * k * log2(key_std0) + (2 * k - 2) * log2(uni_std0)
        bfv_std0_dep.append(var * 0.5)

    log2std0 = {
        "indep_32_bgv": bgv_std0_indep,
        "dep_32_bgv": bgv_std0_dep,
        "indep_32_bfv": bfv_std0_indep,
        "dep_32_bfv": bfv_std0_dep
    }
    return log2std0

log2std0 = get_log2std0()

def read_log(filename):
    array = []
    with open(filename, "r") as f:
        for line in f:
            if "] = " in line:
                array.append(float(line.split(" ")[-1].strip()))
    return array

logs = [
    "dep_32_bgv",
    "indep_32_bgv",
    "dep_32_bfv",
    "indep_32_bfv",
]

def log_to_filename(name, test):
    return f"data/mult_seq_{name}_logN15_{test}.log"

def read_log_for_test(test):
    log_array = {}
    for log in logs:
        log_array[log] = read_log(log_to_filename(log, test))
    return log_array

log_arrays = {}

log_arrays[1] = read_log_for_test("1")
log_arrays[100] = read_log_for_test("100")
log_arrays[1000] = read_log_for_test("1000")

L = 32

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
diff_normal = [log2(6)] * L

count_to_name = {
    1: "1 Test",
    100: "100 Tests",
    1000: "1k Tests",
    10000: "10k Tests",
    100000: "100k Tests",
    300000: "300k Tests"
}

def plot_bound():
    for log in logs:
        base = log2std0[log]

        # plot the heavy-tailness
        plt.clf()
        plt.plot(x, zero, 'k--', label="StdErr")
        plt.plot(x, diff_normal, ':', label="Gaussian Bound")
        for test in [1, 100, 1000]:
            line = log_arrays[test][log]
            bound_diff = [line[i] - base[i] for i in range(L)]
            plt.plot(x, bound_diff, '-', label=f"Max Noise ({count_to_name[test]})")

        plt.legend()
        plt.xlabel('\\#Mult')
        plt.ylabel('$\\log_2(v) - \\log_2(\\sigma)$')
        plt.savefig(f"figure/{log}.eps", format='eps', bbox_inches='tight', pad_inches=0.02)

plot_bound()