# Common Problems: sqldf() fails to connect to database

A number of students in *Getting and Cleaning Data* have reported problems with `sqldf()` when attempting to answer the week 2 quiz. After some back and forth on the Discussion Forum, one student employed her hacker skills and discovered that she could resolve the problem by explicitly setting an option for `sqldf.driver`.

      options(sqldf.driver="SQLite")

She also noted that she had installed MySQL on her computer, in addition to the R libraries required for `sqldf()`.  This means that the error was most likely caused by `sqldf()` attempting to use the `RMySQL` driver, which requires a MySQL database to exist in order to function correctly.

# Conclusion

If you're having problems getting `sqldf()` to work, set the option for `sqldf.driver` to use `SQLite` instead of another driver such as `RMySQL` that will attempt to connect to a database management system outside of the R environment.

*Hat tip to an unnamed student from Getting & Cleaning Data who discovered this solution.*
