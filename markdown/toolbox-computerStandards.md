# Overview

A question posted in the September 2016 run of *The Data Scientist's Toolbox* about buying a new laptop reminded me of a post I wrote about a year ago responding to a similar question in *Statistical Inference*. Often students in the specialization want to buy new computer equipment, and get confused by the number of different choices available.

Rather than recommending a specific rig, this article explains the key things that make an R program run faster or slower. Those characteristics that are related to computer hardware are useful to make decisions when buying a new computer for data science.  

# What Drives Performance of an R Program?

The key variables that determine processing performance (in descending order of importance) for an R program are:

1. Coding for performance -- Efficient code / high performance R packages can run orders of magnitude faster than slower code, even on a fast machine. For an illustration of this concept, see [American Community Survey Example](http://bit.ly/2bAdLE9), which shows how `readr::read_fwf()` improves initial load performance of `base::read.fwf()` from 19 minutes to less than 9 seconds, and cuts the amount of RAM consumed by the data frame from 700Mb to 341Mb.<br><br>
2. Amount of RAM available -- since R does all of its processing in memory, if your data frame won't fit in the available RAM, you're not going to process it in R. Get as much as you can afford: 8gb is good, 16gb is better, 32gb is still better.<br><br>
3. Processor speed -- since most "out of the box" R packages are single threaded, the faster the CPU, the faster the work will complete. Note that faster CPUs tend to be installed on heavier laptops that also have lower battery life. It's a classic speed vs. power consumption tradeoff. <br><br>
4. Number of processor cores -- for R packages that take advantage of multiple cores & threads, more threads are better than fewer threads. Therefore, 4 cores are better than 2 cores. Typically each core contains 2 threads, so a 4 core machine can run as many as 8 tasks in parallel in R packages that support threading. <br><br>
5. Disk speed -- only relevant for data load steps, but when you need to read data off the disk, solid state drives work much faster than mechanical drives, and 7,200RPM drives work faster than 5,400RPM drives. Some drives are rated by throughput, such as SATA II (3Gbps) and SATA 3 (6Gbps). Larger throughput numbers are better.

# Observations & Conclusions

First, it is possible to do serious work on very low powered machines. For example, I was able to complete the course project for *Practical Machine Learning* on a Windows-based tablet with a 1.8Ghz Intel Atom processor, 128Gb of solid state disk, and 2Gb of RAM.

It took 1 hour 15 minutes to run the analysis, but it did complete successfully, and produced the same answers that my quad core i7 gaming laptop produced in about 3 minutes.

If you're interested in seeing the impact of these variables on a machine learning problem, take a look at [Improving Performance of a Random Forest in caret::train()](http://bit.ly/2bYtutG), which compares the performance of four different machines processing of the course project.

Second, buy as much speed and as many processor cores as you can afford. Why? Faster machines allow you to explore the data more, so you understand it before developing hypothesis tests or using machine learning algorithms. A quad core machine will support eight independent threads, which greatly reduces runtime with packages that support parallel processing, such as `caret` in *Practical Machine Learning* and `quanteda` in the *Capstone*.  If you have to make a tradeoff between processor speed and number of cores, go with the machine that has more cores (e.g. quad core vs. dual core) because you'll appreciate the extra cores during *Practical Machine Learning* and the *Capstone*.

Third, buy at least 16gb of RAM if at all possible. You'll need 16gb of RAM for the Capstone project if you want to use the entire data set to build the text prediction model without breaking the problem down into many smaller chunks and assembling these parts into a working model. A 16gb machine can process all of the data required for the Capstone, as I discuss in [n-grams and Computer Capacity](http://bit.ly/2couvxh).

Finally, the quality of the code you write, as well as the performance characteristics of the R packages you use are the biggest determinants of program performance. Therefore, regardless of the machine you buy, it's worth learning how to write high performance R code. A good example of the difference that high performance code makes is [Reading American Community Survey Census Data with R](http://bit.ly/2bAdLE9). 

# Appendix: Operating System Selection -- Linux, OS X or Windows?

 Aspiring data scientists periodically ask questions about which operating system is "best" for R. The R software runs equally well in Linux, OS X, and Windows. [RStudio](http://bit.ly/2zj1iiW) is also supported on OS X, Windows, and a variety of Linux platforms. Interestingly, via the Crouton tool, one can also [install R and RStudio on a Chromebook](http://bit.ly/2tHLVOo).

I have installed R on all of these platforms so I could benchmark its performance on different platforms. Generally speaking, OS X and Windows are easiest to use because most R packages can be installed directly from CRAN as binary packages, avoiding the need for compilation from source on your computer.

## Caveat Linux?

Most R packages must be compiled from source on Linux. Often these packages require additional Linux libraries that must be installed on the operating system before the R packages will compile. Depending on the version of Linux being used, this requirement can lead to interesting discoveries as one determines the exact versions of Linux libraries required by the R packages. However, with some additional effort, Linux works just as well as OS X or Windows.

*last update: 4 November 2017*
