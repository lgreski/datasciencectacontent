# Capstone n-grams: how much processing power is required?

Students in the Johns Hopkins University Data Science Specialization Capstone course typically struggle with the course project because of the amount of memory consumed by the objects needed to analyze text. To help reduce the guesswork in the memory utilization, here is a table that illustrates the amount of RAM consumed by objects required to analyze the files for the Swift Key sponsored capstone: predicting text.

To assess our ability to process the complete corpus of data, we Used an HP Omen laptop with the following specifications.

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
           <li>Processor: Intel i7-4710HQ at 2.5Ghz, turbo up to 3.5Ghz, four cores with two threads each</li>
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
<tr><td>Tokenize corpus using <code>quanteda::tokenize()</code></td><td align="right">1.3Gb</td><td align="right">509 seconds</td></tr>
<tr><td>Build 2-grams</td><td align="right">6.3Gb</td><td align="right">619 seconds</td></tr>
<tr><td>Build 3-grams</td><td align="right">6.5Gb</td><td align="right">894 seconds</td></tr>
<tr><td>Build 4-grams</td><td align="right">6.5Gb</td><td align="right">925 seconds</td></tr>
<tr><td>Build 5-grams</td><td align="right">6.3Gb</td><td align="right">930 seconds</td></tr>
<tr><td>Build 6-grams</td><td align="right">6.1Gb</td><td align="right">1,007 seconds</td></tr>
</table>

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
                <li>Operating system: OS X Sierra 10.12.6 (16G29)</li>
                <li>Processor: Intel i5 at 2.6Ghz, turbo up to 3.3Ghz, two cores with two threads each</li>
                <li>Memory: 8 gigabytes</li>
                <li>Disk: 512 gigabytes, solid state drive</li>
                <li>Date built: April 2013</li>
            </ul>
        </td>
     </tr>
</table>

As stated above, we need to sample at a level where the combined size of the tokenized corpus and the result n-gram object are less then the amount of RAM available on the machine. We selected a 25% sample, resulting in a tokenized words object of 1.4Gb in size. Since we expect the resulting n-gram objects to be 1.5 - 3 times the size of the tokenized words object, a 25% sample will process within the 8Gb of RAM on the Macbook Pro we used to generate n-grams. Summarizing in the same manner as we did with the analysis on the HP Omen, here are the object sizes and timings for the 25% sample.  

<table>
<tr><th>Activity</th><th>Memory Used</th><th>Processing Time</th></tr>
<tr><td>Load data from the three raw data files into a corpus</td><td align="right">265 Mb</td><td align="right">6 seconds</td></tr>
<tr><td>Tokenize corpus using <code>quanteda::tokenize()</code></td><td align="right">1.4Gb</td><td align="right">59 seconds</td></tr>
<tr><td>Build 2-grams</td><td align="right">2.0Gb</td><td align="right">79 seconds</td></tr>
<tr><td>Build 3-grams</td><td align="right">2.9Gb</td><td align="right">162 seconds</td></tr>
<tr><td>Build 4-grams</td><td align="right">3.6Gb</td><td align="right">420 seconds</td></tr>
<tr><td>Build 5-grams</td><td align="right">3.9Gb</td><td align="right">339 seconds</td></tr>
<tr><td>Build 6-grams</td><td align="right">4.0Gb</td><td align="right">343 seconds</td></tr>
</table>

# Example: Sampling Approach on HP Chromebook 11 G5

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

The Chromebook has significantly less capacity than either of the two machines previously tested. However, we were able to run the n-gram build script for 2-grams through 6-grams on a 5% sample on the Chromebook. A 10% sample terminated with an out of memory error while generating 4-grams. A 15% sample terminated with an out of memory error while generating 3-grams. Performance timings for the 5% sample are listed in the following table. \\

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

Each package has its strengths and weaknesses. For example, `ngram` is fast but it's capability is limited solely to the production of ngrams. `RWeka` and `tm` have a broader set of text mining features, but have significantly slower performance and do not scale well to a large corpus such as the one we must use for the Capstone project.

## Why use quanteda?

`quanteda` provides a rich set of text analysis features coupled with excellent performance relative to Java-based R packages for text analysis. Quoting Kenneth Benoit from the [quanteda github README](https://github.com/kbenoit/quanteda):

> **Built for efficiency and speed.** All of the functions in `quanteda` are built for maximum performance and scale while still being as R-based as possible. The package makes use of three efficient architectural elements: the `stringi` package for text processing, the `Matrix` package for sparse matrix objects, and the `data.table` package for indexing large documents efficiently. If you can fit it into memory, `quanteda` will handle it quickly. (And eventually, we will make it possible to process objects even larger than available memory.)

The aspect of quanteda being "R like" is very useful, in contrast to packages like `ngram`. Also, since `quanteda` relies on `data.table`, it's particularly well suited to use for the Capstone. Why? `data.table` has features to index a data table so students can retrieve values by index rather than having to sequentially process an entire data frame to extract a small number of rows. Since the final deliverable for the Capstone project is a text prediction app written in Shiny, students will find `data.table` is an effective and efficient mechanism to use with a text prediction algorithm.   

*last updated: 12 August 2017*
