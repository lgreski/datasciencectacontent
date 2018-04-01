# Capstone n-grams: how much processing power is required?

Students in the Johns Hopkins University Data Science Specialization Capstone course typically struggle with the course project because of the amount of memory consumed by the objects needed to analyze text. To help reduce the guesswork in the memory utilization, here is a table that illustrates the amount of RAM consumed by objects required to analyze the files for the Swift Key sponsored capstone: predicting text.

To assess our ability to process the complete corpus of data, we used an HP Omen laptop with the following specifications.

<table>
    <tr>
        <th>Computer</th>
        <th>Configuration</th>
    </tr>
<tr>
   <td valign=top>HP Omen laptop</td>
   <td>
       <ul>
           <li>Operating system: Microsoft Windows 10 Home, 64bit, Version 1709 </li>
           <li>Processor: Intel i7-4710HQ at 2.5Ghz, turbo up to 3.5Ghz, four cores with two threads each</li>
           <li>Memory: 16 gigabytes</li>
           <li>Disk: 512 gigabytes, solid state drive</li>
           <li>Date built: December 2013</li>
       </ul>
   </td>
</tr>
</table>


All text processing was completed with the <strong>quanteda</strong> package. The three input files for blogs, news, and twitter data were read as character strings and combined into a single object that was used as input to the `corpus()` function. The total number of texts processed across the combined file is 4,269,678.

<strong>NOTE:</strong> Due to ongoing changes in the quanteda package, performance of these processes change over time. The timings in this article were originally conducted during September 2016 with quanteda version 0.99. As of March 31, 2018, quanteda has had multiple revisions, leading to significant changes in the performance times that I originally published, as well as the sizes of the objects. I have updated the article to reflect the performance timings of quanteda 1.1.1.

Note that due to the size of the objects, a machine with a minimum of 16Gb of RAM is required to process the entire data set. The tokenized texts consume about 2.0 Gb of RAM, and must remain in memory in order to use them as input to the `quanteda::tokens_ngrams()` function. The 2.0 Gb sizing for the word token object is a large improvement vs. quanteda 0.99, which consumed 5.1 Gb of RAM.

The minimum number of objects in memory at any time is 2 -- the tokenized texts, and the output `ngrams` object. Since the object output by `tokens_ngrams()` is also over 5Gb, one must be judicious about deleting objects not needed before progressing to subsequent steps in order to avoid running out of memory on the machine, even if it has 16Gb of RAM.


Changes in the quanteda tokenization algorithm between version 0.99 and 1.1.1 caused the sentence tokenization step to run out of memory about about 95% of completion. Because quanteda supports use of the `c()` function to combine tokenized texts into a single corpus, and the sentences for each document are independent of other documents, I revised my algorithm so it processes the three sources of documents in a `list()` until the step where sentences are tokenized to words.

<table>
<tr><th>Activity</th><th>Memory Used</th><th>Processing Time</th></tr>
<tr><td>Remove non-ASCII characters from data files</td><td align="right">N.A.</td><td align="right">103 seconds</td></tr>
<tr><td>Build 3 corpii and tokenize to sentences using <code>quanteda::corpus_reshape()</code></td><td align="right">N.A.</td><td align="right">1,749 seconds</td></tr>
<tr><td>Combine corpii to single corpus</td><td align="right">1.8Gb</td><td align="right">5.9 seconds</td></tr>
<tr><td>Tokenize corpus to words</td><td align="right">2.0Gb</td><td align="right">867 seconds</td></tr>
<tr><td>Build 2-grams</td><td align="right">2.6Gb</td><td align="right">618 seconds</td></tr>
<tr><td>Build 3-grams</td><td align="right">4.8Gb</td><td align="right">1,681 seconds</td></tr>
<tr><td>Build 4-grams</td><td align="right">6.8Gb</td><td align="right">2,204 seconds</td></tr>
<tr><td>Build 5-grams</td><td align="right">7.6Gb</td><td align="right">2,574 seconds</td></tr>
<tr><td>Build 6-grams</td><td align="right">7.8Gb</td><td align="right">2,919 seconds</td></tr>
</table>

**Bottom line:** total processing to generate the n-grams from the word tokenized corpus is almost 3 hours.

###  System Information: HP Omen

The performance timings and sizes listed above were generated with the following versions of R and R packages.

    sessionInfo()
    R version 3.4.4 (2018-03-15)
    Platform: x86_64-w64-mingw32/x64 (64-bit)
    Running under: Windows >= 8 x64 (build 9200)

    Matrix products: default

    locale:
    [1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252    LC_MONETARY=English_United States.1252
    [4] LC_NUMERIC=C                           LC_TIME=English_United States.1252

    attached base packages:
    [1] parallel  stats     graphics  grDevices utils     datasets  methods   base

    other attached packages:
    [1] quanteda_1.1.1 stringi_1.1.7  stringr_1.3.0  dtplyr_0.0.2   readr_1.1.1

    loaded via a namespace (and not attached):
     [1] Rcpp_0.12.16        bindr_0.1.1         magrittr_1.5        stopwords_0.9.0     network_1.13.0      hms_0.4.2           munsell_0.4.3
     [8] colorspace_1.3-2    lattice_0.20-35     R6_2.2.2            rlang_0.2.0         fastmatch_1.1-0     plyr_1.8.4          dplyr_0.7.4
    [15] tools_3.4.4         grid_3.4.4          data.table_1.10.4-3 gtable_0.2.0        spacyr_0.9.6        RcppParallel_4.4.0  lazyeval_0.2.1
    [22] yaml_2.1.18         assertthat_0.2.0    tibble_1.4.2        Matrix_1.2-12       bindrcpp_0.2        ggplot2_2.2.1       ggrepel_0.7.0
    [29] glue_1.2.0          compiler_3.4.4      pillar_1.2.1        scales_0.5.0        lubridate_1.7.3     pkgconfig_2.0.1

# Processing with Less Memory

Most students do not have 16Gb of RAM on the computers they use for the Capstone project. In this situation, students have two options for processing the data: sampling, and iterative processing.

The sampling approach is relatively straightforward: take a random sample of the documents, and perform subsequent steps against the sampled documents.

The iterative approach is more complex because one must complete the following steps in sequence to process the data.

1. Break the incoming documents into `n` groups, each of which is small enough to process within the RAM limits of the computer used for the analysis.

2. For each item, complete the following steps:

    * Build the corpus
    * Tokenize the corpus
    * generate n-grams of varying sizes<br><br>

3. Assemble the subcomponent files by n-gram size, and break the n-grams into base and predicted words

4. aggregate to summarize each n-gram file into frequencies by base

Depending on the RAM available on one's computer, this approach can take a long time. Also the total clock time required will increase in inverse proportion to the RAM on a machine. That is, a machine with 2Gb of RAM will require smaller processing chunks and therefore more clock time than a machine with 4Gb or 8Gb of RAM.

## Example: Sampling Approach on Macbook Pro

The performance timings in this section were taken on a Macbook Pro with the following configuration.

<table>
    <tr>
        <th>Computer</th>
        <th>Configuration</th>
    </tr>
    <tr>
        <td valign=top>Apple Macbook Pro</td>
        <td>
            <ul>
                <li>Operating system: OS X High Sierra 10.13.4 (17E199)</li>
                <li>Processor: Intel i5 at 2.6Ghz, turbo up to 3.3Ghz, two cores with two threads each</li>
                <li>Memory: 8 gigabytes</li>
                <li>Disk: 512 gigabytes, solid state drive</li>
                <li>Date built: April 2013</li>
            </ul>
        </td>
     </tr>
</table>

As stated above, we need to sample at a level where the combined size of the tokenized corpus and the result n-gram object are less then the amount of RAM available on the machine. We selected a 30% sample, resulting in a tokenized words object of 601 Mb in size. Since we expect the resulting n-gram objects to be 1.5 - 4 times the size of the tokenized words object, a 30% sample will process within the 8Gb of RAM on the Macbook Pro we used to generate n-grams. Summarizing in the same manner as we did with the analysis on the HP Omen, here are the object sizes and timings for the 30% sample.  

<table>
<tr><th>Activity</th><th>Memory Used</th><th>Processing Time</th></tr>
<tr><td>Remove non-ASCII characters from data files</td><td align="right">N.A.</td><td align="right">14 seconds</td></tr>
<tr><td>Build 3 corpii and tokenize to sentences using <code>quanteda::corpus_reshape()</code></td><td align="right">N.A.</td><td align="right">314 seconds</td></tr>
<tr><td>Combine corpii to single corpus</td><td align="right">1.8Gb</td><td align="right">1.70 seconds</td></tr>
<tr><td>Tokenize corpus to words</td><td align="right">601Mb</td><td align="right">200 seconds</td></tr>
<tr><td>Build 2-grams</td><td align="right">919Mb</td><td align="right">42 seconds</td></tr>
<tr><td>Build 3-grams</td><td align="right">1.6Gb</td><td align="right">105 seconds</td></tr>
<tr><td>Build 4-grams</td><td align="right">2.2Gb</td><td align="right">145 seconds</td></tr>
<tr><td>Build 5-grams</td><td align="right">2.4Gb</td><td align="right">265 seconds</td></tr>
<tr><td>Build 6-grams</td><td align="right">2.4Gb</td><td align="right">380 seconds</td></tr>
</table>

### System Information: MacBook Pro

Performance timings and sizes listed above were generated with the following R and R package versions.

    sessionInfo()
    R version 3.4.4 (2018-03-15)
    Platform: x86_64-apple-darwin15.6.0 (64-bit)
    Running under: macOS High Sierra 10.13.4

    Matrix products: default
    BLAS: /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
    LAPACK: /Library/Frameworks/R.framework/Versions/3.4/Resources/lib/libRlapack.dylib

    locale:
    [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

    attached base packages:
    [1] parallel  stats     graphics  grDevices utils     datasets  methods   base     

    other attached packages:
    [1] quanteda_1.1.1 stringi_1.1.7  stringr_1.3.0  dtplyr_0.0.2   readr_1.1.1   

    loaded via a namespace (and not attached):
     [1] Rcpp_0.12.16        bindr_0.1.1         magrittr_1.5       
     [4] stopwords_0.9.0     network_1.13.0      hms_0.4.2          
     [7] munsell_0.4.3       colorspace_1.3-2    lattice_0.20-35    
    [10] R6_2.2.2            rlang_0.2.0         fastmatch_1.1-0    
    [13] plyr_1.8.4          dplyr_0.7.4         tools_3.4.4        
    [16] grid_3.4.4          data.table_1.10.4-3 gtable_0.2.0       
    [19] spacyr_0.9.6        RcppParallel_4.4.0  lazyeval_0.2.1     
    [22] yaml_2.1.18         assertthat_0.2.0    tibble_1.4.2       
    [25] Matrix_1.2-12       bindrcpp_0.2.2      ggplot2_2.2.1      
    [28] ggrepel_0.7.0       glue_1.2.0          compiler_3.4.4     
    [31] pillar_1.2.1        scales_0.5.0        lubridate_1.7.3    
    [34] pkgconfig_2.0.1

## Example: Sampling Approach on HP Chromebook 11 G5

The performance timings in this section were taken on an HP Chromebook 11 G5 with the following configuration.

<table>
    <tr>
        <th>Computer</th>
        <th>Configuration</th>
    </tr>
    <tr>
        <td valign=top>HP Chromebook 11 G5</td>
        <td>
            <ul>
                <li>Operating system: Chrome OS Version 61.0.3163.123 (Official Build) (64-bit), with R installed on Linux Xenial 16.04 running via Crouton</li>
                <li>Processor: Intel Celeron N3010 at 1.6Ghz, up to 2.48Ghz in burst mode, two cores with one thread each</li>
                <li>Memory: 4 gigabytes</li>
                <li>Disk: 32 gigabytes, solid state drive</li>
                <li>Date built: June 2017</li>
            </ul>
        </td>
     </tr>
</table>

The Chromebook has significantly less capacity than either of the two machines previously tested. However, we were able to run the n-gram build script for 2-grams through 6-grams on a 5% sample on the Chromebook. A 10% sample terminated with an out of memory error while generating 4-grams. A 15% sample terminated with an out of memory error while generating 3-grams. Performance timings for the 5% sample are listed in the following table.

**NOTE:** These timings were generated with quanteda 0.99.12, versus the other timings that were taken with quanteda 1.1.1.

<table>
<tr><th>Activity</th><th>Memory Used</th><th>Processing Time</th></tr>
<tr><td>Load data from the three raw data files into a corpus</td><td align="right">53 Mb</td><td align="right">4 seconds</td></tr>
<tr><td>Tokenize corpus into sentences using <code>quanteda::tokenize()</code></td><td align="right">89Mb</td><td align="right">147 seconds</td></tr>
<tr><td>Tokenize sentences into words using <code>quanteda::tokenize()</code></td><td align="right">319Mb</td><td align="right">106 seconds</td></tr>
<tr><td>Build 2-grams</td><td align="right">492Mb</td><td align="right">77 seconds</td></tr>
<tr><td>Build 3-grams</td><td align="right">649Mb</td><td align="right">96  seconds</td></tr>
<tr><td>Build 4-grams</td><td align="right">740Mb</td><td align="right">146 seconds</td></tr>
<tr><td>Build 5-grams</td><td align="right">747Mb</td><td align="right">152 seconds</td></tr>
<tr><td>Build 6-grams</td><td align="right">733Mb</td><td align="right">118 seconds</td></tr>
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

Each package has its strengths and weaknesses. For example, `ngram` is fast but its capability is limited solely to the production of ngrams. `RWeka` and `tm` have a broader set of text mining features, but have significantly slower performance and do not scale well to a large corpus such as the one we must use for the Capstone project.

## Why use quanteda?

`quanteda` provides a rich set of text analysis features coupled with excellent performance relative to Java-based R packages for text analysis. Quoting Kenneth Benoit from the [quanteda github README](https://github.com/kbenoit/quanteda):

> **Built for efficiency and speed.** All of the functions in `quanteda` are built for maximum performance and scale while still being as R-based as possible. The package makes use of three efficient architectural elements: the `stringi` package for text processing, the `Matrix` package for sparse matrix objects, and the `data.table` package for indexing large documents efficiently. If you can fit it into memory, `quanteda` will handle it quickly. (And eventually, we will make it possible to process objects even larger than available memory.)

The aspect of quanteda being "R like" is very useful, in contrast to packages like `ngram`. Also, since `quanteda` relies on `data.table`, it's particularly well suited to use for the Capstone. Why? `data.table` has features to index a data table so students can retrieve values by index rather than having to sequentially process an entire data frame to extract a small number of rows. Since the final deliverable for the Capstone project is a text prediction app written in Shiny, students will find `data.table` is an effective and efficient mechanism to use with a text prediction algorithm.   

*last updated: 1 April 2018*
