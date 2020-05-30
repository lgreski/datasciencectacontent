#
# access data files from Elementary Statistical Learning book
# see https://github.com/lgreski/datasciencectacontent/markdown/pml-ElemStatLearnPackage.md 


theURL <- "https://raw.githubusercontent.com/CRAN/ElemStatLearn/data/SAheart.RData"

download.file(theURL,"./data/SAheart.RData",mode = "wb")