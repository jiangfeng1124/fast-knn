
library(FNN)

path <- "example.dat"
k <- 10

data <- read.table(path, header=FALSE, stringsAsFactors=FALSE)

data.n <- dim(data)[1]
data.d <- dim(data)[2] - 1

data.label <- data[, 1]
data.mat   <- data[, -1]

# perform fast-knn
query <- data.mat
result = get.knnx(data.mat, query, k=k+1, algo="kd_tree")

knn.index <- result$nn.index

for (i in 1:data.n) 
{
    cat(data.label[i], ": ")
    cat(data.label[knn.index[i,-1]])
    cat("\n")
}

