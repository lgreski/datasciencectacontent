## What happened to the ElemStatLearn package?

With the deployment of R 4.0.0, students in the Johns Hopkins *Practical Machine Learning* course on Coursera began to experience problems during quiz 3 and quiz 4 due to the fact that the `ElemStatLearn` package had been [archived by CRAN](https://CRAN.R-project.org/package=ElemStatLearn), the Comprehensive R Archive Network.

<img src="./images/pml-ElemStatLearn01.png">

Quiz 3 requires data sets from *Elements of Statistical Learning* for two questions:

* Question four uses South African Heart Disease data, and 
* Question five uses Deterding's Vowel Recognition data. 

Quiz 4 uses Deterding's Vowel Recognition data. 

## How do I obtain the data I need for the quizzes? 

As usual, there are multiple ways to do something in R. To obtain the data needed for the *Practical Machine Learning Quizzes*, one can choose from the following alternatives.

1. Access the data from the [Elements of Statistical Learning](https://stanford.io/3gC7nKI) book website
2. Access the data from the [CRAN Github repository](https://bit.ly/2XfhFIL) of the `ElemStatLearn` package
3. Download and install the latest version of the package from the CRAN Archive

### Access data from the ESL website

All of the data sets supporting the book can be accessed from the `datasets` subdirectory on the web server where the course website is stored. The URL for this subdirectory is https://web.stanford.edu/~hastie/ElemStatLearn/datasets/. By navigating to this directory in a web browser we can view the names of the files in the directory. 

<img src="./images/pml-ElemStatLearn02.png">

We can access the file directly in an R session with `readr::read_csv()`. For example, to load the Deterding Vowel Recognition data, we use the following R code.

    library(readr)
    vowel.train <- read_csv("https://web.stanford.edu/~hastie/ElemStatLearn/datasets/vowel.train")
    vowel.test <- read_csv("https://web.stanford.edu/~hastie/ElemStatLearn/datasets/vowel.test")

Any other data set from the ESL website can be loaded into R once you know the name(s) of the files one must download.

### Access the data from the CRAN GitHub repository 

Since CRAN maintains a mirror of all R packages on GitHub, we can also access data from the raw.githubusercontent.com domain. For this example, we'll download and access the South African Heart Disease data frame. Data in the `ElemStatLearn` package is stored in the data subdirectory of the master branch, as an R workspace, noted by the file extension `.RData`. 


    theURL <- "https://raw.githubusercontent.com/CRAN/ElemStatLearn/master/data/SAheart.RData"

    download.file(theURL,"./data/SAheart.RData",mode = "wb") # use mode = "wb" to download as binary
    load("./data/SAheart.RData") 
    head(SAheart)
    
This sequence of R functions produces the following output.


    > head(SAheart)
      sbp tobacco  ldl adiposity famhist typea obesity alcohol age chd
    1 160   12.00 5.73     23.11 Present    49   25.30   97.20  52   1
    2 144    0.01 4.41     28.61  Absent    55   28.87    2.06  63   1
    3 118    0.08 3.48     32.28 Present    52   29.14    3.81  46   0
    4 170    7.50 6.41     38.03 Present    51   31.99   24.26  58   1
    5 134   13.60 3.50     27.78 Present    60   25.99   57.34  49   1
    6 132    6.20 6.47     36.21 Present    62   30.77   14.14  45   0
    >  
    
### Accessing the archived version of the ElemStatLearn package

The last way to access the data needed for the quizzes is to download and install the last version of the `ElemStatLearn` package that was posted to CRAN, along with its dependencies. 




