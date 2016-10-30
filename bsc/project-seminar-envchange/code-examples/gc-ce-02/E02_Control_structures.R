#' ---
#' title: 
#' author: Florian Detsch & Tim Appelhans
#' ---

#+ setup, include = FALSE
knitr::opts_knit$set(
  root.dir = '/media/fdetsch/Permanent/work/teaching/2016/ws/PS_global_change')

#' Before we start working, we first of all set our working directory. Remember 
#' to either double Windows-style backslashes ('\\') or replace them with usual 
#' forward slashes ('/').
#+ wd, eval = FALSE
setwd('/media/fdetsch/Permanent/work/teaching/2016/ws/PS_global_change')

#' ### if-else statements
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

#' <a href="http://imgur.com/SMYpxgb"><img src="http://i.imgur.com/SMYpxgb.png" title="source: imgur.com" /></a>
#' 

#' ### loops
#' 
#' #### `for`-loops
#' 
#' 
#' #### `*apply`-loops
#'


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
courseTitle <- function(year = "2016/17") {
  cat("Project Seminar: Global Environmental Change", year)
} 

## current winter term (default setting)
courseTitle()

## next winter term
courseTitle("2017/18")

#' This list of arguments is, of course, freely expandable. Let's add a new line 
#' listing the associated course providers.
#+ function-ex3
courseTitle <- function(year = "2016/17", lecturers) {
  cat("Project Seminar: Global Environmental Change", year, "\n")
  cat("Lecturers:", paste(lecturers, collapse = ", "))
} 

courseTitle(lecturer = c("Tim Appelhans", "Hanna Meyer", "Florian Detsch"))

#' Of course, `for` (or `*apply`) and `if`-`else` constructs can be part of the 
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