## Capstone n-grams: how much processing power is required?

Students in the Johns Hopkins University Data Science Specialization Capstone course typically struggle with the course project because of the amount of memory consumed by the objects needed to analyze text. To help reduce the guesswork in the memory utilization, here is a table that illustrates the amount of RAM consumed by objects required to analyze the files for the Swift Key sponsored capstone: predicting text.

For the purposes of this analysis, all code was run on an HP Omen laptop with the following specifications.

<table>
    <tr>
        <th>Computer</th>
        <th>Configuration</th>
    </tr>
<tr>
   <td valign=top>HP Omen laptop</td>
   <td>
       <ul>
           <li>Operating system: Microsoft Windows 10, 64bit</li>
           <li>Processor: Intel i7-4710HQ at 2.5Ghz, turbo up to 3.5Ghz, four cores</li>
           <li>Memory: 16 gigabytes</li>
           <li>Disk: 512 gigabytes, solid state drive</li>
           <li>Date built: December 2013</li>
       </ul>
   </td>
</tr>
</table>


All text processing was completed with the <strong>quanteda</strong> package. The three input files for blogs, news, and twitter data were read as character strings and combined into a single object that was used as input to the `corpus()` function. The total number of texts processed across the combined file is 4,269,678.

Note that due to the size of the objects, a machine with a minimum of 16Gb of RAM is required to process the entire data set. The tokenized texts consume about 5.1 Gb of RAM, and must remain in memory in order to use them as input to the `quanteda::ngrams()` function. Therefore, the minimum number of objects in memory at any time is 2 -- the tokenized texts, and the output `ngrams` object. Since the object output by `ngrams()` is also over 5Gb, one must be judicious about deleting objects not needed before progressing to subsequent steps in order to avoid running out of memory on the machine, even if it has 16Gb of RAM.

<table>
<tr><th>Activity</th><th>Memory Used</th><th>Processing Time</th></tr>
<tr><td>Load data from the three raw data files into a corpus</td><td align="right">1.0Gb</td><td align="right">37 seconds</td></tr>
<tr><td>Tokenize corpus into sentences, using <code>quanteda::tokenize()</code></td><td align="right">1.3Gb</td><td align="right">509 seconds</td></tr>
<tr><td>Convert sentences into a character vector to be reprocessed by <code>quanteda::corpus()</code> and <code>quanteda::tokenize()</code></td><td align="right">N.A.</td><td align="right">6 seconds</td></tr>
<tr><td>Build corpus with text data organized into single sentences</td><td align="right">5.9Gb</td><td align="right">180 seconds</td></tr>
<tr><td>Build 2-grams</td><td align="right">6.3Gbs</td><td align="right">619 seconds</td></tr>
<tr><td>Build 3-grams</td><td align="right">6.5Gbs</td><td align="right">894 seconds</td></tr>
<tr><td>Build 4-grams</td><td align="right">6.5Gbs</td><td align="right">925 seconds</td></tr>
<tr><td>Build 5-grams</td><td align="right">6.3Gbs</td><td align="right">930 seconds</td></tr>
<tr><td>Build 6-grams</td><td align="right">6.1Gbs</td><td align="right">1,007 seconds</td></tr>
</table>

# Appendix: Choosing a Text Analysis Package for the Capstone

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

*last updated: 18 May 2017*
