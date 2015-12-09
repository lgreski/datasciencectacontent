# Exploratory Data Analysis in ToothGrowth Assignment

For students who have not yet taken the *Exploratory Data Analysis* course within the Data Science curriculum, the requirement for exploratory data analysis in the ToothGrowth assignment may be confusing.

The primary purpose of the exploratory data analysis for the ToothGrowth assignment is to have the student assess whether the data meets the required assumptions for hypothesis testing with t-tests or confidence intervals, such as "is the data normally distributed?" including:

* is the distribution mesokurtic (neither too peaked nor too flat)?
* is the distribution symmetric (neither positively nor negatively skewed)?

Questions like this can be answered with descriptive statistics: mean, median, mode, skewness, kurtosis, and the [Shapiro-Wilk Test for Normality](https://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test).

All of these statistics are available in the `stat.desc()` function within the [pastecs package](https://cran.r-project.org/web/packages/pastecs/pastecs.pdf).

To visualize the distribution of a variable, researchers typically use boxplots, histograms (which are different from bar charts), Q-Q plots, and stem & leaf charts.

Also, exploratory data analysis is also useful to find identify missing values if they exist in the data set, and develop a strategy for managing them, such as mean / median imputation. 
