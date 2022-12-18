import numpy as np


def get_fft_power_spectrum(y_values, N, f_s, f):
    f_values = np.linspace(0.0, f_s/f, N/f)
    fft_values_ = np.abs(np.fft.fft(y_values))
    # 频率真实幅值分布，单边频谱图，再把所有点频率大小表示出来*2
    fft_values = 2.0/N * (fft_values_[0:N/2])

    # power spectrum 直接周期法
    ps_values = fft_values**2 / N

    # 自相关傅里叶变换法
    cor_x = np.correlate(y_values, y_values, 'same')    # 自相关
    cor_X = np.fft.fft(cor_x, N)
    ps_cor = np.abs(cor_X)
    ps_cor_values = 10*np.log10(ps_cor[0:N/2] / np.max(ps_cor))

    return f_values, fft_values, ps_values, ps_cor_values
