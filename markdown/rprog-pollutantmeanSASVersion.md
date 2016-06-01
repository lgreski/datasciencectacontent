# A SAS Version of pollutantmean()?

Between summer 2015 and spring 2016 a number of students in the [Johns Hopkins University Data Science curriculum on coursera.org](http://wwww.coursera.org/specializations/jhu-data-science) have tried to approach *R Programming* based on their past experience with SAS. Unfortunately for these students, the programming paradigm in R is significantly different from the one used in SAS.  

A basic illustration of some of the differences between the two languages is covered in the article [Thinking in R versus Thinking in SAS](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/exampleSortRvsSAS.md), where something that is very straightforward to a SAS programmer \(sorting a data set\), appears to be much more complicated in R.

That said, once a person knows R, things that are very easy in R can be much more complex in SAS. Ironically, one example of this phenomenon is the `pollutantmean()` function that is one of three components in the first programming assignment in the *R Programming* course.

## Requirements for a SAS-based Solution

The general requirements for `pollutantmean()` are covered in [Breaking down pollutantmean()](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-discussPollutantmean.md), so we won't go into the details here. Generally speaking, we need to accomplish the following:

1. Read one or more of the pollution sensor files
2. Calculate a mean for one of the pollutants, either `nitrate` or `sulfate`
3. Write the code for 1 and 2 in a way that one can run the analysis by passing a set of parameters to the code, versus copying & pasting the code to handle different sets of sensors and/or pollutants, as illustrated in the [sample output from the assignment](https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2Fpollutantmean-demo.html).

<img="./images/rprog-pollutantmeanWithSAS01.png">

Reading and calculating a mean of one sensor file in SAS is very easy.

    # code & output for reading sensor 23 goes here, so we can compare it to
    # the sample output above

The tricky part in replicating `pollutantmean()` in SAS is that it does not have an out-of-the-box ability for end users to develop a SAS procedure and access it from the base software. Instead, SAS provides a macro language that allows SAS users to parameterize and generate SAS code. Therefore, we will implement `pollutantmean()` as a SAS macro.

### Step 1: Identifying the Files to Read

The programming assignment instructions tell the student to assume that the raw data files to be processed by `pollutantmean()` reside in a `specdata` subdirectory from the R Working Directory. Given this assumption, we can generate a list of sensor files using the SAS macro language.

In an R-based solution, the student has a choice of design approaches: s/he can either obtain a list of the data files from the operating system with the right R function, or s/he can construct the file references from the list of sensor IDs passed in the `id` argument in the `pollutantmean()` function.

SAS provides a similar design choice, albeit with a more complex implementation. The SAS macro language can be used to generate file names based on the macro arguments, but in order to use them in a subsequent step we must add them to a SAS data set.

SAS provides a `pipe` option on the `FILENAME` statement that enables a SAS program to access operating system commands, such as `ls` in unix-based systems or `dir` for Windows. Unfortunately, SAS University is configured in `LOCKDOWN` mode, so we are not able to demonstrate this approach.

Instead, we'll use the macro language within a `DATA step` to generate the required filenames.

Code for the first step looks like:


        * ;
        * step 1: generate list of files ;
        * ;
        * Note that we need a "hack" to generate the list of filenames ;
        * because SAS University restricts access to the FILENAME PIPE ;
        * that is required to query the filenames in a directory ;
        * ;

       %let i = 1;
       %let word = %scan(&id,&i,%str( ));
       data specdata;
         length aFile $100.;
       %do %while(&word ^= );
         * generate a variable for the file name and write to output data set ;
         aFile = "/folders/myfolders/&directory/&word..csv";
         output;
         %let i = %eval(&i + 1);
         %let word = %scan(&id,&i,%str( ));
       %end;
       run;


## Step 2: Reading the Pollution Sensor files

This turns out to be the most challenging part of the solution. We must read a variable number of input files and combine them into a single SAS data set. Since the `DATA step` is a very flexible tool, we can use the following approach to read the data from each raw data file.

1. Read one input file name from the SAS data set created in the previous step, and use the file name as the argument to an `INFILE` statement.<br><br>
2. Using a `do loop`, read each line of the raw data file, and write it to the output SAS data set.



    * step 2: read the raw data files ;
    data sensors;
      length theFileName $100.;
      set specdata;
      infile dummy filevar = aFile length=reclen end=done missover dlm=","
      firstobs=2;
      do while(not done);
        input Date $12. sulfate nitrate id;
        output;
    end;
    run;


## Step 3: Calculate the Mean

This step is trivially easy, given that SAS has a large library of canned procedures. Using the output data set from Step 2, the `means` procedure can be used to generate the required mean. This is the one area where the SAS solution is easier than the R solution, because SAS automatically eliminates missing values when calculating the mean, whereas R forces the programmer to tell R not to use missing values via the `na.rm=TRUE` argument.


    * step 3: generate mean for selected variable ;
    proc means data = sensors mean;
      var &pollutant;
      title "Mean for sensors &firstword thru &lastword";
      run;


## Simplifying Assumptions  

For the purposes of this exercise, we pass the list of sensors as numbers separated by spaces, a format that is easy to process by the SAS macro language. Since the macro language is primarily a string \(text\) processor, we include the leading zeroes needed to generate the correct input files.
With additional programming, we could parse the lengths of the sensor numbers and add the required number of leading zeroes to simulate the output of the R `sprintf()` function.

## Putting It All Together

The last piece of the puzzle is the syntax for a SAS macro. We needed three parameters: a directory where the sensor data is stored, a variable on which to calculate a mean, and the list of sensors to include in the mean.

    %macro pollutantmean(directory,pollutant,id=);
    * ;
    * programming statements go here ;
    * ;
    %mend pollutantmean;

## ...And Finally, the Output

Here is the output generated by executing the `%pollutantmean()` macro against the examples that were provided with the assignment instructions.


      %pollutantmean(specdata,sulfate,id=001 002 003 004 005 006 007 008 009 010)

<img src="./images/rprog-pollutantmeanWithSAS02.png">


      %pollutantmean(specdata,nitrate,id=070 071 072)

<img src="./images/rprog-pollutantmeanWithSAS03.png">


      %pollutantmean(specdata,nitrate,id=023)

<img src="./images/rprog-pollutantmeanWithSAS04.png">
