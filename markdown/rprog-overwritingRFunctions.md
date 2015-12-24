## A Common Mistake: Overwriting R Functions with Output Variables

Beginning R students often run into a problem where a particular R function appears to be no longer working in R or RStudio. The cause of this problem is usually due to the fact that the student has saved the result of an R function to an object that has the same name as an R function.

I'll remind you of the following quote:

> Everything that exists is an object. Everything that happens is a function call.
>
> John Chambers, quoted in _Advanced R_, p. 79.

In the context of this particular discussion thread, if one executes the following statements:

    > x <- c(1,2,3,4,5)
    > mean <- mean(x)
    > mean
    [1] 3
    >  

the base package `mean()` function is now hidden by an object called mean in the current environment. There are two ways to access the mean function that has been hidden by the above statement.

1. Eliminate the local environment's mean object with `rm()`, or
2. Use the package name to specify the exact function to be called: `base::mean()`


    base::mean(x)
    [1] 3


After using the `rm()` function, one can see that the `base::mean()` function is accessible again without having to include its package name.

    > rm('mean')
    > mean
    function (x, ...)
    UseMethod("mean")
    <bytecode: 0x000000000c3a7be0>
    <environment: namespace:base>
    >

**Bottom Line: **These types of problems can be very difficult to debug in large R programs, so make sure you never use an R function name as a variable in your code.
