
### Prerequisites

Install Eclipse
Install StatET plugin for Eclipse
```
```
### The process to run and deploy the system. 
The systemconsists mainly of two modules. The core module runs in a R environment and the Rest web service module is deployed on a web server. Here we used open source Apache Tomcat for deployment.###Deployment for Simulation Engine : Steps for installing the module are1 – Install R on the server or local machine.2 – Install all required R packages by using install.package('package name')3 – For development install eclipse and R plugin – STAT-R
###Deployment for Rest web services Server : Steps for installing the module are1 – Install Apache Tomcat2 – Build war file for the application3 – Deploy the war on the web server and upon success the service can be accessed onlocalhost:8080
###Operation and maintenance for simulation engine1 – R runs as a batch process. To run set the start/end date/stock symbol in elt.R file.2 – Also set the dates for prediction period in predict.R files2 – Execute the scripts in run folder. e.g.: “RunRandomForestSignals.R”3 – These will generate csv files for recommendation
###Operation and maintenance for Web service1 – Upon deployment the user can create new account, login and manage transactions2 – The GUI provides access to these services through easy to read tabs.3 – The user can also see the graphs and data analysis in the corresponding section for the stocks.###SummaryStock analysis is a complex and challenging domain for data mining. Due to its inherentunpredictable nature it is difficult to get accurate results for the recommendations. Thisproject was an attempt to take this challenge and develop new and better approachesfor stock simulation. This study has allowed us to gain knowledge and first handexperience in wide areas like machine learning, statistical analysis, prediction models,visualization and Web services. Particularly the project included trying different machinelearning algorithms to build models. Finally random forest and arima model wasshortlisted for final implementation.###ConclusionsAlthough stock analysis has these challenges the core recommendation engine was ableto generate accurate results. The random model could predict signals with 87% as highestaccuracy. Though this measure of calculating the accuracy is debatable since the accuracyshould be high for buy and sell signals and should not usually consider hold signals.Recommendations for Further Research###Following are few recommendation for further research in this domain1 – Comparison with different modelsNew models can be created using algorithms like apriori to identify co-relation betweencompany stocks which can lead to relations like a increase in company A stock leads todecrease in company B stock and such.

2 – Store models in pmml formatBuilding models is a expensive process. Also models ideally should be reusable andfollow some standard so that it can be interpreted by third party systems and deployedthere. PMML is such technology standard which allows the models generated at datamining application can be transferred to other systems and deployed at scale.3 – AccuracyIncreasing accuracy remains a challenge. Measuring accuracy is also a critical aspect.The accuracy varies with models and is not stable.4 – ParallelizationThe training of models is a very expensive process and takes time to finish.Parallelization should be used and explored for dealing with this. R offers packages forparallelization using multicore, hadoop technologies





