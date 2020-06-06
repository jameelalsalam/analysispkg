
# analysispkg

<!-- badges: start -->
<!-- badges: end -->

The goal of analysispkg is to work out a structure for complex analyses-as-package.

## Installation

You can install the development version of analysispkg from [Github](https://www.github.com/jameelalsalam/analysispkg) with:

``` r
remotes::install_github("jameelalsalam/analysispkg")
```

## Features

The analysispkg has the following features and goals:

  * Final results are exported as datasets so they can be used in other projects by installing and loading the package. This is accomplished by including them as binary data in /data.

  * Major analysis steps are implemented as functions. Function documentation serves as a methodological reference for these major steps.
  
  * Input data are stored in /data-raw or acquired externally

  * The entire analysis is run with make.R and can be easily re-run during development (or by cloning the repository) using {drake} for caching and inter-dependency management.

  * Results are displayed through vignettes/articles (???)
  
  * Analysis is re-run in C.I. on Github Actions. .drake folder is .gitignored


## Outstanding Questions:

  * How to ensure there aren't conflicts between package data (which is the result of the analysis) and steps in the analysis. Idea 1: data exports are outputs of the drake plan, but with different names. Idea 2: a version of load_all which only loads code.
  
  * Where should input data to the analysis be kept? Should it be in the repo at all? Should it be in the installed package?
  
  * Should the analysis be built in C.I. or locally only? Should report results be built in C.I.?

