##Week 2
###Control structures
* if/else if/else # test condition, else is optional
* for #fixed number loop
* while #loop while condition is true
* repeat # infinite loop
* break # end loop
* next # next iteration of loop
* return # end function


##If else 
this is valid:
	y <- if (x > 3) {
		10
	} 
	else {
		0
	}

##For loop (no requirement for integers)
	for (i in 1:10) {print(i)}

	x <- c("a","b","c","d")
	for (i in 1:4) {
		print(x[i])
	}
	
	for(i in seq_along(x)) { #seq_along function takes vector as input and creates integer sequence
		print(x[i])
	}   

##While loop
	
	while (count < 10 && count > 1 ) { #conditions are tested left to right
		print(count)
		count <- count + 1
	}

##Repeat

	repeat {
		x1 <- someFunction()
		if (x1 > someValue) {
			break #only way to exit
		}
	}

##Next 
	for (i in 1:30) {
		if (i <= 20) {next) # skip the first 20 interations
		# Do something
	}

## Functions
* Functions can be passed as arguments to other functions.
* functions can be nested.
* args can be matched positionally, or by name (and partial name).
* args can be discovered with formals(functionName) or args(functionName)
* args are evaluated as they are needed,  calling func(a,b) as func(a) will not produce an error until b is evaluated in the function body

	add2 <- function(x, y) {
		x + y # function returns last expression
	}
	
	above10 <- function(x) {
		use <- x > 10
		x[use]
	}
	
	above <- function(x, y = 10) { # default is 10
		z <- x > y
		x[z]
	}
	
	col_mean <- function(data, removeNA = TRUE)  {
		numCols <- ncol(data)
		m <- numeric(numCols)
		
		for (i in 1:numCols) {
			m[i] <- mean(data[,i], na.rm = removeNA)
		}
		m
	}
### The '...' Argument
The three-dots allows:
* an arbitrary number and variety of arguments
* passing arguments on to other functions

	linePlot <- function(x,y, type ="l", ...) {
		plot(x,y,type=type, ...)
	}
	
* they can be captured with:
	
	function(inputs, ...) {
		dots <- list(...)
		ndots <- length(dots)
		#stuff
	}

* any argments after the '...' object MUST be named


##Function closure
* Can be explored with ls()

##Dates and Times
* Dates are represented by the Date class (Days since Unix epoch)
* Times are represented by the POSIXct (integer based) or POSIXlt class (list based) (Seconds since Unix epoch)			

x <- as.Date("1970-01-01")		
weekdays(as.POSIXlt(Sys.time()))
	 