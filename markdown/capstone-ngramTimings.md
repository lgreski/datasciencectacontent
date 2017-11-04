# n-gram Timings: 25% Sample

Starting tokenization...
  ...preserving Twitter characters (#, @)...total elapsed: 0.326000000000022 seconds.
  ...tokenizing texts
  ...removing separators....total elapsed:  48.7730000000001 seconds.
  ...replacing Twitter characters (#, @)...total elapsed: 12.5729999999999 seconds.
  ...replacing names...total elapsed:  0.0399999999999636 seconds.
Finished tokenizing and cleaning 1,067,420 texts.
Warning message:
In tokenize.character(char_tolower(theText), removePunct = TRUE,  :
  Arguments removePunctremoveNumbersremoveSeparatorsremoveTwitter not used.
> paste("theText size is: ",format(object.size(theText),units="auto"))
[1] "theText size is:  264.5 Mb"
> rm(theText)
> system.time(saveRDS(words,paste("./capstone/data/",outFile,"words.rds",sep="")))
   user  system elapsed
 24.930   0.275  25.543
> paste("Tokenized words size is: ",format(object.size(words),units="MB"))
[1] "Tokenized words size is:  1407.4 Mb"
> system.time(ngram2 <- ngrams(words,n=2))
   user  system elapsed
 68.699   8.085  78.631
Warning message:
'ngrams' is deprecated.
Use 'tokens_ngrams' instead.
See help("Deprecated")
> system.time(saveRDS(ngram2,paste("./capstone/data/",outFile,"ngram2.rds",sep="")))
   user  system elapsed
 40.647   0.399  41.378
> paste("ngram2 size is: ",format(object.size(ngram2),units="MB"))
[1] "ngram2 size is:  2029.8 Mb"
> rm(ngram2)
> ?tokens_ngrams
> system.time(ngram3 <- tokens_ngrams(words,n=3))
   user  system elapsed
131.732  22.382 161.632
> # runtime: 57.72 seconds x-360
> system.time(saveRDS(ngram3,paste("./capstone/data/",outFile,"ngram3.rds",sep="")))
   user  system elapsed
 63.118   0.790  64.876
> paste("ngram3 size is: ",format(object.size(ngram3),units="MB"))
[1] "ngram3 size is:  2885.5 Mb"
> rm(ngram3)
> # runtime: 356.14 seconds x-360
> system.time(ngram4 <- tokens_ngrams(words,n=4))
   user  system elapsed
193.003 124.425 419.931
> # runtime: 480 seconds x-360
> system.time(saveRDS(ngram4,paste("./capstone/data/",outFile,"ngram4.rds",sep="")))
   user  system elapsed
 78.835   1.078  81.811
> paste("ngram4 size is: ",format(object.size(ngram4),units="MB"))
[1] "ngram4 size is:  3618.2 Mb"
> rm(ngram4)
> system.time(ngram5 <- tokens_ngrams(words,n=5))
   user  system elapsed
201.675  83.696 339.453
> system.time(saveRDS(ngram5,paste("./capstone/data/",outFile,"ngram5.rds",sep="")))
   user  system elapsed
 76.676   0.658  78.221
> paste("ngram5 size is: ",format(object.size(ngram5),units="MB"))
[1] "ngram5 size is:  3915.3 Mb"
> rm(ngram5)
> system.time(ngram6 <- tokens_ngrams(words,n=6))
   user  system elapsed
206.480  89.015 342.710
> system.time(saveRDS(ngram6,paste("./capstone/data/",outFile,"ngram6.rds",sep="")))
   user  system elapsed
 77.300   0.497  77.953
> paste("ngram6 size is: ",format(object.size(ngram6),units="MB"))
[1] "ngram6 size is:  4035.1 Mb"
> rm(ngram6)
