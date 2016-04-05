# L01 - Introduction to R
Tim Appelhans & Hanna Meyer  

![](http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png) (CC-BY-NC-SA)

This document was laste edited on _Di Apr 05 2016_

------



## R as a calculator
R can be used as a simple calculator. Standard syntax is valid.


```r
1 + 1
```

```
## [1] 2
```

```r
5^2
```

```
## [1] 25
```

```r
sqrt(25)
```

```
## [1] 5
```

## Object definition
To define objects in R we use `<-` to assign a value (or anything really) to a named object.


```r
one <- 2
one + one
```

```
## [1] 4
```

```r
one + 1
```

```
## [1] 3
```

```r
mytext <- c("I", "am", "hungry")
mytext
```

```
## [1] "I"      "am"     "hungry"
```

## Getting help
To access R's built-in help pages use `help(<functionName>)` or simply `?`


```r
?c
```

## Working directory
To set the working directory (i.e. the folder on the disk where R is pointing to) use `setwd()`


```r
getwd()
```

```
## [1] "/home/ede/tappelhans/uni/marburg/lehre/git/pages/marburg-open-courseware.github.io/bsc/envchange"
```

```r
setwd("/home/ede/tappelhans/uni/marburg/lehre/2016/ss/PS_global_change")
```


## Object types
**First rule of R:** *Everything is possible*  
**Second rule of R:** *Everything is a vector*

### vectors


```r
class(1)
```

```
## [1] "numeric"
```

```r
class(c(1, one))
```

```
## [1] "numeric"
```

```r
class(c(1, one, mytext))
```

```
## [1] "character"
```

```r
c(1, one, mytext)
```

```
## [1] "1"      "2"      "I"      "am"     "hungry"
```

### matrices


```r
class(1)
```

```
## [1] "numeric"
```

```r
class(one)
```

```
## [1] "numeric"
```


