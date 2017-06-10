# An Historical Perspective on Statistics Packages

In the discussion thread **Very frustrated and disappointed about this course** during the August 2015 run of *Getting and Cleaning Data*, a number of thread participants have drawn comparisons between R and SAS, where R usually is perceived as inferior.  In the September run of *R Programming*, there were also a number of posts where commenters expressed frustrations about R relative to SAS.  

At one point in the *Getting and Cleaning Data* discussion, a commenter in the discussion thread described the primitive nature of R console programming as a "throwback to the 70s."  My response is that commercial stats packages weren't always as easy to use as they are now. To elaborate on this point, I thought it might be useful to cross-post an article I wrote in the July 2015 _R Programming_ course on the history of the major commercial stats packages. The original article was written in response to discussion about the performance of R and other programming languages.       

Traditionally, the dominant languages used for data analysis by large companies are SAS and SPSS, followed by a host of other packages used in lesser degree (Systat, Minicab, Stata, JMP \[for Macintosh, developed by SAS & used extensively at Apple Inc.\], etc.). A list of stats packages, both open source and commercial, may be found at [https://en.wikipedia.org/wiki/List\_of\_statistical\_packages](https://en.wikipedia.org/wiki/List_of_statistical_packages).  In large companies there is also a lot of work done with reporting / analytics applications (Qlikview, Business Objects, etc.), but for serious statistical analysis, most companies use stats packages.  A 2013 report on popularity of stats packages is located at [http://r4stats.com/articles/popularity/](http://r4stats.com/articles/popularity/).   

SPSS and SAS were originally designed to run on mainframe computers where the programs were run in batch mode, versus executing them line by line in an interactive session.   

SPSS (Statistical Package for the Social Sciences) was originally written in Fortran in the 1960s to analyze data on punched cards. Additional information on the history of SPSS is located at [SPSS Versions and Ownership History](https://en.wikipedia.org/wiki/SPSS#Versions_and_ownership_history).   

SAS (Statistical Analysis System) was originally a combination of PL/1, Fortran, and Assembly Language. The first commercial release of SAS was in 1972, after approximately 6 years in development. It was rewritten in C in 1985 as part of the SAS Institute's migration to a multi-vendor architecture, meaning that SAS could be compiled & run on multiple computer operating systems (IBM MVS, IBM VM/CMS, Windows PC, HP/UX, Sun, etc.).  Additional information on the history of SAS is located at [SAS (software) History](https://en.wikipedia.org/wiki/SAS_(software)#History).   

Programming languages and computing hardware have changed a lot since I used LISREL on an IBM 4381 to analyze political contributions to Illinois legislative candidates for my master's thesis. With a maximum RAM of 64MB, the 4381 had way less memory and disk space than my HP Envy X2 tablet, and I had to share its compute capacity with thousands of other users.   

One of the things I like about R is its price -- free. I'm an experienced SAS programmer, but the cost of a single user SAS license is $9,000 USD -- too expensive for a learner unless you are at a university where they have a sitewide license to use the software, or register online to use the SAS University version of the software. Even an initial license for SPSS is about $2,500 USD, not accessible to the individual user who is not at a university where they have a sitewide license, or student pricing for individual licenses. Systat is cheaper (about $1,400 USD, academic price $739), but still too expensive for the average student not studying at a brick & mortar university. (1)  

An historical note about Systat, which I include because of an R Programming Discussion Forum thread that discussed the performance of various versions of `pollutantmean()` -- it was originally developed by Leland Wilkinson, Ph.D. at the University of Illinois at Chicago as a numerical analysis tool on a Cromemco Z2 S-100 microcomputer. He developed it because he was frustrated at the long wait times for his batch jobs at the UIC computer center.

Even though his programs were really slow on the S-100, the turnaround times on the S-100 were faster than using the mainframe because he didn't have to wait for anyone else's batch jobs to run. I had the privilege to learn exploratory data analysis and statistical graphics from Dr. Wilkinson when I was in graduate school.  Information about the history of Systat is available at [http://www.cs.uic.edu/~wilkinson/SYSTAT/systat.html](http://www.cs.uic.edu/~wilkinson/SYSTAT/systat.html).   

As an aside, Professor Wilkinson is also the author of the book *The Grammar of Graphics*, which is referenced in the Data Science Specialization course *Exploratory Data Analysis*. Wilkinson's book provides the theoretical framework used for the R package `ggplot2()`.

Open source software has revolutionized computing within the last 15 years. As it relates to statistics software in terms of performance relative to price, R is clearly the statistics tool of choice for the learner, and you don't have to wait hours for batch jobs to run, like Dr. Wilkinson had to do in the 1980s.  

### References

(1) License information retrieved from SAS, IBM (SPSS), and Systat websites in August 2015.  
