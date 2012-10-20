mpgdata <- read.table ("auto-mpg.data.modified")
sub <- sample (nrow (mpgdata), nrow(mpgdata) * 0.8)
mpgtrain <- mpgdata[sub,]
mpgtest  <- mpgdata[-sub,]

trainAttr <- as.matrix(mpgtrain[, 2:8])
trainAttr <- cbind(1, trainAttr)
trainOut  <- as.matrix(mpgtrain[,1])
testAttr  <- as.matrix(mpgtest[, 2:8])
testAttr  <- cbind(1, testAttr)
testOut   <- as.matrix(mpgtest[,1]);

# compute beta-estimate
betaEstimate <- solve (t(trainAttr) %*% trainAttr) %*% t(trainAttr) %*% trainOut

estimatedOutput <- testAttr %*% betaEstimate
