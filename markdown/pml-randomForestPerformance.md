## Improving Performance of Random Forest in <em>Practical Machine Learning</em>

During the December 2015 run of the *Practical Machine Learning* course within the Johns Hopkins University Data Science Specialization offered via coursera.org, many students struggled with the slow performance of some of the machine learning models, especially *Random Forest*.

Although the Community Teaching Assistants provided pointers on how to improve the performance of the `caret::train()` function by using the `parallel` package in conjunction with the `trainControl()` function in `caret`, many students were not able to construct a series of function calls that enabled `caret::train()` to run fast enough to be considered "usable" by the students. Consequently, students used the `randomForest::randomForest()` function to develop predictions for the course project.

This approach takes away one of the key advantages of the `caret` package: its ability to estimate an out of sample error by aggregating the accuracy analysis across a series of training runs. This is because `caret` automates the process of fitting multiple versions of a given model by varying its parameters and/or folds within a cross-validation process.

To improve processing time of the multiple executions of the `train()` function, `caret` supports the parallel processing capabilities of the `parallel` package. Unfortunately, the documentation of [parallel processing with `caret`](http://topepo.github.io/caret/parallel.html) uses a technique, the `doMC` package, which is not available for Microsoft Windows versions of R.

Fortunately, the `parallel` package works on R across all major operating system platforms: Linux, Mac OSX, and Windows. One's ability to run these models in parallel is often the difference between using a highly effective algorithm like *random forest* versus a less effective but more computationally efficient algorithm (such as *linear discriminant analysis*).

## The Process: A Parallel Implementation of Random Forest

Once a person works through the varied sources of documentation on the machine learning models and supporting R packages, the process for executing a random forest model (or any other model) in `caret::train()` is relatively straightforward, and includes the following steps.

1. Configure parallel processing
2. Register parallel processing cluster
3. Configure trainControl object
4. Develop training model
5. De-register trainControl object

### Step 1: Configure parallel processing

content goes here...

### Step 2: Register parallel processing cluster

content goes here...

### Step 3: Configure trainControl object

content goes here...

### Step 4: Develop training model

content goes here...

### Step 5: De-register parallel processing cluster

content goes here...

## Results: Illustrating the impact of Parallel processing

Introductory text goes here...


### Test Scenario 1: parallel vs. single-threaded processing

As illustrated in the following table, multi-threading has a significant, positive impact on the performance of the `caret::train()` function.

<table>
<tr><th>Machine</th><th>Model</th><th>Test</th><th>Result</th></tr>
<tr><td> HP Omen laptop</td><td>Linear Discriminant Analysis</td><td>Multi-threaded</td><td>2.38  seconds</td></tr>
<tr><td> HP Omen laptop</td><td>Linear Discriminant Analysis</td><td>Single-threaded</td><td>3.69  seconds</td></tr>
<tr><td> HP Omen laptop</td><td>Random Forest</td><td>Multi-threaded</td><td>3.22 minutes</td></tr>
<tr><td> HP Omen laptop</td><td>Random Forest</td><td>Single-threaded</td><td>7.59 minutes</td></tr>

</table>

### Test Scenario 2: Multi-threading performance by machine

This section of the analysis uses four different laptop computers to assess the performance of `caret::train()`. CPU speed and number of processors all impact performance, so as expected, the machine with the largest number of cores returns the fastest response time, completing the 5 k-fold cross-validation model in 3.22 minutes.

Since most students in *Practical Machine Learning* have older (and slower) hardware than the machines I typically use, I also ran the tests on a Windows-based tablet, an Envy X2.

Surprisingly, the random forest algorithm for the *Practical Machine Learning* course project runs flawlessly on the tablet. The runtime performance is very slow compared to the other machines, requiring 1 hour 15 minutes to complete the random forest, using all 4 threads across the two cores its Intel Atom-based processor.

<table>
<tr><th>Machine</th><th>Model</th><th>Result</th></tr>
<tr><td> HP Omen laptop</td><td>Random Forest</td><td align="right">03.22 minutes</td></tr>
<tr><td> HP Spectre x360 laptop</td><td>Random Forest</td><td align="right">04.65 minutes</td></tr>
<tr><td> Macbook Pro laptop</td><td>Random Forest</td><td align="right">06.56 minutes</td></tr>
<tr><td> HP Envy X2 laptop</td><td>Random Forest</td><td align="right">74.97 minutes</td></tr>
</table>

### Machine Configurations

Hardware specifications for the computers used in the performance timings in this article are listed below.

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
                <li>Processor: Intel i5 at 2.6Ghz, up to 3.3Ghz</li>
                <li>Memory: 8 gigabytes</li>
                <li>Disk: 512 gigabytes, solid state drive</li>
                <li>Date built: April 2013</li>
            </ul>
        </td>
     </tr>
     <tr>
        <td valign=top>HP Omen laptop</td>
        <td>
            <ul>
                <li>Operating system: Microsoft Windows 10, 64bit</li>
                <li>Processor: Intel i7-4710HQ at 2.5Ghz, up to 3.5Ghz</li>
                <li>Memory: 16 gigabytes</li>
                <li>Disk: 512 gigabytes, solid state drive</li>
                <li>Date built: December 2013</li>
            </ul>
        </td>
    </tr>
    <tr>
    <td valign=top>HP Envy X2 tablet</td>
    <td>
        <ul>
            <li>Operating system: Microsoft Windows 10, 32bit</li>
            <li>Processor: Intel Atom Z2760 at 1.8Ghz</li>
            <li>Memory: 2 gigabytes</li>
            <li>Disk: 128 gigabytes, solid state drive</li>
            <li>Date built: February 2013</li>
        </ul>
    </td>
</tr>
<td valign=top>HP Spectre X2 laptop</td>
<td>
    <ul>
        <li>Operating system: Microsoft Windows 10, 64bit</li>
        <li>Processor: Intel Core i7-6500U at 2.5Ghz, up to 3.1Ghz</li>
        <li>Memory: 8 gigabytes</li>
        <li>Disk: 512 gigabytes, solid state drive</li>
        <li>Date built: December 2015</li>
    </ul>
</td>
</tr>
</table>
