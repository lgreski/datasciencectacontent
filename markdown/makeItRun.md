# Strategy for the Programming Assignments: make it work, make it right, make it fast

As class participants work on the *R Programming* assignments, a variety of strategies to solve problems in R will be discussed on the Discussion Forums. Usually people are already asking questions about the "right" way to do things in R within the first few days of Week 1.

For those of you who don't have prior programming experience, I thought I'd share an old programming aphorism -- "Make it work, make it right, make if fast." Background on this programming truism may be found at [http://c2.com/cgi/wiki?MakeItWorkMakeItRightMakeItFast](http://c2.com/cgi/wiki?MakeItWorkMakeItRightMakeItFast).

**Make it Work**

First, take the instructions for the programming assignment and summarize them into an outline. If the assignment requires use of multiple data files, determine whether the instructions say to combine them before processing, or to process them separately.  Then, for each step in the outline, identify R functions that could be used to help you solve the task at hand.

For an example of how to break down an assignment into an outline, take a look at the Designing a Solution section of my article, [Breaking down pollutantmean()](http://bit.ly/2cHyiCl). 

If necessary, put your hacker skills to work by making Google your friend. For example, if you're trying to solve the *R Programming* class Assignment 1, some of the following Google queries might be helpful:

* [list files in r](http://www.google.com/search?q=list+files+in+r)
* [subset data frame by list of values](http://www.google.com/search?subset+data+frame+by+list+of+values)
* [missing values in R](http://www.google.com/search?missing+values+in+r)

And yes, I did have to do some hacking around myself to figure out how to embed Google searches in this article.

Next, using RStudio you can then assemble parts of your program in the source window. To execute specific statements in the source window, simply highlight the rows you want to execute and press the <Run\> button at the upper right of the source window. will execute the code and you can see the results in the console.

Inspect the results of your statements to see whether they are working as you expect them to do (e.g. if you expect a dataframe as output, and the result is a logical, you need to change the code).

Once you complete all the steps in the outline for a particular function, test the entire function with some test cases that call the function with various arguments, and see whether the function executes without error. If yes, then you have a "working" function.

**Make it Right**

With working code, now you can test the function with a larger set of test cases, confirming that it produces "right" results against known results. For example, if you're trying to test `pollutantmean()` on 1 file, you can independently load 1 file in the console, calculate the mean, and compare the result to a run of your `pollutantmean()` function on the same file. If your tests pass, you have "made it right."

**Make it Fast**

Once the code produces the right results, you can profile its performance using `system.time()` or `RProf()`. Compare the code you've written to other samples of code using techniques that are known to produce faster results. Modify your code to improve its performance, while ensuring that the faster code generates the same outputs as those from the last step ("make it right").

**Summary**

The aphorism "make it run, make it right, make it fast" is a good process for people to use when they are learning to write programs in R. Since we're being graded on "make it right," don't worry about making it fast until you've made it right. This means that you should submit your work for grading as soon as you believe the functions produce the correct results, step by step, rather than waiting to complete everything before your first grading run. Remember, you don't get penalized for failed tests, the object is to fail quickly, and improve the solution incrementally.

** Update for New Coursera Courseware: February 2016 **

With the implementation of the Data Science Specialization curriculum on the new Coursera platform, the process of submitting *R Programming* assignments has changed from the use of a submit script to manually running the tests listed in a quiz. Since a student may make up to three attempts in 8 hours and there are no penalties for "failing" a quiz, it's still advisable to submit your work for grading as soon as you complete each component of the assignment rather than waiting until all components are complete.  
