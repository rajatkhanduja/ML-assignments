library (pixmap)

# List the train files
trainFiles = dir("orl_faces", pattern="*[1-9].pgm", full.names=T, recursive=T)

# List the test files
testFiles = dir("orl_faces", pattern="*10.pgm", full.names=T, recursive=T)

# Separate the training set and test set corresponding to each folder
trainSet = numeric(9)
testSet  = 1
x <- 1:40
for (i in seq(along = x))
{
  searchStr = paste('/s', i, '/', sep='')
  trainSet  = rbind(trainSet, trainFiles[grep(searchStr, trainFiles)])
  testSet   = rbind(testSet, testFiles[grep(searchStr, testFiles)])
}
trainSet = trainSet[2:nrow(trainSet),]
testSet  = testSet[2:nrow(testSet),]

# Create the training and test matrix of row vectors of pixels
trainMatrix = numeric(92 * 112)
testMatrix  = numeric(92 * 112)
y <- 1:9
for (i in seq(along = x))
{
  for (j in seq(along = y))
  {
    t <- read.pnm(trainSet[i,j])
    m <- getChannels(t)
    trainMatrix = rbind(trainMatrix, as.vector(m))
  }
  t <- read.pnm(testSet[i])
  m <- getChannels(t)
  testMatrix = rbind(testMatrix, as.vector(m))
}

trainMatrix = trainMatrix[2:nrow(trainMatrix),]
testMatrix  = testMatrix[2:nrow(testMatrix),]

# PCA
principalComp = prcomp (trainMatrix)
eigenVals = principalComp$sdev
x <- 1:360
s = 0
total = sum(eigenVals * eigenVals)
for (k in seq(along=x))
{
  s = s + (eigenVals[k] * eigenVals[k])
  if (s / total)
  {
    break
  }
}


