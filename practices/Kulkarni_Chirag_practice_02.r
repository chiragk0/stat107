library()
installed.packages()[1:5, c("Package", "Version")]

vec <- 1:6
matrix(vec, 2, 3)

matrix(0, 2, 3)

matrix(NA, 2, 3)

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

rownames(mat) <- c("rowname1", "rowname2","rownameN")
colnames(mat) <- c("colname1", "colname2", "colnameN")

print(corr_mat)

mat[1, ]     # First row
mat[, 3]     # Third column

mat[1, , drop=FALSE]   # First row, one-row matrix
mat[, 3, drop=FALSE]   # Third column, one-column matrix

mat[1, ]
mat[, 3]
mat[, 3, drop=FALSE]

df <- data.frame(v1, v2, v3,f1)
df <- as.data.frame(list.of.vectors)

data.frame(pred1, pred2, pred3, resp)
data.frame(p1 = pred1, p2 = pred2, p3 = pred3, r = resp)
tibble(p1 = pred1, p2 = pred2, p3 = pred3, r = resp)
list.of.vectors <- list(p1=pred1, p2=pred2, p3=pred3, r=resp)
as.data.frame(list.of.vectors)
as_tibble(list.of.vectors)

rbind(row1, row2, rowN)
r1 <- data.frame(a = 1, b = 2, c = "X")
r2 <- data.frame(a = 3, b = 4, c = "Y")
r3 <- data.frame(a = 5, b = 6, c = "Z")
rbind(r1, r2, r3)

list.of.rows <- list(r1, r2, r3)
bind_rows(list.of.rows)

l1 <- list(a = 1, b = 2, c = "X")
l2 <- list(a = 3, b = 4, c = "Y")
l3 <- list(a = 5, b = 6, c = "Z")
list.of.lists <- list(l1, l2, l3)

bind_rows(list.of.lists)

data.frame(a = 1, b = 2, c = "a", stringsAsFactors = FALSE)

l1 <- list( a=1, b=2, c='X' )
l2 <- list( a=3, b=4, c='Y' )
l3 <- list( a=5, b=6, c='Z' )
obs <- list(l1, l2, l3)
df <- do.call(rbind, Map(as.data.frame, obs)) 

i <- sapply(df, is.factor)             ## determine which columns are factors
df[i] <- lapply(df[i], as.character)   ## turn only the factors to characters
df 

suburbs <- read_csv("./data/suburbs.txt")

newRow <- data.frame(city = "West Dundee", county = "Kane",
                     state = "IL", pop = 7352)
rbind(suburbs, newRow)

rbind(suburbs,
      data.frame(city = "West Dundee", county = "Kane",
                 state = "IL", pop = 7352))

rbind(suburbs,
      data.frame(city = "West Dundee", county = "Kane",
                 state = "IL", pop = 7352),
      data.frame(city = "East Dundee", county = "Kane",
                 state = "IL", pop = 3192)
)

str(suburbs)
str(newRow)
rbind(some_tibble, some_data.frame)
rbind(some_data.frame, some_tibble)

suburbs_df <- as.data.frame(suburbs)
suburbs_df[, 1]
suburbs_df[, c(1, 4)]

df[, vec]
df[, vec, drop = FALSE]