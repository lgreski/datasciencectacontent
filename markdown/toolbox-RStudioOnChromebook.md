# R and RStudio on a Chromebook?

In the *Data Science Specialization*, students sometimes ask whether the coursework can be completed on a Chromebook. While it is possible to access R and RStudio on a Chromebook, it's important to understand that the computing requirements become more intensive for certain courses, including:

<table>
<tr><th halign="left">Course</th><th halign="left">Computing Considerations</th></tr>
<tr><td valign="top">Capstone</td><td>Requires a machine with significant processing power, at least 16GB of RAM in order to process (without sampling) the 4 million rows of text content that must be processed to build a text prediction algorithm. </td></tr>
<tr><td valign="top">Practical Machine Learning</td><td>Due to the processor-intensive nature of the machine learning algorithms covered in the course, the more speed and memory a machine has, the more choices a student can make when building the final project. That said, I have completed the models on a tablet with 2GB of RAM and an Intel Atom-based processor, but a single model took over one hour to process.</td></tr>
<tr><td valign="top">Reproducible Research</td><td>A large volume of messy data from our friends at the <a href="http://www.noaa.gov">National Oceanic and Atmospheric Administration</a> leads to a significant data cleaning task. Since R processes everything in memory, more compute power makes this course easier to complete.<br><br>That said, I have been able to process this assignment on a Chromebook.</td></tr>
</table>

## Making it Work

I originally wrote this article in November 2016. Since then I have successfully [installed R and RStudio on Chromebook](http://bit.ly/2tHLVOo) using the Crouton tool. It's not a trivial amount of work, but it is possible to do many of the assignments required for the Johns Hopkins *Data Science Specialization* on a Chromebook. 

## Additional Resources

1. [Rollapp](https://www.rollapp.com/app/rstudio): Provides access to R / RStudio, including read only file access to a variety of cloud-based disk storage
2. [Linux on Chromebook / Crouton](https://gigaom.com/2014/12/30/chromebooks-can-now-run-linux-in-a-chrome-os-window/): Gigaom article including a video that explains how to install Linux on a Chromebook. Once you've installed Linux, students can then install a Linux version of R and RStudio.  
3. [Aurio on Amazon Cloud](https://aws.amazon.com/marketplace/pp/B00VETUL8M?qid=1479050009114&sr=0-3&ref_=srh_res_product_title): The Aurio application in the Amazon Web Services Marketplace is another potential way to access R / RStudio through a Chromebook.

*Last Updated: 7 October 2017* 
