# R Onboarding for SAS Users

First, I'd like to welcome another SAS user to the *R Programming* course in the Johns Hopkins Data Science Specialization on [coursera.org](http://www.coursera.org). You are following in the footsteps of a long line of \(mostly\) university-trained SAS users into the wild world of R. Your journey will both be fun and frustrating, as you discover that R is much different than the record-oriented processing that is the base of the SAS DATA step, based on its heritage of reading raw data files based on IBM mainframe file structures of the 1970s. On the fun side, you'll be amazed at the power of R given its cost \(free\), and the wide variety of packages that have been contributed by the R community.

As to my background in SAS, I started statistical programming back when I was an undergraduate, using SAS 82 (SAS releases were named by year before the Multi-Vendor Architecture was implemented in 1985). My first work in SAS was as an undergraduate Research Assistant on a National Science Foundation project to study political contributions to Illinois legislative candidates that supported [The Party Network: The Robust Organization of Illinois Republicans](http://www.amazon.com/Party-Network-Organization-Illinois-Republicans/dp/0299124541/ref=sr_1_1?ie=UTF8&qid=1465088282&sr=8-1&keywords=the+party+network+mildred+schwartz), by Mildred A. Schwartz.

Since then I've written a wide variety of software in SAS, including a principal components pre-processor to an expert system that discovered a secret price test on various laundry detergent products that was being conducted by a large consumer package goods manufacturer. I have also taught *Base SAS* and *SAS Macro Language* in corporate environments.

If you've ever used *SAS/IML*, the interactive matrix language, you'll find many parts of R are like *SAS/IML*. Since *SAS/IML* uses a programming model that is significantly different from *Base SAS*, as you learn R you will experience a learning curve that is similar to a SAS user learning to work with *SAS/IML*.

The bottom line is that thinking in R is significantly different than thinking in SAS. To highlight some of the differences, take a look at [Thinking in R versus Thinking in SAS](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/exampleSortRvsSAS.md), and [Why is R Harder than SAS?](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/whyIsRHarderThanSAS.md)

Before you begin working on the first programming assignment, read the following, in order:

[Strategy for the Programming Assignments](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/makeItRun.md),

[Derek Franks' Tutorial for Those Struggling with Assignment 1](https://github.com/derekfranks/practice_assignment), and

[Breaking Down Pollutantmean()](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-discussPollutantmean.md), which provides a detailed walkthrough illustrating how to organize this function.

You might also enjoy [Commercial Statistics Packages: An Historical Perspective](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/statsPackagesHistory.md), but it's not required to get through the assignment.

After completing the first programming assignment, you'll discover that the R-based solution to `pollutantmean()` is significantly less complicated than a SAS-based solution. How can I say this? [A SAS Version of pollutantmean()?](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-pollutantmeanSASVersion.md) illustrates the code needed to replicate `pollutantmean()` in SAS. Believe it or not, one can complete the `pollutantmean()` assignment in a single R statement. It's a complex statement of nested functions, but it evaluates as a single R statement.

The SAS version of `pollutantmean()` is a lot more complicated than the most elegant R solution, in part because the design of SAS forces one into using SAS macros because SAS does not make it easy for end users to write their own SAS procedures. While it is technically possible for an end user to write a SAS procedure \(see [Betancourt 1985](http://www.sascommunity.org/sugi/SUGI85/Sugi-10-127%20Betancourt.pdf)\), it requires a significant effort.
