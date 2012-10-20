mpgdata <- read.table ("auto-mpg.data.modified")
sub <- sample (nrow (mpgdata), nrow(mpgdata) * 0.8)
mpgtrain <- mpgdata[sub,]
mpgtest  <- mpgdata[-sub,]

trainAttr <- as.matrix(mpgtrain[, 2:8])
trainAttr <- cbind(1, trainAttr)    # Binds a column of 1 before all columns
trainOut  <- as.matrix(mpgtrain[,1])
testAttr  <- as.matrix(mpgtest[, 2:8])
testAttr  <- cbind(1, testAttr)
testOut   <- as.matrix(mpgtest[,1]);

svdOutput = svd (trainAttr) #Finds svd of trainAttr
d = svdOutput$d
D = diag(d)
U = svdOutput$u
V = svdOutput$v
k = sum (abs (d * d) > 0.1)

# Calculate T_k
T_k = U[, 1:k] %*% D[1:k,1:k]

# Calculate c-estimate
cEstimate = solve(t(T_k) %*% T_k) %*% t(T_k) %*% trainOut
estimatedOutput = T_k %*% cEstimate
bindedTrain = cbind (estimatedOutput, trainOut)

# Calculate T_k for test data
svdTest = svd (testAttr)
d_test = svdTest$d
D_test = diag(d_test)
U_test = svdTest$u
V_test = svdTest$v
T_k_test = U_test[, 1:k] %*% D_test[1:k,1:k]

estimatedOutput = T_k_test %*% cEstimate
bindedTest = cbind (estimatedOutput, testOut)
