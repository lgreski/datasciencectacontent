In the February 2017 run of *R Programming* a student asked a question about how lexical scoping in R compares to variable scoping in C/C++.

## Scoping in C/C++

C/C++ make a distinction between [local and global variables](http://bit.ly/2kEqjNJ). As noted in the student's original post, variables declared in C functions are local to the function. In addition, one can declare global variables in C, which are accessible in `main()` as well as any other function.

Also note that C/C++ include the concept of pointers, which are references to memory locations accessible within a C/C++ program. Pointers complicate the topic of variable scope within C/C++ considerably. It is common to pass a pointer into a function and have the function manipulate the object referenced by the pointer. This type of behavior is similar to what happens with the `<<-` assignment operator, where R assigns a value to an object in the parent environment to the current environment.

## Scoping in R

In R, every object is tied to an environment as I describe in [R Objects, S Objects, and Lexical Scoping](http://bit.ly/2dtOSXi). The concept of environments automatically introduces more levels of scoping than C/C++, because environments are hierarchical, and each function creates its own environment.

R programs can access objects in other environments by using the appropriate function calls. R also provides capabilities to `get()` and `assign()` content to objects in specific environments. These features are described in Hadley Wickham's [Advanced R section on Environments](http://bit.ly/2lcJagr), but I'll leave the detailed coverage of these details to Hadley.

When an R function is loaded into memory, it creates an environment into which any objects created within the function are stored. If the function returns a reference to itself (as [makeVector()](http://bit.ly/2bTXXfq) does), then the environment for that function remains in memory until R ends or the function is removed from memory with `rm()`.
