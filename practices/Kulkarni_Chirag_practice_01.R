#1.4
1+1
max(1,3,5)
max(1,3, 
+5)
#2.12
Nothing to show
#3.9
data(dsname, package = "pkgname")
data("pressure")
help("pressure")
data()
data(Cars93, package = "MASS")
summary(Cars93)
head(Cars93)
data(package="MASS")
#5.14
matrix(0,2,3)
matrix(NA,2,3)
mat <- matrix(c(1.1, 1.2, 1.3, 2.1, 2.2, 2.3), 2, 3)
mat
theData <- c(
  1.1, 1.2, 1.3,
  2.1, 2.2, 2.3
)
mat <- matrix(theData, 2, 3, byrow = TRUE)
mat
mat <- matrix(c(1.1, 1.2, 1.3,
                2.1, 2.2, 2.3),
              2, 3,
              byrow = TRUE)
v <- c(1.1, 1.2, 1.3, 2.1, 2.2, 2.3)
dim(v) <- c(2, 3)
v