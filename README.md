
Lua Programming Examples
========================

### Purpose of this project?

As the title suggests these are the programming examples written in 
Lua for (my) learning purpose. 

Coming from a C++ and Python background I tend to think (immaturally) that 
there exists solution in Lua for every problem I can solve nicely in the 
former languages. 

This is obviously not true, but toying with this idea  
helps me to see the boundary of Lua as well as its fields of application. 
Despite of the differences, here are still many patterns 
that apply equally well in Lua, such as encapsulation, state & strategy.
You can find some of these patterns here.

Some examples in this project are inspired by the book 
[Programming in Lua, 4th edition](
https://www.amazon.com/Programming-Lua-Fourth-Roberto-Ierusalimschy/dp/8590379868
)

Although the examples here are self-explanatory and do not require 
additional learning materials, I would still highly 
recommend this book to developers new to Lua programming 
language. I have this habit of leaving page numbers or directly citing 
the contents of this book in the docstrings.

### Similar/Related Projects?

Definitely checkout the official [Lua project](https://github.com/lua/lua)

[Exercism exercises in Lua](https://github.com/exercism/lua)

still updating......

### Category

[helloWorld](src/helloWorld)

"Hello World"

[strings](src/strings)

How to manipulate strings. How use Lua's bulit-in regex-like pattern 
system.

[variables](src/variables)

How to manipulate variables.

[logic](src/logic)

Basic programming constructs: for-loop, if-statement etc.

[scope](src/scope)

Focus on Lua's scoping. 

Good scoping enables encapsulation and insultion.

[functions](src/functions)

How to create and call functions.

Also show how to take advantage of Lua's closure to create stateful 
functions.

[algorithms](src/algorithms)

Show how to implement algorithms in Lua using its built-in table and 
iterator.

[applications](src/applications)

Show how to write an application to solve a problem (most-common-words
 problem).

[containers](src/containers)

Show how to implement common data structures (array, double-linked queue, 
graph, linked list, set & multiset, reverse table ...)

[coroutines](src/coroutines)

Show how to introduce concurrency via Lua's built-in coroutines.

Note that there are other concurrency options, such as wrapping Lua 
State in low level software threads.

[dateTime](src/dateTime)

Show some formatting tricks.

[environments](src/environments)

Show how to get environment variables.

[execution](src/execution)

Show how execute other Lua source files.

[garbargeCollection](src/garbageCollection)

How to implement "object destructor" - a function that is called when 
a table (an object) is about to be garbage collected.

How to implement weak table that holds weak references.

[genericProgramming](src/genericProgramming)

How to use meta table to implement sharable functionality.

[IO](src/IO)

read/write files;

interface with stdin/out;

call shell commands;

[iterators](src/iterators)

losely based on Lua Book P158, iterator

[multithreading](src/multithreading)

coming soon...

[OOP](src/OOP)

How to write classes using Lua table.

[projectManagement](src/projectManagement)

How to split the source code into modular units (packaging).

How to import modules and packages.

[reflection](src/reflection)

How to hook function call and function return for inspection.

How to write a basic profiler.

How to inspect function stack.

[runtimes](src/runtimes)

How to compile a Lua source file to byte code.

How to handle exceptions (pcall).

### And there is more......

This project does not contain (nor is it intended to show) examples 
of Lua-C interface. I'm simply trying to keep its "purity".

I have added some examples that show Lua-C/C++ integration in 
[my own clone of the Lua project](https://github.com/powergun/lua/tree/wein)


