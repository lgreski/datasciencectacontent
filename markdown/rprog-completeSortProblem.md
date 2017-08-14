# Common Problems: complete("specdata",332:1) Fails

There is a subtle requirement in this part of the first assignment in *R Programming*: data in the output data frame must match the sequence of sensor IDs passed in the `id` argument to `complete()`.

Quiz question 7 tests students function against this requirement.

There are at least three different techniques students typically use to solve the assignment, including:

1. `for()` loop that processes each sensor file in sequence based on the `id` argument, and assemble the results into a single data frame
2. `apply()` function that uses the `id` argument as input to drive the processing within an anonymous function in a manner similar to approach 1
3. Functions that summarize the data, such as `stats::aggregate()`, or `hmisc::summarize()`, or `base::table()`

The first two approaches produce the correct results because unless one sorts the output before returning it to the parent environment, it will match the order of the `id` argument.

The third approach fails because aggregation functions typically use what is called "by groups" to process the data, and the output is sorted in ascending order of by groups.

To produce the correct answer for quiz question 7, one must use a technique that does not automatically sort the data in ascending order of `id`.