## S Objects, R Objects, and Lexical Scoping

In S, objects are stored in frames (which are in virtual memory) and databases (which may be on disk, or in virtual memory). R, in contrast, stores objects in environments, which are always in virtual memory. Since each function in R must include a pointer to its parent environment, it must also be in virtual memory at the time it is defined.

Reference: _S Programming_,  p. 54 - 55.

Practically speaking, this means that one has to load objects that are stored on disk into memory, including functions, before using them. This is why one cannot access functions from previously installed packages (which are collections of related functions) without loading them into memory via the `library()` function before calling them.

If you print the code for the `library()` function, you'll observe that it uses `readRDS()` to read the package content from disk into memory. As the serialized objects within a package are deserialized and loaded into memory, they are assigned to the hierarchy of environments, starting with the base or global environment.

The requirement that all R functions have pointers to their parent environments has desirable properties for statistical computing, such as the optimization example in an expanded version of the lexical scoping lecture documented in a 2003 [JHU Biostatistics class](http://www.biostat.jhsph.edu/~rpeng/docs/R-classes-scope.pdf).

I have found it helpful to understand environments in R through pictures. Here is an illustration of the environments for the functions defined in Professor Peng's lexical scoping lecture, slide 12\.

<img src="./images/rprog-lexicalScopingIllustration.png">
