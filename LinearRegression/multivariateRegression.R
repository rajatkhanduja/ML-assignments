mpgdata <- read.table ("auto-mpg.data.modified")
sub <- sample (nrow (mpgdata), nrow(mpgdata) * 0.8)
mpgtrain <- mpgdata[sub,]
mpgtest  <- mpgdata[-sub,]

trainAttr <- as.matrix(mpgtrain[, 2:8])
trainAttr <- cbind(1, trainAttr)
trainOut  <- as.matrix(mpgtrain[,1])
testAttr  <- as.matrix(mpgtest[, 2:8])
betaEstimate <- solve (t(trainAttr) %*% trainAttr) %*% t(trainAttr) %*% trainOut
