# Tutorial: Downloading files

By the time students complete the programming assignments and quizzes in *R Programming*, they have had to download a number of files from URLs listed in the assignment / quiz instructions. As an example, the first quiz in *R Programming* has a number of questions that are based on a file that must be downloaded during the quiz. 

A beginning student will simply download the file from the URL, save it to the R working directory, and proceed with writing the R code necessary to answer the quiz questions.

A wise student will save the code  for later reference.  Even more beneficial is the ability to fully replicate the process in case the student at some point deletes or loses track of the data file. One way to solve this problem is to make the process coded in an R script fully reproducible (a topic that is covered in <em>Reproducible Research</em>) by using the `download.file()` function to automate the file download process.

## The basics

The syntax for `download.file()` has a subtle complexity. The obvious parameters include the URL to be downloaded, and the name of the file to which the content will be saved on a local disk drive. After that, additional parameters are dependent on the type of file to be downloaded, as illustrated in the following code fragment.

For the first few examples, we'll use a comma separated values file from the city of Baltimore. 

      #
      # download Baltimore City Cameras file, using default download method
      #
      download.file("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD",
         "cameras.csv",  # stores file in R working directory
         mode="w")  # "w" means "write," and is used for text files
         

## Upgrade 1: code that works on multiple operating systems

Since the `method` parameter varies by operating system, code written on Mac OSX / Linux won't work on a machine running the Windows operating system unless some of the parameters are changed.

In fact, I originally wrote [Creative Use of R: Downloading Course Lectures](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-downloadingLectures.md) on a Macbook Pro, so students who use Windows weren't able to run the code on their machines without modification.  One way to address the problem is to encourage students to use their hacker skills to figure it out on their own. 

Another way is to take advantage of R to figure out the operating system on which the code is running, and to set the `method` parameter based on the operating system. The function `Sys.getenv()` is used to access attributes of the environment in which R is running, and can be used to identify the operating system as follows.

      dlMethod <- "curl" # sets default for OSX / Linux
      if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMethod <- "wininet"

 Note that the above code fragment sets a text object to a default value before the `if()` statement so that the `dlMethod` object is accessible in subsequent statements.

Now we can enhance our `download.files()` function to work correctly regardless of operating system.

      #
      # download Baltimore City Cameras file
      #
      dlMethod <- "curl" # sets default for OSX / Linux
      if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMethod <- "wininet"
      download.file("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD",
         "cameras.csv",  # stores file in R working directory
         method=dlMethod, # use OS-appropriate method
         mode="w")        # "w" means "write," and is used for text files
         

## Upgrade 2: a good programmer is a lazy programmer...

Professor Peng talks about this in *R Programming*.  A lazy programmer doesn't do more work than is necessary. In the context of downloading files, once the file is downloaded, it is not necessary to download it again when running the script. To prevent multiple downloads, we enhance the code to check whether the destination file exists with the `file.exists()` function. In our example of downloading the *Getting and Cleaning Data* Baltimore City Cameras data file, the code would look like this:

      dlMethod <- "curl" # sets default for OSX / Linux
      if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMethod <- "wininet"
      if(!file.exists("cameras.csv")) {
          download.file("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD",
         "cameras.csv",  # stores file in R working directory
         method=dlMethod, # use OS-appropriate method
         mode="w")        # "w" means "write," and is used for text files
      }
      

## Upgrade 3: handling compressed files

The course project data for *Getting and Cleaning Data* includes multiple files that are compressed into a zip file. To use the data, students have to deal with the following changes relative to the code we've reviewed thus far:

1. Zip files are binary, not text, and
2. Once the file is downloaded, we must unzip it in order to use it.


       url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
       download.file(url,
                  destfile='HAR.zip',
                  method="curl", # for OSX / Linux 
                  mode="wb") # "wb" means "write binary," and is used for binary files
       unzip(zipfile = "HAR.zip") # unpack the files into subdirectories 

## Putting it all together: a function for downloading files

Having covered the basics and a set of enhancements to handle various situations, the next step would be to write a reusable function for downloading one or more files, as we did in [Creative Use of R: Downloading Course Lectures](http://bit.ly/2bGlI7R).

    #
    # download lectures, requires curl package
    #

    downloadLectures<- function(fileList,courseName="rProgramming prework") {
         # configure set download method for windows vs. Mac / Linux
         dlMethod <- "curl"
         if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMethod <- "wininet"
         for (i in 1:length(fileList)) {
              outFile <- paste(courseName,"_lecture_",sprintf("%03d.mp4",i),sep="")
              if(!file.exists(outFile)){
                   download.file(fileList[i],destfile=outFile,method=dlMethod,mode="wb")
              }

         }
    }


# Conclusion

Learning how to write code to download files of various types is a valuable tool in producing reproducible research. Since students may refer to code they've written months earlier as they progress through the *Data Science Specialization*, it's a good idea to develop the discipline of making one's code reproducible as soon as possible.
