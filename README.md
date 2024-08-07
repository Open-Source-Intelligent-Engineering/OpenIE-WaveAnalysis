![](someUsefulDocument/ProjectPicture/OpenIE_icon.png)
# OpenIE-WaveAnalysis
English | [简体中文](./someUsefulDocument/ProjectDocument/README_cn.md)
## Project | Prediction of Tool Wear in Machining Centers Based on Deep Learning and Its Industrial Application
###  0x00 Preface
This project originated in 2022, when I was still studying Industrial Engineering at Zhengzhou University (my senior year). Although the project was newly proposed and there were many immature ideas in it, after several months of polishing, I also achieved good results (such as winning the provincial first prize in the Challenge Cup competition). Special thanks to my teacher [Ye Zhenggeng](http://www5.zzu.edu.cn/glgc/info/1134/9317.htm) (associate researcher), majoring in Industrial Engineering, School of Management, Zhengzhou University. He provided us with machine tool data and selfless guidance to the OpenIE team throughout the entire project.<br />
Meanwhile, I would like to express my gratitude to team members Wang Xiao (my roommate who later went to the National University of Defense Science and Technology for a direct PhD program), Luo Wenjie, and Zhang Ziyang. <br />
### 0x01 OpenIE Machine | Mathematica Data Science
The project of predicting tool wear in machining centers through machine learning is not so much an application in mechanical and electronic engineering as a research and exploration in data science. In engineering, it is necessary to consider whether the collected data meets international standards and whether there is a complete toolchain in terms of deployment ( for example, I often watch [MATLAB China](https://space.bilibili.com/1768836923?spm_id_from=333.337.0.0)'s official account video on Bilibili, from data acquisition, data processing, feature engineering, machine learning training and testing, to project deployment on different devices, is all completed by specialized Matlab toolkits and programs. Although it is very convenient and suitable for the industry, it does not perform well in terms of flexibility and personally feels difficult to fine tune. )<br />
However, this project focuses more on theoretical research, and I have invested more energy in data import, data processing, and neural network construction and testing using Mathematica and Wolfram scripts. In terms of potential industrial applications in the future, it will be considered to use the Wolfram Engine to run on cloud servers, or to export the algorithm model as a C function through Mathematica CCodeGenerator and compile it to run on the target platform.
### 0x02 Project Navigation
Calculating the wear degree of machine tools by collecting machine tool signals is a typical prediction problem, which can be achieved by establishing a machine learning model.
|Step | Details|
|-------- | --------|
|Step 1 Data Collection and Preparation | Ensure that you have collected various signal data, including spindle current, vibration, noise, and corresponding tool wear |
|Step 2 Feature Engineering | Extract useful features from raw data. This can include statistical features (mean, standard deviation, etc.), time-domain features, and frequency-domain features (using Fourier transform, etc.). <br />Consider introducing domain knowledge, such as machine tool working principles and tool wear mechanisms, to help select appropriate features|
|Step 3 Data Segmentation | Divide the dataset into training and testing sets. The common practice is to use most of the data for training and a small portion for testing the performance of the model|
|Step 4 Model Selection | As this is a prediction problem, regression models such as linear regression, decision tree regression, random forest, etc. can be considered. <br /> You can also try more complex models, such as neural networks, especially for complex nonlinear relationships|
|Step 5 Model Training | Train the selected model using the training set. <br />Adjust the hyperparameters of the model, such as learning rate, number of trees, etc., to achieve better performance|
|Step 6 Model Evaluation | Evaluate the performance of the model using a test set. Common evaluation indicators include mean square error (MSE), mean absolute error (MAE), and so on|
|Step 7 Model Optimization | Based on the evaluation results, further optimization of the model may be necessary. This may include adjusting feature selection, trying different model algorithms, dealing with data imbalance, and so on|
|Step 8 Model Deployment and Monitoring | Once satisfied with the performance of the model, it can be deployed to the production environment and continuously monitored for performance to ensure its effectiveness in practical applications|
|Step 9 Iteration and Improvement | Data science is an iterative process. Based on feedback from practical applications, continuously optimize the model, improve feature engineering and model selection|

### Data Import and Process
Define a function for read "*.csv" file, input the file name and return as data.
```mathematica
readMachineSignal[csvFileName_] := Module[{data},
  (*获取当前Notebook文件所在的文件夹地址*)
  currentDirectory = NotebookDirectory[];
  (*构建CSV和DAT文件的完整路径*)
  csvFilePath = 
   FileNameJoin[{currentDirectory, "machineData", csvFileName}];
  data = Import[csvFilePath, "CSV"];
  data
  ]
```
Plot the signals with 3 rows and 2 colons graph
![](someUsefulDocument/ProjectPicture/SignalPlot.png)