# R Onboarding for SAS Users

First, I'd like to welcome another SAS user to the *R Programming* course in the Johns Hopkins Data Science Specialization on [coursera.org](http://www.coursera.org). You are following in the footsteps of a long line of \(mostly\) university-trained SAS users into the wild world of R. Your journey will both be fun and frustrating, as you discover that R is much different than the record-oriented processing that is the base of the SAS DATA step, based on its heritage of reading raw data files based on IBM mainframe file structures of the 1970s. On the fun side, you'll be amazed at the power of R given its cost \(free\), and the wide variety of packages that have been contributed by the R community.

As to my background in SAS, I started statistical programming back when I was an undergraduate, using SAS 82 (SAS releases were named by year before the Multi-Vendor Architecture was implemented in 1985). My first work in SAS was as an undergraduate Research Assistant on a National Science Foundation project to study political contributions to Illinois legislative candidates that supported [The Party Network: The Robust Organization of Illinois Republicans](http://www.amazon.com/Party-Network-Organization-Illinois-Republicans/dp/0299124541/ref=sr_1_1?ie=UTF8&qid=1465088282&sr=8-1&keywords=the+party+network+mildred+schwartz), by Mildred A. Schwartz.

Since then I've written a wide variety of software in SAS, including a principal components pre-processor to an expert system that discovered a secret price test on various laundry detergent products that was being conducted by a large consumer package goods manufacturer. I have also taught *Base SAS* and *SAS Macro Language* in corporate environments.

If you've ever used *SAS/IML*, the interactive matrix language, you'll find many parts of R are like *SAS/IML*. Since *SAS/IML* uses a programming model that is significantly different from *Base SAS*, as you learn R you will experience a learning curve that is similar to a SAS user learning to work with *SAS/IML*.

The bottom line is that thinking in R is significantly different than thinking in SAS. To highlight some of the differences, take a look at [Thinking in R versus Thinking in SAS](http://bit.ly/2cH3u8x), and [Why is R Harder than SAS?](http://bit.ly/2erxk3A)

Before you begin working on the first programming assignment, read the following, in order:

[Strategy for the Programming Assignments](http://bit.ly/2ddFh9A),

[Derek Franks' Tutorial for Those Struggling with Assignment 1](https://github.com/derekfranks/practice_assignment), and

[Breaking Down Pollutantmean()](http://bit.ly/2cHyiCl), which provides a detailed walkthrough illustrating how to organize this function.

You might also enjoy [Commercial Statistics Packages: An Historical Perspective](http://bit.ly/2fPj2qN), but it's not required to get through the assignment.

Another interesting but not required read is [Linda Burtch's](http://www.kdnuggets.com/author/linda-burtch) article [SAS vs. R vs. Python: Which Tool do Analytics Pros Prefer?](http://www.kdnuggets.com/2016/07/burtchworks-sas-r-python-analytics-pros-prefer.html) on the kdnuggets.com website.

The "expert" on the topic of converting from SAS to R is Bob Muenchen, author of [R for SPSS and SAS Users](http://bit.ly/2AmXTjs), where you'll find a detailed introduction to R for experienced users of SAS and SPSS. 

Finally, if you're interested in understanding how R compares to other statistics packages for a variety of statistical analyses, take a look at the [Data Analysis Examples](http://bit.ly/2hdIsyU) page on UCLA's Institute for Digital Research and Education website.

After completing the first programming assignment, you'll discover that the R-based solution to `pollutantmean()` is significantly less complicated than a SAS-based solution. How can I say this? [A SAS Version of pollutantmean()?](http://bit.ly/2d3DR4e) illustrates the code needed to replicate `pollutantmean()` in SAS. Believe it or not, one can complete the `pollutantmean()` assignment in a single R statement. It's a complex statement of nested functions, but it evaluates as a single R statement.

The SAS version of `pollutantmean()` is a lot more complicated than the most elegant R solution, in part because the design of SAS forces one into using SAS macros because SAS does not make it easy for end users to write their own SAS procedures. While it is technically possible for an end user to write a SAS procedure \(see [Betancourt 1985](http://www.sascommunity.org/sugi/SUGI85/Sugi-10-127%20Betancourt.pdf)\), it requires a significant effort.
