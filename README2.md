# Data Science Specialization Community Mentor Content Repository

Author: Len Greski

This repository contains content developed during my time as either a student or Community Mentor in the Data Science Specialization from Johns Hopkins University that is offered over [Coursera](http://coursera.org). A number of people have developed content to help students work through the nine courses in the specialization. The main index for this content is [datasciencespecialization.github.io](http://datasciencespecialization.github.io/).


# Repository Contents

As a participant and Community Mentor in courses in the curriculum, there are patterns of similar issues experienced by students. Migrating the content to github will facilitate reposting it to new runs of courses within the curriculum. This will make it easier for students to have access to the experiences from prior students without me having to cut and paste the content into Discussion Forums, which are the primary mechanism for communication between students and with TAs.

<table>
<tr><th>File</th><th>Description</th></tr>
<tr><td valign="top">/markdown</td><td valign="top">Directory containing markdown files, the primary form of documentation for the content in the repository.</td><tr>
<tr><td valign="top">/markdown/images</td><td valign="top">Directory containing portable network graphics files, which are used to illustrate the narrative content in other documentation. </td><tr>
<tr><td valign="top">README.md</td><td valign="top">File explaining the purpose and contents of the repository, listing of links to specific content by course.</td><tr>
</table>

The remainder of this document serves as a directory of the content, aligning individual documents with the course\(s\) for which the content is relevant.

## Course 1: Data Scientist's Toolbox

1. [Configuring RStudio to work with git / github - Mac OSX](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/configureRStudioGitOSXVersion.md)
2.  [Configuring RStudio to work with git / github - Windows 7, 8, and 10](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/configureRStudioGitWindowsVersion.md)
3. [Using Editor Modes in Discussion Forum Posts](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/usingMarkdownInForumPosts.md)
4. [Buying a Computer for Data Science](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/toolbox-computerStandards.md)

### Key Issue: Students Struggle to find URLs in Lecture Slides

If you're interested in the URLs for the lecture slides, they are available in the [Data Science Specialization Courses](http://bit.ly/2bJcXNW) github repository. Each course is stored in a subdirectory within the repository, and the slides are built in R Markdown language, a technique you'll learn in *Developing Data Products*. 

## Course 2: R Programming

### START HERE

If you're new to the course and trying to figure out what to do in what order, start with these articles.

1. [Resources for R Programming](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-rprogrammingResources.md) Provides a summary of student-generated content to support the course, some of which is indexed on the Data Science Specialization's github.io site
2. [References for R Programming](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-References.md) Provides a list of references for R programming, ranging from beginning to advanced topics.

The next set of articles includes general commentary about the course, R programming in general, and R in relationship to other statistics packages.

1. [Commercial Statistics Packages: An Historical Perspective](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/statsPackagesHistory.md)
2. [Configuring RStudio to work with git / github - Mac OSX](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/configureRStudioGitOSXVersion.md)
2. [A Data Frame is Also a List](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/dataFrameAsList.md)
2. [Forms of the Assignment  Operator](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-assignmentOperators.md)
2. [Forms of the Extract Operator](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-extractOperator.md)
3. [S Objects, R Objects, and Lexical Scoping](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-lexicalScoping.md)
3. [Thinking in R versus Thinking in SAS](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/exampleSortRvsSAS.md)
3. [Strategy for the Programming Assignments](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/makeItRun.md)
3. [Why is R More Difficult than SAS?](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/whyIsRHarderThanSAS.md)
4. [R Onboarding for SAS Users](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-onboardingForSASUsers.md)
5. [References for R Programming](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-References.md) Provides a list of references for R programming, ranging from beginning to advanced topics.

### Posts regarding specifics of programming assignments

1. [Assignment 1: Breaking Down Pollutantmean](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-discussPollutantmean.md)
1. [Assignment 1: Common Mistakes - Weighted vs. Unweighted Means](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-weightedMeans.md)
1. [Assignment 1: A SAS Version of  Pollutantmean](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-pollutantmeanSASVersion.md)
1. [Assignment 2: Demystifying makeVector](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-breakingDownMakeVector.md)
1. [Assignment 2: makeCacheMatrix as an Object](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprogAssignment2Prototype.md)
2. [Assignment 2: Grading the SHA-1 Hash Code](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-gradeSHA1hash.md)
3. [Assignment 3: Functions to Sort Data Frames](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-sortFunctionsExample.md)

### Miscellaneous Code Examples and Instructions

1. [Common R Mistakes: Overwriting R Functions with Output Variables](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-overwritingRFunctions.md)
2. [Permanently Setting R Working Directory](http://www.r-bloggers.com/setting-your-working-directory-permanently-in-r/) Link to R-bloggers.com article that explains how to set your working directory permanently in R (instead of RStudio)
3. [Creative Use of R: Downloading Course Lectures](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-downloadingLectures.md) Article illustrating how to use R to automate the download of lectures from *Data Science Specialization* courses, such as *R Programming*. Techniques used in this article are helpful to make research reproducible, as required for courses like *Getting and Cleaning Data* and *Reproducible Research*.
<<<<<<< HEAD
=======
4. [How to Upgrade R without Losing Your Packages](http://bit.ly/2ejS8ox) article by Kris Eberwein on datascienceriot.com that includes code to save your list of packages to an rds file, and reinstall any packages that don't make it through the upgrade process.  
>>>>>>> 8c53d2871ecb00b245253fc58d82205fb71873a1

### Interesting R News and Blog Articles

1. [R vs. Python: 2016 Survey of Software used for Data Science](http://bit.ly/2b827ey) Overview of results from a 2016 KDNuggets Software Poll, written by Gregory Piatetsky. The follow up article with expanded analysis is [What Big Data, Data Science, Deep Learning software goes together](http://bit.ly/2bFBPmW), also on [kdnuggets.com](http://bit.ly/2b83GcK).
2. [Scaling R for Data Science](http://oreil.ly/2b8pQyR) August 2016 article by Federico Castanedo explaining three ways to scale R.  
3. [Lexical Scoping and Statistical Computing](http://bit.ly/2cmqAPy) Article by Robert Gentleman and Ross Ihaka at the University of Auckland describing how lexical scoping works, and why it is valuable in statistical computing.

## Course 3: Getting and Cleaning Data

1. [Real World Example: Reading American Community Survey data](https://github.com/lgreski/acsexample)
2. [Strategy for Reading Files & APIs / Quiz 2](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/cleaningData-readingFiles.md)

## Course 5: Reproducible Research
1. [Assignment 2 Checklist](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/repDataAssignment2Checklist.md)

## Course 6: Statistical Inference

1. [Reference Materials for Statistical Inference](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/statinf-references.md)  Start here if you're looking for help on the statistical techniques taught in this course.
4. [Using MathJax with Discussion Forums, R Markdown, and Github Pages](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/mathjaxWithGithubMarkdown.md)
5. [Power Calculations: Optimal Sample size](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/statinf-optimalSampleSize.md)
6. [Permutation Tests Explained](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/statinf-permutationTests.md)


### Articles Related to the Course Project

1. [Exponential Distribution / Central Limit Theorem - Assignment Checklist](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/statinf-expDistChecklist.md)
2. [ToothGrowth Analysis - Assignment Checklist](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/ToothGrowthChecklist.md)
3. [Exploratory Data Analysis in ToothGrowth Assignment](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/edaInToothGrowthAnalysis.md), explaining the exploratory data analysis requirement for students who have not taken the *Exploratory Data Analysis* course prior to taking *Statistical Inference*.
4. [Accessing R Code from an Appendix in Knitr](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/statinf-accessingRCodeFromKnitrAppendix.md)
5. [Theoretical Variance of Sampling Distribution of the Mean](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/statinf-varianceOfExpDist.md)
6. [Kable Tables with Data Frames](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/kableDataFrameTable.md) illustrates how to display a custom table in a `knitr()` document by creating a data frame to contain the information to be rendered with `kable()`.
7. [Installing MiKTeX on Windows 10 / Generating a PDF with knitr](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/statinf-generatePDF.md)

## Course 7: Regression Models

1. [Why does sum of errors * X equal 0?](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/regmodels-sumOfErrorTimesX.md)
2. [Using MathJax with Discussion Forums, R Markdown, and Github Pages](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/mathjaxWithGithubMarkdown.md)


## Course 8: Practical Machine Learning
1. [Week 4: Combining Predictors Math Explained](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/pml-combiningPredictorsBinomial.md)
2. [Course Project - gh-pages Setup with RStudio](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/pml-ghPagesSetup.md)
2. [Course Project - Improving Runtime Performance of Random Forest Models with caret::train()](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/pml-randomForestPerformance.md)
2. [Course Project - Predicting Test Scores based on Training Model Accuracy](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/pml-requiredModelAccuracy.md)

## Course 9: Developing Data Products
1. [Configuring shinyapps.io Application Timeout](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/dataProd-shinyTimeoutConfig.md)

## Course 10: Capstone
1. [Speech and Language Processing, 3rd Edition](https://web.stanford.edu/~jurafsky/slp3/) Working version of Jurafsky, et. al. book on natural language processing whose content on n-grams is helpful for the capstone.

## Content for Community Mentors
1. [Tips for New Community Mentors](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/dss-mentorTips.md) A list of tips for new mentors supporting the *Data Science Specialization*, ranging from when to direct students to paid / professional resources such as the Coursera Learner Help Center, to how to optimize the value of content that is posted by mentors.
