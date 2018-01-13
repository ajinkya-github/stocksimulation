{\rtf1\ansi\ansicpg1252\cocoartf1138\cocoasubrtf510
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww11000\viewh8100\viewkind1
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640

\f0\fs24 \cf0 \uc0\u8234 \uc0\u8236 \
### Prerequisites\uc0\u8236 \
```\uc0\u8236 \
Install Eclipse\uc0\u8236 \
Install StatET plugin for Eclipse\uc0\u8236 \
```\uc0\u8236 \
\uc0\u8236 \
### The process to run and deploy the system. \uc0\u8236 \
```\uc0\u8236 \
The system consists mainly of two modules. \uc0\u8236 \
The core module runs in a R environment and the Rest web service module is deployed on a web server. Here we used open source Apache Tomcat for deployment.\uc0\u8236 \
```\uc0\u8236 \
\uc0\u8236 \
### Installation \uc0\u8236 \
```\uc0\u8236 \
1 \'96 Install R on the server or local machine.\uc0\u8236 \
2 \'96 Install all required R packages by using install.package('package name')\uc0\u8236 \
3 \'96 For development install eclipse and R plugin \'96 STAT-R\uc0\u8236 \
```\uc0\u8236 \
### Deployment of Rest web services \uc0\u8236 \
```\uc0\u8236 \
1 \'96 Install Apache Tomcat\uc0\u8236 \
2 \'96 Build war file for the application\uc0\u8236 \
3 \'96 Deploy the war on the web server and upon success the service can be accessed on\uc0\u8236 \
localhost:8080\uc0\u8236 \
```\uc0\u8236 \
### Operation of simulation engine\uc0\u8236 \
```\uc0\u8236 \
1 \'96 R runs as a batch process. To run set the start/end date/stock symbol in elt.R file.\uc0\u8236 \
2 \'96 Also set the dates for prediction period in predict.R files\uc0\u8236 \
2 \'96 Execute the scripts in run folder. e.g.: \'93RunRandomForestSignals.R\'94\uc0\u8236 \
3 \'96 These will generate csv files for recommendation\uc0\u8236 \
\uc0\u8236 \
```\uc0\u8236 \
\uc0\u8236 \
### Summary\uc0\u8236 \
```\uc0\u8236 \
Stock analysis is a complex and challenging domain for data mining. Due to its inherent unpredictable nature it is difficult to get accurate results for the recommendations. This project was an attempt to take this challenge and develop new and better approaches for stock simulation. This study has allowed us to gain knowledge and first hand\uc0\u8236 \
experience in wide areas like machine learning, statistical analysis, prediction models, visualization and Web services. Particularly the project included trying different machine learning algorithms to build models. Finally random forest and arima model was shortlisted for final implementation.\uc0\u8236 \
```\uc0\u8236 \
### Conclusions\uc0\u8236 \
```\uc0\u8236 \
Although stock analysis has these challenges the core recommendation engine was able to generate accurate results. The random model could predict signals with 87% as highest accuracy. Though this measure of calculating the accuracy is debatable since the accuracy should be high for buy and sell signals and should not usually consider hold signals.\uc0\u8236 \
\uc0\u8236 \
```\uc0\u8236 \
### Research scope\uc0\u8236 \
```\uc0\u8236 \
1 \'96 Comparison with different models\uc0\u8236 \
New models can be created using algorithms like apriori to identify co-relation between company stocks which can lead to relations like a increase in company A stock leads to decrease in company B stock and such.\uc0\u8236 \
\uc0\u8236 \
2 \'96 Store models in pmml format\uc0\u8236 \
Building models is a expensive process. Also models ideally should be reusable and follow some standard so that it can be interpreted by third party systems and deployed there. PMML is such technology standard which allows the models generated at data mining application can be transferred to other systems and deployed at scale.\uc0\u8236 \
\uc0\u8236 \
3 \'96 Accuracy\uc0\u8236 \
Increasing accuracy remains a challenge. Measuring accuracy is also a critical aspect. The accuracy varies with models and is not stable.\uc0\u8236 \
\uc0\u8236 \
4 \'96 Parallelization\uc0\u8236 \
The training of models is a very expensive process and takes time to finish.\uc0\u8236 \
Parallelization should be used and explored for dealing with this. R offers packages for parallelization using multicore, hadoop technologies\uc0\u8236 \
\uc0\u8236 \
5 - Optimization\uc0\u8236 \
It is necessary to research into portfolio optimization using markowitz technique, implement montecarlo simulations and backtesting strategies with market indexes like S&P500 to measure portfolio performance. \uc0\u8236 \
```\uc0\u8236 }