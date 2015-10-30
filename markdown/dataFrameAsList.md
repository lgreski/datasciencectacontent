# Data Frame as List
An important aspect of a data frame is that it is also a `list()`, where each column in the data frame is an item in the list. This is why when you look at a data frame in the Environment pane in RStudio, you see the following, where the list items are displayed in rows (when one might expect the columns to be rendered in columns):
     
     ![](https://coursera-forum-screenshots.s3.amazonaws.com/c4/464b606a2a11e5814cff13fd19f029/2015-10-03_16-59-00.png)

Each item in the list can then be accessed with the `extract` or `$` operator, which extracts items from lists. In a data frame, the content in each element of the list consists of one vector. 