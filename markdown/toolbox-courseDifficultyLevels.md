# Data Science Specialization: Course Prerequisites and Difficulty Levels

Students in the Johns Hopkins University Data Science Specialization on Coursera frequently ask about the feasibility of taking multiple courses simultaneously. An answer to this question includes two elements:

1. Prerequisites: what is the logical sequencing of the courses?
2. Difficulty levels: how much effort must I invest into a particular course?

## Prerequisites

Generally speaking, JHU expects that all students take *The Data Scientist's Toolbox* prior to any other courses. Course assignments in *Toolbox* are designed to ensure that students already have working versions of R, RStudio, Rtools, and Devtools on their computers prior to the start of *R Programming*. Also, the final project requires students to obtain a Github account, and to complete basic Git / Github tasks, including:

* Create a repository in Github,
* Create a local copy of a Github repository,
* Create a file on a local copy of a Github repository, and
* Push the locally-created file to the remote Github repository.

I have seen numerous students struggle with the Git / Github work in the second programming assignment in *R Programming* because they had not completed *Toolbox* prior to the start of *R Programming*.

Next, students should complete *R Programming* before taking any other course(s) in the Specialization. Since all other classes require extensive use of R, it's important to understand the core concepts covered in *R Programming* before taking on other courses.

* Basic R: syntax, objects, programming style
* Loading raw data into R (required for quiz 1)
* Lexical scoping (the focus of second programming assignment)
* Essential programming concepts: loops, conditionals, etc.
* Creating R functions

Finally, students must complete nine courses prior to enrolling in the *Capstone* course, where students must build a predictive model application using R and Shiny. While there are no other prerequisites stated for individual courses, practically speaking there is a logical order to the courses that implies some additional prerequsites. Prerequisites for the entire curriculum are listed in the following table.

<table>
<tr><th valign="top" halign="left">Course</th><th valign="top" halign="left">Prerequisites</th></tr>
<tr><td valign="top" halign="left">1. The Data Scientist's Toolbox </td><td valign="top" halign="left">No prerequisites -- this is the first course in the curriculum, and students are expected to start here.</td></tr>
<tr><td valign="top" halign="left">2. R Programming </td><td valign="top" halign="left">Students should complete <em>Toolbox</em> before starting <em>R Programming</em>.</td></tr>
<tr><td valign="top" halign="left">3. Getting and Cleaning Data </td><td valign="top" halign="left">Students should complete <em>R Programming</em> before starting <em>Getting and Cleaning Data</em>.</td></tr>
<tr><td valign="top" halign="left">4. Exploratory Data Analysis </td><td valign="top" halign="left">Students should complete <em>R Programming</em> before starting <em>Exploratory Data Analysis</em>.</td></tr>
<tr><td valign="top" halign="left">5. Reproducible Research </td><td valign="top" halign="left">Students are expected to include exploratory data analysis in the final project for this course, so they should complete <em>Exploratory Data Analysis</em> prior to taking this course, or at least take it concurrently. Also, the course relies heavily on data cleaning techniques covered in <em>Getting and Cleaning Data</em>, so students should complete this course before attempting <em>Reproducible Research</em>.</td></tr>
<tr><td valign="top" halign="left">6. Statistical Inference </td><td valign="top" halign="left">Students should complete <em>R Programming</em> before starting <em>Statistical Inference</em>. For students that have no prior background in statistics, additional sources of help are listed in the article <a href="http://bit.ly/2c50sKo">References for Statistical Inference</a>.</td></tr>
<tr><td valign="top" halign="left">7. Regression Models </td><td valign="top" halign="left">Students should complete <em>Statistical Inference</em> before starting <em>Regression Models</em> unless they already have taken university-level courses in statistics, and remember the material well enough that <em>Statistical Inference</em> is a refresher course.</td></tr>
<tr><td valign="top" halign="left">8. Practical Machine Learning </td><td valign="top" halign="left">Students should complete <em>Regression Models</em> prior to starting <em>Practical Machine Learning</em> because many of the techniques taught in the course rely on <a href="https://en.wikipedia.org/wiki/Ordinary_least_squares">Ordinary Least Squares</a> based modeling techniques that are covered in <em>Regression Models</em>. </td></tr>
<tr><td valign="top" halign="left">9. Developing Data Products </td><td valign="top" halign="left">This course teaches students how to work with Shiny and various ways to generate presentations in R (Slidify, RStudio Presenter, etc.). That said, one must develop a concept for a data product into a working Shiny application, so experience in at least a few of the other courses beyond <em>R Programming</em> is required to have enough domain knowledge to develop a reasonable course project. </td></tr>
<tr><td valign="top" halign="left">10. Capstone </td><td valign="top" halign="left">This course is only accessible for registration after the nine preceding courses in the specialization have been passed by a student.</td></tr>
</table>

## Course Difficulty levels

Having provided some background on the formal and informal prerequisites for Data Science Specialization courses, another consideration when taking multiple courses simultaneously is the degree of difficulty of each course. Perceptions of difficulty for each course vary significantly according to a student's background.

Students who bring a statistics background to the Specialization will likely find the classes that rely heavily on programming to be more challenging than those that rely on statistics knowledge, including:

* R Programming,
* Getting and Cleaning Data,
* Reproducible Research, and
* Developing Data Products.

Students who have a programming background but not a statistics background will find the statistics courses more challenging, including:

* Statistical Inference,
* Regression Models, and
* Practical Machine Learning.

Given the experience I've had during the last 15 months in the curriculum either as a student or Community Mentor, I've compiled my observations on the courses in descending degree of difficulty in the following table.<br><br> Note: your mileage may vary.  

### Data Science Specialization Courses by Descending Difficulty
<table>
<tr><th valign="top" halign="left">Course</th><th valign="top" halign="left">Comments</th></tr>
<tr><td valign="top" halign="left">1. Capstone </td><td valign="top" halign="left">This course is the most challenging one in the specialization for two reasons. First, it requires knowledge from all prior courses. Second, it provides a challenging final project that requires many hours of independent work. Each week's lecture is between 1 and 3 minutes long, leaving the student to figure out many concepts in the domain of natural language processing on his / her own. </td></tr>
<tr><td valign="top" halign="left">2. Statistical Inference </td><td valign="top" halign="left">For students that don't already have a background in inferential statistics, this is by far the most difficult course in the curriculum. Students often report on the discussion forums having to repeat it multiple times to understand the concepts well enough to pass the quizzes and complete the final project.</td></tr>
<tr><td valign="top" halign="left">3. R Programming </td><td valign="top" halign="left">This course is close in difficulty to <em>Statistical Inference</em> because most students in the Specialization don't have a programming background. Additionally, students who learned another statistics language by taking university-level statistics courses often are <a href="http://bit.ly/2erxk3A">frustrated by the abstract nature of R.</a><br><br>The first programming assignment is very difficult for students who don't already have a programming background, including tasks that are significantly more difficult than those typically required of students in an graduate-level introductory statistics class in the biomedical or social sciences.<br><br>Another area of difficulty in this class is the lexical scoping assignment. At a superficial level it is easy to produce a working version of the assignment by modifying the example code that is distributed with the assignment instructions. That said, many students get very frustrated with this assignment because they don't really understand <em>why</em> the code works the way it does. <br><br>After observing students over a number of months wrestle with this assignment and thinking about how I might help them without giving away the answer to the actual assignment, I wrote <a href="http://bit.ly/2bTXXfq">Demystifying makeVector()</a>, a step by step walkthrough of the sample code distributed by Professor Peng. Feedback about this article from students has been very positive. </td></tr>
<tr><td valign="top" halign="left">4. Regression Models</td><td valign="top" halign="left">Once students pass <em>Statistical Inference</em>, this course seems less difficult. However, the lectures include a fair amount of statistical theory (i.e. <a href="https://en.wikipedia.org/wiki/Ordinary_least_squares">Ordinary Least Squares</a>) including derivations of various formulas. </td></tr>
<tr><td valign="top" halign="left">5. Practical Machine Learning</td><td valign="top" halign="left">The difficulty level in this course is driven by the challenge of the course project, as well as the fact that changes in R packages for the various machine learning algorithms used in the course make it difficult for students to exactly match answers to the quiz questions. The course project difficultly level was reduced significantly after the publication of <a href="http://bit.ly/2bYtutG">Improving Performance of Random Forest with caret::train()</a>, which provides step by step instructions for using parallel processing in machine learning algorithms. Also contributing to difficulty in this course is the requirement for students to <a href="http://bit.ly/2bTvGqr">publish their final assignments as Github pages websites.</a> </td></tr>
<tr><td valign="top" halign="left">6. Reproducible Research</td><td valign="top" halign="left">I rate this course as slightly more challenging than <em>Getting and Cleaning Data</em> because students need to apply what they learned in <em>GCD</em> to a real world problem. Messy data, a data collection methodology that varies significantly over the time period data is gathered, and ambiguous documentation from our friends at the <a href="https://www.ncdc.noaa.gov/stormevents/details.jsp">National Oceanic and Atmospheric Administration</a> leave many decisions to be made by the student.

Additionally, understanding the messiness of the data well enough to write the correct regular expressions needed to clean the data takes time. It took me about 12 hours of work to complete the final project.  </td></tr>
<tr><td valign="top" halign="left">7. Getting and Cleaning Data</td><td valign="top" halign="left">While less challenging than some of the other courses, some of the elements that make this course difficult include:<br><br><list>
<li>Wide variety of data formats / APIs used in the course,</li>
<li>Ambiguous directions for the course project, that leave students asking lots of questions about the "right" way to do things, and</li>
<li>Very poor documentation from the data provider for the course project, which is after all, the point of this assignment: learn about the importance of a well-documented data set by using one that's poorly documented.</li>
</list> </td></tr>
<tr><td valign="top" halign="left">8. Developing Data Products</td><td valign="top" halign="left">Once a student has made it through other courses in the curriculum, the problems to be solved in this course are pretty straightforward within the four weeks allotted for the course.</td></tr>
<tr><td valign="top" halign="left">9. Exploratory Data Analysis</td><td valign="top" halign="left">Other than <em>Toolbox</em>, this is the easiest course in the Specialization. Learn how to use the base and ggplot graphics packages, draw some charts, and learn basic techniques to describe data (histograms, boxplots, etc.).  </td></tr>
<tr><td valign="top" halign="left">10. The Data Scientist's Toolbox</td><td valign="top" halign="left">Concepts and assignments are very straightforward (i.e. download software from CRAN, create Github account, etc.) and the course could be finished in a day or two of concerted effort.</td></tr>
</table>
