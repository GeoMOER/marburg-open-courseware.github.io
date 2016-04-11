#' ---
#' title:
#' author: Tim Appelhans & Hanna Meyer
#' ---
#' ![](../../logo.png)
#'
#' Last edited: `r Sys.time()`
#'
#' ### R as a calculator
#' R can be used as a simple calculator. Standard syntax is valid.

1 + 1
5^2
sqrt(25)

#' ### Object definition
#' To define objects in R we use `<-` to assign a value (or anything really) to a named object.

one <- 2
one + one
one + 1

mytext <- c("I", "am", "hungry")
mytext

#' ### Getting help
#' To access R's built-in help pages use `help(<functionName>)` or simply `?`

?c

#' ### Working directory
#' To set the working directory (i.e. the folder on the disk where R is pointing to) use `setwd()`

getwd()
setwd("/home/ede/tappelhans/uni/marburg/lehre/2016/ss/PS_global_change")

#' ### Object types
#' **First rule of R:** *Everything is possible*
#'
#' **Second rule of R:** *Everything is a vector*
#'
#' #### vectors

vec <- 1:10
vec
mytext <- c("I", "am", "hungry")
mytext
newvec <- c(vec, mytext, NA)
newvec

#' #### matrices

mat <- matrix(1:9, ncol = 3)
mat

#' #### data frames

df <- data.frame(var1 = 1:5,
                 var2 = c("a", "b", "c", "d", "e"),
                 var3 = rep(NA, 5))
df

#' #### lists

lst <- list(vector = vec,
            text = mytext,
            NA,
            mat,
            df = df)
lst

#' ### Object structure
#' we can check the internal structure of any object using `str()`

str(vec)
str(mat)
str(df)
str(lst)

#' ### Accessing object content
#' there are different ways of accessing the content of objects
#'
#' #### using `$`
#' For objects that have named variables we can use `$`
#'
df$var1
lst$df
lst$df$var1
#'
#' #### `[` and `[[`
#' we can also use `[` with index numbers
#'

mat[1, 3]
df[1, 3]

#' for lists we need `[[` two square brackets

lst[[1]]
lst[[5]][[2]]
lst[[5]][[2]][[3]]

#' Or as Hadley Wickham explains more visually:
#'
#' ![](indexing.png)
#' Source: @hadleywickham on Twitter http://twitter.com/hadleywickham/status/643381054758363136
#'
#' combinations also work

lst[[5]]$var2

#' ### names of data frames
#' we can retrieve the names
names(df)

#' we can also set names
names(df) <- c("numbers", "letters", "NoData")
df

#' ### Saving data
#' we can easily write data to the disk

write.csv(df, "my_dataframe.csv", row.names = FALSE)

#' ### Loading data
#' and just as easy we can read data from the disk

dat <- read.csv("my_dataframe.csv")
dat

#' as a final note, we can also remove files from the disk

file.remove("my_dataframe.csv")

#' [download this tutorial as pdf](http://marburg-open-courseware.github.io/bsc/envchange/E01_Introduction_to_R.pdf)
