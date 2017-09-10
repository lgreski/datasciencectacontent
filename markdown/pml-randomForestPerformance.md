## Improving Performance of Random Forest in <em>caret::train()</em>

During the December 2015 run of the *Practical Machine Learning* course within the Johns Hopkins University Data Science Specialization offered via coursera.org, many students struggled with the slow performance of some of the machine learning models, especially *Random Forest*.

Although the Community Teaching Assistants provided pointers on how to improve the performance of the `caret::train()` function by using the `parallel` package in conjunction with the `trainControl()` function in `caret`, many students were not able to construct a series of function calls that enabled `caret::train()` to run fast enough to be considered "usable" by the students. Consequently, students used the `randomForest::randomForest()` function to develop predictions for the course project.

This approach takes away one of the key advantages of the `caret` package: its ability to estimate an out of sample error by aggregating the accuracy analysis across a series of training runs. This is because `caret` automates the process of fitting multiple versions of a given model by varying its parameters and/or folds within a resampling / cross-validation process.

To improve processing time of the multiple executions of the `train()` function, `caret` supports the parallel processing capabilities of the `parallel` package. Unfortunately, the documentation of [parallel processing with `caret`](http://topepo.github.io/caret/parallel.html) uses a technique, the `doMC` package, which is not available for Microsoft Windows versions of R.

Fortunately, the `parallel` package works on R across all major operating system platforms: Linux, Mac OSX, and Windows. One's ability to run these models in parallel to obtain a manageable response time is often the difference between using a highly effective algorithm like *random forest* versus a less effective but more computationally efficient algorithm (such as *linear discriminant analysis*).

In practical terms for the *Practical Machine Learning* final project, the probability of correctly predicting all 20 test cases using an algorithm with 80% accuracy is very low, as described in [Required Model Accuracy](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/pml-requiredModelAccuracy.md). The probability of correctly predicting all 20 test cases even with a model at 95% accuracy is only 0.36. Therefore, a student must use an algorithm that has at least 99% accuracy to have a reasonable probability of obtaining a perfect score on the quiz associated with the final project.

One other tradeoff that we made in this analysis was changing the resampling method from the default of bootstrapping to k-fold cross-validation. The impact of this change is to reduce the number of samples against which the random forest algorithm is run from 25 to 5, and to change each sample's composition from leave one out to randomly selected training folds. Note that within each sample, the trees are still calculated with the underlying random forest algorithm, as described by [Leo Breiman](https://www.stat.berkeley.edu/~breiman/RandomForests/cc_home.htm#workings).

The change in resampling technique may trade processing performance for reduced model accuracy. However, our analysis shows that the 5 fold cross-validation resampling technique delivered the same accuracy as the more computationally expensive bootstrapping technique.

Finally, we note that `caret::train()` supports a wide variety of tuning parameters that vary by model type. For the purposes of this analysis, we chose only to vary the resampling method for `train(x,y,method="rf",...)`, leaving other parameters such as `mtry` constant.  

## The Process: A Parallel Implementation of Random Forest

Once a person works through the varied sources of documentation on the machine learning models and supporting R packages, the process for executing a random forest model (or any other model) in `caret::train()` is relatively straightforward, and includes the following steps.

1. Configure parallel processing
2. Configure trainControl object
3. Develop training model
4. De-register parallel processing cluster

### Prerequisite: Selecting a Machine Learning Problem

For the purpose of illustrating the syntax required for parallel processing, we'll use the `Sonar` data set that is also used as the example in the [caret model training documentation](http://topepo.github.io/caret/training.html).

    library(mlbench)
    data(Sonar)
    library(caret)
    set.seed(95014)

    # create training & testing data sets

    inTraining <- createDataPartition(Sonar$Class, p = .75, list=FALSE)
    training <- Sonar[inTraining,]
    testing <- Sonar[-inTraining,]

    # set up training run for x / y syntax because model format performs poorly
    x <- training[,-61]
    y <- training[,61]


### Step 1: Configure parallel processing

Parallel processing in `caret` can be accomplished with the `parallel` and `doParallel` packages.  The following code loads the required libraries (note, these libraries also depend on the `iterators` and `foreach` libraries).

    library(parallel)
    library(doParallel)
    cluster <- makeCluster(detectCores() - 1) # convention to leave 1 core for OS
    registerDoParallel(cluster)


### Step 2: Configure trainControl object

The most critical arguments for the trainControl function are the resampling method `method`, the `number` that specifies the quantity of folds for k-fold cross-validation, and `allowParallel` which tells caret to use the cluster that we've registered in the previous step.

    fitControl <- trainControl(method = "cv",
                               number = 10,
                               allowParallel = TRUE)

### Step 3: Develop training model

Next, we use `caret::train()` to train the model, using the `trainControl()` object that we just created.

    fit <- train(x,y, method="rf",data=Sonar,trControl = fitControl)

### Step 4: De-register parallel processing cluster

After processing the data, we explicitly shut down the cluster by calling the `stopCluster()` and `registerDoSEQ()` functions. `registerDoSEQ()` function is required to force R to return to single threaded processing.

    stopCluster(cluster)
    registerDoSEQ()

At this point we have a trained model in the `fit` object, and can take a number of steps to evaluate the suitability of this model, including accuracy and a confusion matrix that is based on comparing the modeled data to the held out folds.

    fit
    fit$resample
    confusionMatrix.train(fit)

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

### Test Scenario 2: Multi-threading performance by machine

This section of the analysis used four different laptop computers to assess the performance of `caret::train()`. CPU speed, number of processor cores, and disk speed (to a lesser extent) all impact runtime performance. All four machines have Intel-based processors with multiple cores, and each core contains two processing threads that can be assigned to execute instructions in parallel. As expected, the machine with the largest number of cores and fastest disk speed returns the fastest response time, completing the 5 k-fold cross-validation model in 3.22 minutes.

Since most students in *Practical Machine Learning* have older (and slower) hardware than the machines I typically use to complete the work in the Data Science Specialization courses, I also ran the tests on a Windows-based tablet: the HP Envy X2.

Surprisingly, the random forest algorithm for the *Practical Machine Learning* course project runs flawlessly on the tablet. The runtime performance is very slow compared to the other machines, requiring 1 hour 15 minutes to complete the random forest, using all 4 threads across the two cores in its Intel Atom-based processor.

In July 2017 we ran the analysis on an HP Chromebook on which we had installed Ubuntu Linux, in order to see how R performs on the Chromebook relative to the other hardware we tested in 2016. Amazingly, even with only 2 threads, the Chromebook outperformed the Envy X2 by a large margin, completing the 5 k-fold validation model in only 20.01 minutes.

Finally, to illustrate the impact that the resampling technique has on the runtime performance, we fit the training data for the *Practical Machine Learning* course project on the HP Omen laptop with bootstrapping as the resampling method. The bootstrapping resampling method caused a significant increase in processing time, requiring 17 minutes instead of 3.22 minutes to train the model. Since the cross-validation resampling method resulted in an accuracy of .9945, the bootstrapping resampling method had no positive impact on model accuracy.

#### Figure 2: Run time by By Machine & Resampling Technique

<table>
<tr><th><br>Machine</th><th><br>Model</th><th>Resampling<br> Technique</th><th><br>Result</th></tr>
<tr><td> HP Omen laptop</td><td>Random Forest</td><td>CV</td><td align="right">03.22 minutes</td></tr>
<tr><td> HP Spectre x360 laptop</td><td>Random Forest</td><td>CV</td><td align="right">04.65 minutes</td></tr>
<tr><td> Macbook Pro laptop</td><td>Random Forest</td><td>CV</td><td align="right">06.56 minutes</td></tr>
<tr><td> HP Chromebook</td><td>Random Forest</td><td>CV</td><td align="right">20.01 minutes</td></tr>
<tr><td> HP Omen laptop</td><td>Random Forest</td><td>Bootstrap</td><td align="right">17.00 minutes</td></tr>
<tr><td> HP Envy X2 tablet</td><td>Random Forest</td><td>CV</td><td align="right">74.97 minutes</td></tr>
</table>

### Machine Configurations

Hardware specifications for the computers used in the performance timings in this article are listed below.

#### Figure 3: Machine Hardware Specifications
<table>
    <tr>
        <th>Computer</th>
        <th>Configuration</th>
    </tr>
    <tr>
        <td valign=top>Apple Macbook Pro</td>
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
        <tr>
        <td valign=top>HP Chromebook 14-q010nr</td>
        <td>
            <ul>
                <li>Operating system: Chrome OS</li>
                <li>Processor: 1.4GHz Intel Celeron 2955U Processor, two cores </li>
                <li>Memory: 2 gigabytes 1600Mhz DDR3L SDRAM</li>
                <li>Disk: 16 gigabytes, solid state drive</li>
                <li>Date built: November 2013</li>
            </ul>
        </td>
     </tr>
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
<td valign=top>HP Spectre X360 laptop</td>
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
</table>

*last updated: 9 July 2017*
