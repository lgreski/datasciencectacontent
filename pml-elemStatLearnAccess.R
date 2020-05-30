#
# access data files from Elementary Statistical Learning book
# see https://github.com/lgreski/datasciencectacontent/markdown/pml-ElemStatLearnPackage.md 


# technique 1: download from ESL website 
library(readr)
vowel.train <- read_csv("https://web.stanford.edu/~hastie/ElemStatLearn/datasets/vowel.train")
vowel.test <- read_csv("https://web.stanford.edu/~hastie/ElemStatLearn/datasets/vowel.test")



# technique 2 - download from CRAN github site 
theURL <- "https://raw.githubusercontent.com/CRAN/ElemStatLearn/master/data/SAheart.RData"

download.file(theURL,"./data/SAheart.RData",mode = "wb")
load("./data/SAheart.RData")
head(SAheart)

# technique 3 - download and install package from CRAN archive
#
# first, navigate browser to archive for the desired package 
# http://cran.r-project.org/src/contrib/Archive/ElemStatLearn 

# next, we download and unzip the file

url <- "http://cran.r-project.org/src/contrib/Archive/ElemStatLearn/ElemStatLearn_2015.6.26.tar.gz"
pkgFile <- "ElemStatLearn_2015.6.26.tar.gz"
download.file(url = url, destfile = pkgFile)

# Next, we install dependencies. Since there are no dependencies for ElemStatLearn, we skip this step.

# finally, we install the package with type = "source" and no repository
install.packages(pkgs = pkgFile, type = "source", repos = NULL)
library(ElemStatLearn)
head(bone)

# if desired, we can also delete the package tarball 
unlink(pkgFile)