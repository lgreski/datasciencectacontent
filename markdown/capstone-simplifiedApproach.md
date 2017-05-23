# Capstone Strategy: Simplify, Simplify, Simplify...

 It is very easy to overcomplicate the Johns Hopkins Data Science Specialization Capstone project. Why? Students must run their prediction applications in less than 1Gb of RAM, so this limits the sophistication of the final work product.

Therefore, it is helpful to spend one's time on as simple a model as possible. Interestingly, this is the same advice I give to *R Programming* students in [Strategy for the Programming Assignments](http://bit.ly/2ddFh9A): *make it work, make it right, make it fast.*

A simple solution to the Capstone can be accomplished with three key tools:

1. **data.table** -- due to its high performance, low memory usage, and ability to do an indexed search like a database table, this package is extremely useful not only to create the data needed for the prediction algorithm, but it is also very valuable in the shiny app.<br><br>
2. **quanteda::tokens_ngrams()** -- the workhorse that will generate the data needed for the easiest possible algorithm, a simple back off model based on last word frequencies / probabilities given a set of first words<br><br>
3. **SQL with the sqldf package** -- given a set of n-grams that are aggregated into three columns, a base consisting of n-1 words in the n-gram, and a prediction that is the last word, and a count variable for the frequency of occurrence of this n-gram, it's easy to write an SQL statement to extract the most frequently occurring prediction and save these into an output data.table for your shiny app<br><br>

An approach like this can result in a final data.table that is about 400Mb, using the entire corpus to build 2-grams through 5-grams into bases and predicted words.

The irony in the grading scheme is that students are better off building an application that runs fast but is inaccurate (one can get 2 of 3 points for accuracy as long as the application always returns a result), than one that is accurate but slow (you can get 0 of 2 points for usability if the app is too slow).
