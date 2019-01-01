# Thinking in R vs. Thinking in SAS

Coming into the Data Science Specialization with years of experience in SAS and SPSS, it took a concerted effort to understand some of the key concepts in R well enough for to use them effectively, such as:

> Everything that exists is an object.<br>
> Everything that happens is a function call.
>
>    -- John Chambers, quoted in *Advanced R* (1)

As I progressed through the Specialization and began work as a Community Mentor, I noticed other students struggling with the same issue, especially students who had prior experience with SAS. Arguably, one's SAS experience becomes an impediment to learning R to the degree that we expect R to work like SAS.

For example, once you've had experience in SAS, you tend to think about sorting like this:

    /*
     * read the mtcars data set from the R datasets library,
     * after having written it with a pipe delimiter and no column names
     */

    data mtcars;
       infile "/folders/myfolders/mtcars.tsv" dlm="|";
       input vehicle : $20. mpg cyl disp hp drat wt qsec vs am gear carb;
       run;
    /*
     * sort the data by cyl and mpg
     */  
    proc sort data = mtcars out = sorted;
       by cyl mpg;
       run;
    /*
     * print the data
     */  
    proc print data = sorted;
    run;


![sas-output-mtcars.png](https://coursera-forum-screenshots.s3.amazonaws.com/69/ca71306a2411e5abbc6b922f7b95ed/sas-output-mtcars.png)  



The R version of sorting requires either loading a package specifically designed to sort data frames, or knowledge of syntax to coerce the vector-oriented `order()` function to operate on a data frame by ordering the rows as an operation within the row component of the `dataFrame[rows , columns]` syntax as follows:

    library(datasets)
    head(mtcars)
    #
    # use base::order() to sort the data frame by cyl and mpt
    #
    orderedData <- mtcars[order(mtcars$cyl,mtcars$mpg),]
    head(orderedData)

                   mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    Volvo 142E    21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
    Toyota Corona 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    Datsun 710    22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    Merc 230      22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    Merc 240D     24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    Porsche 914-2 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    >

The "out of box" R solution to the sort problem would not seem intuitive to a SAS programmer.  As we gain experience with R and learn about the existence of packages such as Hadley Wickham's `dplyr`, we discover that third party package developers have built a variety of capabilities to shield people from some of the complexities of the base language for common data manipulation tasks. For example, dplyr's `arrange()` function arranges rows in a data frame based on the values of one or more variables. 

While these features are helpful to reduce the amount of R code required for common data manipulation tasks, it's still important to understand how R works under the covers in order to use these packages correctly.

**Bottom line:** if you're used to working with SAS and expect R to behave in a similar manner (e.g. R must have a `sort()` function that works on data frames, not vectors), you're in for a steep learning curve while you "unlearn" how one does things in SAS, or find the third party packages that support features whose behavior is more similar to SAS.

### References

(1) Wickham, Hadley (2015) -- *Advanced R*, CRC Press, Boca Raton, FL
