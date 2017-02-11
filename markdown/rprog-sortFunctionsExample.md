Some students have trouble with the third programming assignment in *R Programming* because they struggle with sorting the data in the correct order. Here is an example of how to use two different R functions to sort the Motor Trend Cars data set from the `datasets` package.

    > library(datasets)
    > head(mtcars)
                       mpg cyl disp  hp drat    wt  qsec vs am gear carb
    Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
    > library(plyr)
    > #
    > # use plyr::arrange() to sort the data frame by cyl and mpg
    > #
    >
    > arrangedData <- arrange(mtcars,cyl,mpg)
    > head(arrangedData)
       mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    1 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
    2 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    3 22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    4 22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    5 24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    6 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    >

As you can see from the output, the data is sorted by `cyl` and then `mpg`. One of the productivity aids from `plyr` is the ability to reference columns in the data frame directly, without the need for the extract operator `$`, as in `mtcars$mpg`. Also note that because the car names were included as row names instead of a regular column, they were not copied to the `arrangedData` data frame.

Note that the `dplyr` package also provides an `arrange()` function. 

Here is sample code that does the same thing using the  `base::order()` function.

    > #
    > # use order() to do the same thing, sort mtcars by cyl and mpg  
    > #
    > orderedData <- mtcars[order(mtcars$cyl,mtcars$mpg),]
    > head(orderedData)
                   mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    Volvo 142E    21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
    Toyota Corona 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    Datsun 710    22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    Merc 230      22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    Merc 240D     24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    Porsche 914-2 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    >

Notice that the order function must be used within the row dimension of the `dataFrame[rows,columns]` syntax, instead of a simple function call that operates on a data frame like the `arrange()` function. 

To include the car names in the output from `plyr::arrange()` and make the results constant between the two functions, we would need to set the row names to a vector, column bind the vector back to the data frame, and set the rownames to NULL.

    > library(datasets)
    > library(plyr)
    > #
    > # move rownames to a column, because plyr::arrange() does not work with rownames
    > #
    > carName <- rownames(mtcars)
    > mtcars <- cbind(carName,mtcars)
    > rownames(mtcars) <- NULL
    > head(mtcars)
                carName  mpg cyl disp  hp drat    wt  qsec vs am gear carb
    1         Mazda RX4 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    2     Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    3        Datsun 710 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    4    Hornet 4 Drive 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    5 Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    6           Valiant 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
