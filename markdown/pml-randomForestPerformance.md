## Introduction

During the December 2015 run of the *Practical Machine Learning* course within the Johns Hopkins University Data Science Specialization offered via coursera.org, many students struggled with the slow performance of some of the machine learning models, especially *Random Forest*.

Although the Community Teaching Assistants provided pointers on how to improve the performance of the `caret::train()` function by using the `parallel` package in conjunction with the `trainControl()` function in `caret`, many students were not able to construct a series of function calls that enabled `caret::train()` to run fast enough to be considered "usable" by the students. Consequently, students used the `randomForest::randomForest()` function to develop predictions for the course project.

This approach takes away one of the key advantages of the `caret` package: its ability to estimate an out of sample error by aggregating the accuracy analysis across a series of training runs. This is because `caret` automates the process of fitting multiple versions of a given model by varying its parameters and/or folds within a resampling / cross-validation process.

To improve processing time of the multiple executions of the `train()` function, `caret` supports the parallel processing capabilities of the `parallel` package. Unfortunately, the documentation of [parallel processing with `caret`](http://topepo.github.io/caret/parallel.html) uses a technique, the `doMC` package, which is not available for Microsoft Windows versions of R.

Fortunately, the `parallel` package works on R across all major operating system platforms: Linux, Mac OSX, and Windows. One's ability to run these models in parallel is often the difference between using a highly effective algorithm like *random forest* versus a less effective but more computationally efficient algorithm (such as *linear discriminant analysis*).

One other tradeoff that we made in this analysis was changing the resampling method from the default of bootstrapping to k-fold cross-validation. The change in resampling technique may trade processing performance for reduced model accuracy. However, our analysis shows that the 5 fold cross-validation resampling technique delivered the same accuracy as the more computationally expensive bootstrapping technique.

Finally, we note that `caret::train()` supports a wide variety of tuning parameters that vary by model type. For the purposes of this analysis, we chose only to vary the resampling method for `train(x,y,method="rf",...)`, leaving other parameters such as `mtry` constant.  

## The Process: A Parallel Implementation of Random Forest

Once a person works through the varied sources of documentation on the machine learning models and supporting R packages, the process for executing a random forest model (or any other model) in `caret::train()` is relatively straightforward, and includes the following steps.

1. Configure parallel processing
2. Configure trainControl object
3. Develop training model
4. De-register parallel processing cluster

### Prerequisite: Selecting a Machine Learning Problem

For the purpose of illustrating the syntax required for parallel processing, we'll use the `Sonar` data set that is also used as the example in the [caret model training documentation](http://topepo.github.io/caret/training.html).



```r
intervalStart <- Sys.time()
library(mlbench)
data(Sonar)
library(caret)
set.seed(95014)
```

### create training & testing data sets


```r
inTraining <- createDataPartition(Sonar$Class, p = .75, list=FALSE)
training <- Sonar[inTraining,]
testing <- Sonar[-inTraining,]
# set up x and y to avoid slowness of caret() with model syntax
y <- training[,61]
x <- training[,-61]
```

### Step 1: Configure parallel processing

Parallel processing in `caret` can be accomplished with the `parallel` and `doParallel` packages.  The following code loads the required libraries (note, these libraries also depend on the `iterators` and `foreach` libraries).



```r
library(parallel)
library(doParallel)
cluster <- makeCluster(detectCores() - 1) # convention to leave 1 core for OS
registerDoParallel(cluster)
```

### Step 2: Configure trainControl object

The most critical arguments for the trainControl function are the resampling metdhod `method`, the `number` that specifies the quantity of folds for k-fold cross-validation, and `allowParallel` which tells caret to use the cluster that we've registered in the previous step.



```r
fitControl <- trainControl(method = "cv",
number = 5,
allowParallel = TRUE)
```

### Step 3: Develop training model

Next, we use `caret::train()` to train the model, using the `trainControl()` object that we just created.



```r
system.time(fit <- train(x,y, method="rf",data=Sonar,trControl = fitControl))
```

```
##    user  system elapsed 
##   0.718   0.032   4.800
```

```r
system.time(fit <- train(Class ~ ., method="rf",data=Sonar,trControl = fitControl))
```

```
##    user  system elapsed 
##   0.729   0.013   1.581
```

### Step 4: De-register parallel processing cluster

After processing the data, we explicitly shut down the cluster by calling the `stopCluster()` function.



```r
stopCluster(cluster)
registerDoSEQ()
```

At this point we have a trained model in the `fit` object, and can take a number of steps to evaluate the suitability of this model, including accuracy and a confusion matrix that is based on comparing the modeled data to the held out folds.



```r
fit
```

```
## Random Forest 
## 
## 208 samples
##  60 predictor
##   2 classes: 'M', 'R' 
## 
## No pre-processing
## Resampling: Cross-Validated (5 fold) 
## Summary of sample sizes: 167, 167, 165, 167, 166 
## Resampling results across tuning parameters:
## 
##   mtry  Accuracy   Kappa    
##    2    0.8266753  0.6483543
##   31    0.8022959  0.5994756
##   60    0.7881155  0.5705158
## 
## Accuracy was used to select the optimal model using the largest value.
## The final value used for the model was mtry = 2.
```

```r
fit$resample
```

```
##    Accuracy     Kappa Resample
## 1 0.7317073 0.4546554    Fold1
## 2 0.9024390 0.8024096    Fold2
## 3 0.8571429 0.7110092    Fold5
## 4 0.8048780 0.6019417    Fold4
## 5 0.8372093 0.6717557    Fold3
```

```r
confusionMatrix.train(fit)
```

```
## Cross-Validated (5 fold) Confusion Matrix 
## 
## (entries are percentual average cell counts across resamples)
##  
##           Reference
## Prediction    M    R
##          M 48.1 12.0
##          R  5.3 34.6
##                             
##  Accuracy (average) : 0.8269
```


If desired, at this point one can make a prediction on the held out `testing` data partition. Since the primary purpose of this article is to illustrate the syntax required for parallel processing and to discuss its impact on the course project for *Practical Machine Learning*, we will not fit the testing data or evaluate the model accuracy here.

## Results: Illustrating the impact of parallel processing

Returning our attention to the *Practical Machine Learning* course project data set, we compared the performance of parallel versus single-threaded processing on a random forest model with `caret`, and evaluated the performance of the parallel-processing version across four different computers.

### Test Scenario 1: parallel vs. single-threaded processing

As illustrated in the following table, multi-threading has a significant, positive impact on the performance of the `caret::train()` function. As expected, the difference in processing times for the linear discriminant model was negligible. However, for the random forest, the multi-threaded version finished 58% faster than the single-threaded version (as measured on the HP Omen laptop with Intel® Core™ i7-4720HQ processor).

#### Figure 1: Run time by Machine Learning Algorithm and Threading Model
<table>
<tr><th>Machine</th><th>Algorithm</th><th>Threading Model </th><th>Result</th></tr>
<tr><td> HP Omen laptop</td><td>Linear Discriminant Analysis</td><td>Multi-threaded</td><td align="right">2.38  seconds</td></tr>
<tr><td> HP Omen laptop</td><td>Linear Discriminant Analysis</td><td>Single-threaded</td><td align="right">2.41  seconds</td></tr>
<tr><td> HP Omen laptop</td><td>Random Forest</td><td>Multi-threaded</td><td align="right">193.2 seconds</td></tr>
<tr><td> HP Omen laptop</td><td>Random Forest</td><td>Single-threaded</td><td align="right">462.6 seconds</td></tr>
</table>

### Test Scenario 2: Multi-threading performance by machine for *Practical Machine Learning* course project 

This section of the analysis used four different laptop computers to assess the performance of `caret::train()`. CPU speed, number of processor cores, and disk speed (to a lesser extent) all impact runtime performance. All four machines have Intel-based processors with multiple cores, and each core contains two processing threads that can be assigned to execute instructions in parallel. As expected, the machine with the largest number of cores and fastest disk speed returns the fastest response time, completing the 5 k-fold cross-validation model in 3.22 minutes.

Since most students in *Practical Machine Learning* have older (and slower) hardware than the machines I typically use to complete the work in the Data Science Specialization courses, I also ran the tests on a Windows-based tablet: the HP Envy X2.

Surprisingly, the random forest algorithm for the *Practical Machine Learning* course project runs flawlessly on the tablet. The runtime performance is very slow compared to the other machines, requiring 1 hour 15 minutes to complete the random forest, using all 4 threads across the two cores in its Intel Atom-based processor.

To illustrate the impact that the resampling technique has on the runtime performance, we fit the training data for the *Practical Machine Learning* course project on the HP Omen laptop with bootstrapping as the resampling method. The bootstrapping resampling method caused a significant increase in processing time, requiring 17 minutes instead of 3.22 minutes to train the model. Since the cross-validation resampling method resulted in an accuracy of .9945, the bootstrapping resampling method had no positive impact on model accuracy.

Finally, in 2020 I ran the analysis on newer, more powerful hardware. A four core, eight thread Intel i7-4870HQ CPU runs the analysis in 3.07 minutes, about the same speed as the HP Omen. A six core, twelve thread Intel i7-8750H CPU runs the analysis in under 2.6 minutes, a 21% improvement over the four core i7-4710HQ that powers the HP Omen laptop. 

#### Figure 2: Run time by By Machine & Resampling Technique

<table>
<tr><th><br>Machine</th><th><br>Model</th><th>Resampling<br> Technique</th><th><br>Result</th></tr>
<tr><td> HP Spectre x360-15 laptop</td><td>Random Forest</td><td>CV</td><td align="right">02.55 minutes</td></tr>
<tr><td> Macbook Pro 15 laptop</td><td>Random Forest</td><td>CV</td><td align="right">03.07 minutes</td></tr>
<tr><td> HP Omen laptop</td><td>Random Forest</td><td>CV</td><td align="right">03.22 minutes</td></tr>
<tr><td> HP Spectre x360-13 laptop</td><td>Random Forest</td><td>CV</td><td align="right">04.65 minutes</td></tr>
<tr><td> Macbook Pro 13 laptop</td><td>Random Forest</td><td>CV</td><td align="right">06.56 minutes</td></tr>
<tr><td> HP Spectre x360-15</td><td>Random Forest</td><td>Bootstrap</td><td align="right">12.99 minutes</td></tr>
<tr><td> HP Omen laptop</td><td>Random Forest</td><td>Bootstrap</td><td align="right">17.00 minutes</td></tr>
<tr><td> HP Envy X2 laptop</td><td>Random Forest</td><td>CV</td><td align="right">74.97 minutes</td></tr>
</table>

### Machine Configurations

Hardware specifications for the computers used in the performance timings in this article are listed below.

### Figure 3: Machine Hardware Specifications


<table>
<tr>
<th>Computer</th>
<th>Configuration</th>
</tr>
 <tr>
 <td valign=top>Apple Macbook Pro 13</td>
 <td>
 <ul>
 <li>Operating system: OS X Yosemite 10.10.4 (14E46)</li>
 <li>Processor: Intel i5 at 2.6Ghz, turbo up to 3.3Ghz, two cores</li>
 <li>Memory: 8 gigabytes</li>
 <li>Disk: 512 gigabytes, solid state drive</li>
 <li>Date built: April 2013</li>
 </ul>
  </td>
 </tr>
  <tr>
 <td valign=top>Apple Macbook Pro 15</td>
 <td>
 <ul>
 <li>Operating system: OS X Catalina 10.15.5 (19F101)</li>
 <li>Processor: Intel i7 at 2.5Ghz, turbo up to 3.7Ghz, four cores</li>
 <li>Memory: 16 gigabytes</li>
 <li>Disk: 512 gigabytes, solid state drive</li>
 <li>Date built: mid 2015</li>
 </ul>
  </td>
 </tr>

 <tr>
 <td valign=top>HP Envy X2 tablet</td>
 <td>
 <ul>
  <li>Operating system: Microsoft Windows 10, 32bit</li>
  <li>Processor: Intel Atom Z2760 at 1.8Ghz, two cores</li>
  <li>Memory: 2 gigabytes</li>
 <li>Disk: 128 gigabytes, solid state drive</li>
 <li>Date built: February 2013</li>
 </ul>
 </td>
</tr>
<tr>
 <td valign=top>HP Omen laptop</td>
 <td>
 <ul>
 <li>Operating system: Microsoft Windows 10, 64bit</li>
 <li>Processor: Intel i7-4710HQ at 2.5Ghz, turbo up to 3.5Ghz, four cores</li>
 <li>Memory: 16 gigabytes</li>
 <li>Disk: 512 gigabytes, solid state drive</li>
 <li>Date built: December 2013</li>
 </ul>
 </td>
</tr>
<td valign=top>HP Spectre X360-13 laptop</td>
<td>
<ul>
<li>Operating system: Microsoft Windows 10, 64bit</li>
<li>Processor: Intel Core i7-6500U at 2.5Ghz, turbo up to 3.1Ghz, two cores</li>
<li>Memory: 8 gigabytes</li>
<li>Disk: 512 gigabytes, solid state drive</li>
<li>Date built: December 2015</li>
</ul>
</td>
</tr>
</tr>
<td valign=top>HP Spectre X360-15 laptop</td>
<td>
<ul>
<li>Operating system: Microsoft Windows 10, 64bit</li>
<li>Processor: Intel Core i7-8750H at 2.2Ghz, turbo up to 4.1Ghz, six cores</li>
<li>Memory: 16 gigabytes</li>
<li>Disk: 1,024 gigabytes, solid state drive</li>
<li>Date built: May 2019</li>
</ul>
</td>
</tr>

</table>


```r
sessionInfo()
```

```
## R version 4.0.0 (2020-04-24)
## Platform: x86_64-apple-darwin17.0 (64-bit)
## Running under: macOS Catalina 10.15.5
## 
## Matrix products: default
## BLAS:   /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRblas.dylib
## LAPACK: /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRlapack.dylib
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] parallel  stats     graphics  grDevices utils     datasets  methods  
## [8] base     
## 
## other attached packages:
## [1] doParallel_1.0.15 iterators_1.0.12  foreach_1.5.0     caret_6.0-86     
## [5] ggplot2_3.3.0     lattice_0.20-41   mlbench_2.1-1    
## 
## loaded via a namespace (and not attached):
##  [1] tidyselect_1.1.0     xfun_0.13            purrr_0.3.4         
##  [4] reshape2_1.4.4       splines_4.0.0        colorspace_1.4-1    
##  [7] vctrs_0.3.0          generics_0.0.2       stats4_4.0.0        
## [10] htmltools_0.4.0      yaml_2.2.1           survival_3.1-12     
## [13] prodlim_2019.11.13   rlang_0.4.6          e1071_1.7-3         
## [16] ModelMetrics_1.2.2.2 pillar_1.4.4         glue_1.4.1          
## [19] withr_2.2.0          lifecycle_0.2.0      plyr_1.8.6          
## [22] lava_1.6.7           stringr_1.4.0        timeDate_3043.102   
## [25] munsell_0.5.0        gtable_0.3.0         recipes_0.1.12      
## [28] codetools_0.2-16     evaluate_0.14        knitr_1.28          
## [31] class_7.3-17         Rcpp_1.0.4.6         scales_1.1.0        
## [34] ipred_0.9-9          digest_0.6.25        stringi_1.4.6       
## [37] dplyr_0.8.99.9003    grid_4.0.0           tools_4.0.0         
## [40] magrittr_1.5         tibble_3.0.1         randomForest_4.6-14 
## [43] crayon_1.3.4         pkgconfig_2.0.3      ellipsis_0.3.1      
## [46] MASS_7.3-51.6        Matrix_1.2-18        data.table_1.12.8   
## [49] pROC_1.16.2          lubridate_1.7.8      gower_0.2.1         
## [52] rmarkdown_2.1        R6_2.4.1             rpart_4.1-15        
## [55] nnet_7.3-14          nlme_3.1-147         compiler_4.0.0
```



*Copyright 2017 - 2020, Len Greski - copying with attribution permitted* 