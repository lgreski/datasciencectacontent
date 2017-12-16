# Capstone: Choosing a Text Analysis package

Given the diversity of R packages (over 9,000 available as of May 2017) and the popularity of natural language processing as a domain for data science, students have a wide variety of R packages from which to choose for the project.

## Key Considerations

There are two key considerations for selecting a package to use during the Capstone project: features and performance. First, does a particular package have the features one needs to complete the required tasks? Feature rich packages allow students to spend more time understanding the data instead of manually coding algorithms in R. Second, how fast does the package complete the work, given the amount of data to be analyzed. For the Capstone project, the data includes a total of 4,269,678 texts as we stated earlier in the article.

R conducts all of its processing in memory (versus disk), so the text algorithms must be able to fit the data in memory in order to process them. Text mining packages that use memory efficiently will handle larger problems than those that use memory less efficiently. In practical terms, R packages that use C/C++ will be more efficient, handle larger problems, and run faster than those which use Java.

The [CRAN Task View for Natural Language Processing](https://cran.r-project.org/web/views/NaturalLanguageProcessing.html) provides a comprehensive list of packages that can be used for textual analysis with R. Some of the packages used by students during the Capstone course include:

* [ngram](https://cran.r-project.org/web/packages/ngram/vignettes/ngram-guide.pdf)
* [quanteda](https://cran.r-project.org/web/packages/quanteda/quanteda.pdf)
* [RWeka](https://cran.r-project.org/web/packages/RWeka/RWeka.pdf)
* [tm](https://cran.r-project.org/web/packages/tm/vignettes/tm.pdf)

Each package has its strengths and weaknesses. For example, `ngram` is fast but it's capability is limited solely to the production of ngrams. `RWeka` and `tm` have a broader set of text mining features, but have significantly slower performance and do not scale well to a large corpus such as the one we must use for the Capstone project.

## Why use quanteda?

`quanteda` provides a rich set of text analysis features coupled with excellent performance relative to Java-based R packages for text analysis. Quoting Kenneth Benoit from the [quanteda github README](https://github.com/kbenoit/quanteda):

> **Built for efficiency and speed.** All of the functions in `quanteda` are built for maximum performance and scale while still being as R-based as possible. The package makes use of three efficient architectural elements: the `stringi` package for text processing, the `Matrix` package for sparse matrix objects, and the `data.table` package for indexing large documents efficiently. If you can fit it into memory, `quanteda` will handle it quickly. (And eventually, we will make it possible to process objects even larger than available memory.)

The aspect of quanteda being "R like" is very useful, in contrast to packages like `ngram`. Also, since `quanteda` relies on `data.table`, it's particularly well suited to use for the Capstone. Why? `data.table` has features to index a data table so students can retrieve values by index rather than having to sequentially process an entire data frame to extract a small number of rows. Since the final deliverable for the Capstone project is a text prediction app written in Shiny, students will find `data.table` is an effective and efficient mechanism to use with a text prediction algorithm.

## Quanteda Resources 

Ken Benoit and the quanteda team have recently upgraded the documentation for the quanteda package. As of late 2017 a number of resources are available to help people become productive with Quanteda, including the following.  

* [Quanteda Overview](http://bit.ly/2k3DVBC) 
* [Quanteda Design / Structure](http://bit.ly/2zhssX0)
* [Quick Start Guide](http://bit.ly/2AHy3V2)
* [Detailed Function Reference](http://bit.ly/2op7PF1)
* [Source Repository](http://bit.ly/2CnJPUG)
* [Report a Problem](http://bit.ly/2yIR3AE)

*last updated: 16 Dec 2017*
