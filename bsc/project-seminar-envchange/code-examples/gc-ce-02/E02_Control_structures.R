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

#' ![](http://i.imgur.com/SMYpxgb.png)
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
