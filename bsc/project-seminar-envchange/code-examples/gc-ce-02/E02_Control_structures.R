#' ---
#' title: 
#' author: Florian Detsch & Tim Appelhans
#' ---

#' ### `if`-`else` statements
#' 
#' The name speaks for itself: `if`-`else` statements allow you to easily 
#' evaluate a conditional statement and do something in response. Here's the 
#' basic syntax:
#' 
#' **Level 1**: <br>If a certain condition applies, do something.
#+ if-else-1, eval = FALSE
if (condition) expression

#' **Level 2**: <br>If a certain condition applies, do something; *else* do 
#' something different.
#+ if-else-2.1, eval = FALSE
if (condition) expression1 else expression2

#' In order to keep a clear structure, we highly encourage you to use curly 
#' brackets whenever possible.
#+ if-else-2.2, eval = FALSE
if (condition) {
  # do something
  expression1
} else {
  # do something different
  expression2
}

#' **Level 3**: <br>If condition 1 applies, do something; *else if* condition 2 
#' applies, do something different; *else* do something entirely different.
#+ if-else-3, eval = FALSE
if (condition1) {
  expression1
} else if (condition2) {
  expression2
} else {
  expression3
}

#' **(and so forth...)**
#' 
#' Now, let's have a look at how this actually works.
#+ if-else-ex1
a <- 10

if (a < 10) {
  cat("Smaller than 10.")
} else {
  cat("Larger than or equal to 10.")
}

#' Did you notice the above usage of `cat`? Unless specified otherwise, this 
#' function lets you print <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
#' objects to the console. Remember to use the help pages (e.g., `?cat`) to find 
#' out more about particular functions.
#' 
#' Let's get back to business. Conditional statements can also be nested.
#+ if-else-ex2
b <- 5

if (a < 10 | b < 10) {
  cat("At least one variable is smaller than 10.\n")
  
  if (a < 10 & b >= 10) {
    cat("'a' is smaller than 10.")
  } else if (a >= 10 & b < 10) {
    cat("'b' is smaller than 10.")
  } else {
    cat("'a' and 'b' are smaller than 10.")
  }
}

#' By now, it should have become clear that we were serious about using curly 
#' brackets. Still, a little further information is required to understand this 
#' example. In <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>,
#' 
#' * `<` and `>=` are *relational* operators. See e.g. `?'<'` (or 
#' `?base::Comparison`) for a full list of features;
#' * `|` and `&` are *logical* operators and interpreted as "or" and "and", 
#' respectively. See e.g. `?'|'` (or `?base::Logic`) for a full list of 
#' available options;
#' * `\n` is an escape sequence to manually insert line breaks, and hence, 
#' bring some structure into the console output; 
#'
#' Finally, you should also be aware of the `ifelse` function that takes the 
#' following, vectorized form: 
#+ ifelse, eval = FALSE
ifelse(condition, yes, no)

#' 
#' and, for a given conditional input, lets you easily create a vector of yes/no 
#' response elements.
#+ ifelse-ex1, eval = FALSE
x <- 1:10

## display all values smaller than or equal to 5 in black, the rest in red
plot(x, col = ifelse(x <= 5, "black", "red"))

#' <hr>
#' ### loops (i): `for` 
#' 
#' <blockquote cite="https://www.r-bloggers.com/how-to-write-the-first-for-loop-in-r/">
#' <p>"Conceptually, a loop is a way to repeat a sequence of instructions under 
#' certain conditions. They allow you to automate parts of your code that are in 
#' need of repetition."</p>
#' <footer><a href="https://www.r-bloggers.com/how-to-write-the-first-for-loop-in-r/">Martijn Theuwissen via R-bloggers</a></footer> 
#' </blockquote>
#' 
#' Although `for` loops have a rather dubious reputation among R users, they 
#' provide a good basis for getting to know more complicated loop structures 
#' using `*apply`, `foreach` (from the easy-to-parallelize **foreach** package) 
#' or even **Rcpp**-based operations. Here is the basic syntax:
#' 
#+ for-1, eval = FALSE
for (variable in sequence) {
  code
}

#' The subsequent code chunk, for example, prints the square of a vector `1:10` 
#' to the console. 
#' 
#+ for-ex1
for (i in 1:10) {
  print(i^2) # same as i * i
}

#' If we wanted to write the results to an object rather than print them to the 
#' console, here's the proper way to go.
#' 
#+ for-ex2
## initialize output vector of length 10 
x <- integer(length = 10L)

for (i in 1:10) {
  x[i] <- i^2  
}

x

#' Of course, such an example makes little sense since squaring is already 
#' vectorized in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>, 
#' rendering unnecessary the usage of `for` loops. But how about that: our goal 
#' is to write this year's course title to the console 5 times, each time 
#' incrementing the specified year by +1 (and hence, ending up in 2020).
#' 
#+ for-ex3
for (i in 2016:2020) {
  cat("Project Seminar: Global Environmental Change", i, "\n") 
}

#' In addition, `for` loops go along well with `if`-`else` statements. 
#' 
#+ for-ex4.1
for (i in 2016:2020) {
  ## check if current year is a leap year
  if (i %% 4 == 0) {
    cat(i, "is a leap year.\n")
  } else {
    cat(i, "is not a leap year.\n")
  }
}


#' <hr>
#' ### functions
#' 
#' You have probably noticed that you are working with functions in 
#' <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 
#' all the time. For example, things like `c`, `cat`, `ifelse`, `plot`, etc. are 
#' all proper functions included in the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 
#' **base** and **graphics** (`plot`) packages.
#'  
#' In fact, it is not that hard developing your own functions from 
#' scratch which proves particularly valuable if you tend to repeat one and the 
#' same work step over and over again. Custom functions can easily be defined 
#' using the built-in function `function`. Here is the basic syntax: 
#+ functions-1, eval = FALSE
functionName = function(arguments) { 
  code
}

#' Suppose we want to print this year's course title to the console, for 
#' example, here is how the referring function would -- or better could -- look 
#' like.
#+ functions-ex1
courseTitle <- function() {
  ## print something to the console  
  cat("Project Seminar: Global Environmental Change 2016/17")
} 

courseTitle()

#' Note that we renounced entirely the use of `arguments` since all relevant 
#' information is included in the function body (i.e., the stuff between the 
#' curly brackets)? So far, so good. How about we wanted to re-use this 
#' function for next year's course, i.e. make it work for multiple years?
#+ functions-ex2
courseTitle <- function(year = 2016) {
  cat("Project Seminar: Global Environmental Change", year)
} 

## current winter term (default setting)
courseTitle()

## next winter term
courseTitle(2017)

#' This list of arguments is, of course, freely expandable. Let's add a new line 
#' listing the associated course providers.
#+ function-ex3
courseTitle <- function(year = 2016, lecturers) {
  cat("Project Seminar: Global Environmental Change", year, "\n")
  cat("Lecturers:", paste(lecturers, collapse = ", "))
} 

courseTitle(lecturer = c("Tim Appelhans", "Hanna Meyer", "Florian Detsch"))

#' Of course, `for` (or `lapply`) and `if`-`else` constructs can be part of the 
#' function body. As a little training exercise, let's see if you can guess the 
#' underlying purpose of the below functions.
#' 
#' #### Function 1
#+ functions-q1, eval = FALSE
function(x) {
  if (x > 0) {
    1
  } else if (x == 0) {
    0
  } else {
    -1
  }
}

#' #### Function 2
#+ functions-q2, eval = FALSE
function(x = 1:10) {
  
  ## create an output integer vector of the same size as 'x'
  out <- numeric(length = length(x))
  
  for (i in 1:length(x)) {
    out[i] <- x[i] * x[i]
  }
  
  return(out)
}

#' #### Function 3
#+ functions-q3, eval = FALSE
function(n = 10L) {
  
  ## create an output integer vector of size 'n'
  out <- integer(n)
  
  for (i in 1:n) {
    if (i == 1) {
      next
    } else if (i == 2) {
      out[i] <- 1
    } else {
      out[i] <- out[i-2] + out[i-1]
    }
  }
  
  return(out)
}

#' Now, it's up to you. Based on your knowledge about functions gained thus far, 
#' try to write your own sum function -- of course, without utilizing the 
#' built-in `sum` command :-) 
#' 

#' <hr>
#' ### loops (ii): `lapply` 
#' 
#' Now that you are familiar with the most basic control structures using 
#' `if`-`else` statements and `for` loops in conjunction with your own 
#' functions, it's time to move on to more powerful `lapply` loops. In 
#' principal, their syntax resembles that of common `for` loops, apart from 
#' `variable` and `sequence` being exchanged: 
#+ lapply-1.1, eval = FALSE
lapply(sequence, FUN)

#' (or, if we explicitly deploy the function syntax from above:)
#+ lapply-1.2, eval = FALSE
lapply(sequence, function(variable) {
  code
})

#' Since `lapply` takes any kind of function as input and applies it to 
#' each element in `sequence`, we may as a first example simply specify the 
#' initial version of our custom function `courseTitle` from above.
#' 
#+ lapply-ex1
## re-define function (to get rid of the 'lecturer' argument)
courseTitle <- function(year = 2016) {
  cat("Project Seminar: Global Environmental Change", year, "\n")
} 

jnk <- lapply(2016:2020, courseTitle)

#' Just as previously using `for`, the course title for each particular year is 
#' written to the console. How about the squaring example? This time, however, 
#' we need to write a new custom function inside the `lapply` construct which 
#' will then be applied to each element in `sequence` (*i.e.*, `1:10`).
#' 
#+ lapply-ex2
lapply(1:10, function(i) {
  i^2
})

#' And here's the big deal about `lapply`: it returns `list` objects which, as 
#' you should have learned during the previous session, (are Tim's favorite 
#' <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 
#' objects and) let you store all kinds of other objects in a clearly structured 
#' fashion.
#' 

#' <hr>
#' #### What you should possibly remember:
#' 
#' * use vectorization whenever possible
#' * if vectorization is not available, try to use `lapply` instead of `for`
#' 
#' How's that? Well...
#' 
#+ benchmark, eval = FALSE
library(microbenchmark)

## vectorized
microbenchmark(
  (1:10e3)^2
)
# Unit: microseconds
# min    lq      mean     median  uq     max      neval
# 33.014 33.7825 34.68629 34.0955 34.688 47.274   100

## not vectorized
microbenchmark(
  lapply(1:10e3, function(i) i^2)
)
# Unit: milliseconds
# min      lq       mean     median  uq       max        neval
# 6.244913 6.574865 7.613451 7.00327 7.836295 19.96115   100

#' ### Further reading
#' * <a href="https://www.r-bloggers.com/15-page-tutorial-for-r/">For Beginners in R (StudyTrails)</a>
#' * <a href="http://www.noamross.net/blog/2014/4/16/vectorization-in-r--why.html">Vectorization in R: Why? (Noam Ross)</a>
#' * <a href="https://www.r-bloggers.com/r-tutorial-on-the-apply-family-of-functions/">Apply family of functions (DataCamp)</a>