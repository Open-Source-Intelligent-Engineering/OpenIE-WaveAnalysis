# OpenIE-WaveAnalysis
## 1 介绍
* OpenIE信号处理特征工程中所使用到的波形分析（时域分析、频域分析）
* 频域分析是按照频率观察信号特征。在一般情况下，我们分析信号习惯从时域方向开始，因为时域的分析更加直观，但频域的表示更加简洁，从这方面去分析对信号了解更加深刻。通过分析振动信号的频域特征准确地表征信号频谱信息，然后获悉在不同工况下部件运行时的健康状态。目前常用的频域特征参数包括重心频率、平均频率、均方根频率以及频率标准差。进行频域分析通常利用傅里叶变换开始。

## 2 环境配置
```bash
# 使用miniconda创建Python环境
conda create --name openie python=3.8
# 启动conda环境
conda activate openie
# 安装Pyhton依赖
pip install -r requirements.txt
```
