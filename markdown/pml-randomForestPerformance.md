## Improving Performance of Random Forest in <em>Practical Machine Learning</em>

During the December 2015 run of the *Practical Machine Learning* course within the Johns Hopkins University Data Science Specialization offered via coursera.org, many students struggled with the slow performance of some of the machine learning models, especially *Random Forest*.

Although the Community Teaching Assistants provided pointers on how to improve the performance of the `caret::train()` function by using the `parallel` package in conjunction with the `trainControl()` function in `caret`, many students were not able to construct a series of function calls that enabled `caret::train()` to run fast enough to be considered "usable" by the students. Consequently, students used the `randomForest::randomForest()` function to develop predictions for the course project.

This approach takes away one of the key advantages of the `caret` package: its ability to estimate an out of sample error by aggregating the accuracy analysis across a series of training runs. This is because `caret` automates the process of fitting multiple versions of a given model by varying its parameters and/or folds within a cross-validation process.

To improve processing time of the multiple executions of the `train()` function, `caret` supports the parallel processing capabilities of the `parallel` package. Unfortunately, the documentation of [parallel processing with `caret`](http://topepo.github.io/caret/parallel.html) uses a technique, the `doMC` package, which is not available for Microsoft Windows versions of R.

Fortunately, the `parallel` package works on R across all major operating system platforms: Linux, Mac OSX, and Windows. One's ability to run these models in parallel is often the difference between using a highly effective algorithm like *random forest* versus a less effective but more computationally efficient algorithm (such as *linear discriminant analysis*).

## The Process: A Parallel Implementation of Random Forest

Once a person works through the varied sources of documentation on the machine learning models and supporting R packages, the process for executing a random forest model (or any other model) in `caret::train()` is relatively straightforward, and includes the following steps.

<table>
<tr><th>Step</th><th>Description</th></tr>
<tr><td>1. Configure parallel processing</td><td> Description here</td></tr>
<tr><td>2. Register parallel processing cluster</td><td>Description here</td></tr>
<tr><td>3. Configure trainControl object</td><td>Description here</td></tr>
<tr><td>4. Develop training model</td><td>Description here</td></tr>
<tr><td>5. De-register parallel processing cluster</td><td>Description here</td></tr>
</table>

### Step 1: Configure parallel processing

### Step 2: Register parallel processing cluster

### Step 3: Configure trainControl object

### Step 4: Develop training model

### Step 5: De-register parallel processing cluster

## Results: Illustrating the impact of Parallel processing
