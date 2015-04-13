#Geting and cleaning data project

This repository contains an implementation of the Coursera [Getting and Cleaning Data](https://www.coursera.org/course/getdata) course project. 

##Repo contents

* README.md: this file
* CodeBook.md: information about raw and tidy data sets used in the project and the transformation process.
* run_analysis.R: An R script to perform the transformation.

##Setup

Before the script contained in this repo can be run a copy of the following [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) must be downloaded and extracted to a folder called `UCI HAR Dataset` in the same directory as the script.

The script itself depends on the '[dplyr](http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html)' and '[tidyr](ftp://cran.r-project.org/pub/R/web/packages/tidyr/vignettes/tidy-data.html)' packages.  
These can be installed with the following commands.

```
install.packages("dplyr")
install.packages("tidyr")
```

##Running the script

All code is contained within the `run_analysis.R` file. The main function is run_analysis, the function
accepts two optional parameters, these are:
```
(Option : Default value)
write.file : FALSE  
file.name : 'TidyData.csv' 
```

To run the script and output the value to a variable, execute the following commands:

```
source('./run_analysis.R')
data <- run_analysis()
```

To run the script and output the value to a file called `Output.csv`, execute the following commands:

```
source('./run_analysis.R')
run_analysis(write.file=TRUE, file.name='Output.csv')
```

This will output a comma separated values file in the same directory as the R script.