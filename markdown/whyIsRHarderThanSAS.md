## Background

In the summer 2015 classes for *R Programming* and *Getting and Cleaning Data* a number of students with SAS experience raised concerns about R being more difficult to learn than SAS. This article explains some of the features of SAS that make it easier for a beginning student to learn than R.

## Learning Curve: R vs. SAS

R is more difficult to learn than SAS for beginning tasks for four reasons:  

1. SAS has been in development for over 40 years, and the SAS Institute has had 40 years to figure out how to simplify teaching the language to new users,
2. Simple SAS tasks can be completed with programming structures that are less abstract than R,
3. The SAS Institute has been improving documentation of the product since 1985 and all of it is available online, and
4. There are years of SAS Users Group papers explaining how to use different aspects of the software. Note that it's easier to give away a large volume of documentation if the single user first year license is $9,000, plus annual maintenance of 20% every year thereafter.  

There are two major components in SAS: the DATA step and the PROC step.

The DATA step is used to read data into SAS and manipulate it. The DATA step is very powerful, but is relatively easy to learn for two reasons. First, it is based on a traditional programming language (PL/1) that has a straightforward syntax. Second, the SAS Institute produced an easy to follow guide to its use for simple tasks, [Step by Step Programming with Base SAS Software](http://support.sas.com/documentation/onlinedoc/91pdf/sasdoc_913/base_step_10071.pdf). In addition to documentation developed by the SAS Institute, there are many other external references to help you learn about the concepts behind the DATA Step, such as this [SAS Users Group paper](http://www2.sas.com/proceedings/sugi31/246-31.pdf).

PROC steps include a large library of canned analysis programs, such as:  

* PROC SUMMARY: summarizes data into groups
* PROC TABULATE: generates tabular reports
* PROC REG: performs regression analysis
* PROC SORT: sorts a SAS dataset by one or more variables There is a large volume of documentation on SAS PROC steps, such as the [Base SAS Procedures Guide](http://support.sas.com/documentation/cdl/en/proc/61895/PDF/default/proc.pdf), and the [SAS/STAT Users Guide](http://support.sas.com/documentation/onlinedoc/stat/141/statug.pdf).   

Arguably, the PROC Step library of procedures is similar to R packages that you install from the CRAN-R library, but the abstract nature of the R language often makes these packages more difficult to use than the typical SAS procedure. The differences in the structures of the language also lead to different thinking about what is an "effective" solution to a given problem. A concrete example of the difference is illustrated in the article [Thinking in R vs. Thinking in SAS](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/exampleSortRvsSAS.md), which compares how to sort a data set in R vs. SAS using "out of the box" functionality.    

Two parts of SAS are more abstract than simple DATA & PROC Steps, and hence more difficult to master:  SAS/IML (interactive matrix language), and the SAS macro language.   

SAS/IML is very much like R -- one writes code to manipulate matrices & vectors. With SAS/IML one can develop statistical algorithms to perform analyses for which there are no existing SAS procedures. As an undergraduate Research Assistant, I used SAS/IML's predecessor, PROC MATRIX, to conduct a social network analysis of political contributions among Illinois Republican legislative candidates. At the time there were no "out of the box" SAS procedures to calculate metrics like social distance in a network of people, so I had to construct my own algorithms in PROC MATRIX. My experience in the *R Programming* class is bringing back memories of writing code in PROC MATRIX.   

SAS Macro language is a code generator -- it allows you to create segments of code whose output is SAS code. The macro language is very powerful, but due to its abstract nature takes time to learn. The macro language allows you to generate code to automate repetitive tasks, reducing the time it takes to write a large volume of SAS code.  As an illustration, here is a SAS macro I wrote many years ago.  

    %macro presuf(pre,suf,suf2,type=OTHER);
            %local i word;
            %let i = 1;
            /* grab tokens from suffix list */
             %let word=%scan(&suf,1,%str( ));
            %do %while (&word ^= );
                    %if &type = MACRO %then %do;
                         %&&pre(&word)
                    %end;
                    %else %do;
                         &&pre&word&suf2
                    %end;
                    %let i = %eval(&i + 1);
                    %let word = %scan(&&suf,&i,%str( ));
            %end;
    %mend presuf;




Without additional context, it's difficult to understand the behavior of this macro, which takes a list of variable names, and either combines them with prefixes & suffixes to be processed as a group, or  generates a set of macro calls one word at a time.    

In summary, the key things that make SAS easier to learn than R are the quality of its documentation that evolved over a 40+ year period, and the concreteness of the language that makes it easy to get simple tasks done without having to learn a large volume of abstract symbols. Still, it's not $9,000 worth of "easier," especially if you're on a student's budget.  

Another take on the learning curve of R relative to other packages is Robert Kabacoff's blog post on his Quick-R website, [Why R has a Steep Learning Curve](http://bit.ly/2MVJuz7l) 

*last updated: 9 February 2019* 
