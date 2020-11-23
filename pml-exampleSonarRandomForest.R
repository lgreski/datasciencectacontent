#
# Sonar example from caret documentation
#

library(mlbench)
library(randomForest) # needed for varImpPlot
data(Sonar)
#
# review distribution of Class column
# 
table(Sonar$Class)
library(caret)
set.seed(95014)

# create training & testing data sets

inTraining <- createDataPartition(Sonar$Class, p = .75, list=FALSE)
training <- Sonar[inTraining,]
testing <- Sonar[-inTraining,]

#
# Step 1: configure parallel processing
# 

library(parallel)
library(doParallel)
cluster <- makeCluster(detectCores() - 1) # convention to leave 1 core for OS 
registerDoParallel(cluster)

#
# Step 2: configure trainControl() object for k-fold cross validation with
#         10 folds
#

fitControl <- trainControl(method = "cv",
                           number = 10,
                           allowParallel = TRUE)

#
# Step 3: develop training model
#

system.time(fit <- train(Class ~ ., method="rf",data=Sonar,trControl = fitControl))

#
# Step 4: de-register cluster
#
stopCluster(cluster)
registerDoSEQ()
#
# Step 5: evaluate model fit 
#
fit
fit$resample
confusionMatrix.train(fit)
#average OOB error from final model
mean(fit$finalModel$err.rate[,"OOB"])

plot(fit,main="Accuracy by Predictor Count")
varImpPlot(fit$finalModel,
           main="Variable Importance Plot: Random Forest")

#
# Step 6: acquire in sample estimate of error, which is the model oob [out-of-bag] estimate of error 
# rate ???, for comparison in subsequent step with out of sample estimate of error
#
fit$finalModel # see "OOB estimate of  error rate: ##.#%" value in output
# look for column name for oob [out-of-bag] estimate of error rate
mer <- fit$finalModel$err.rate; dimnames(mer)
# compare average of $err.rate[, "OOB"] with model output oob estimate of error rate
mean(fit$finalModel$err.rate[, "OOB"]) * 100
# compare median of $err.rate[, "OOB"] with model output oob estimate of error rate
median(fit$finalModel$err.rate[, "OOB"]) * 100
# found mean of $err.rate[,"OOB"] > median of $err.rate[,"OOB"] > fit$finalModel output OOB value
inSampleError <- median(fit$finalModel$err.rate[, "OOB"]) * 100

#
# Step 7. Calculate out of sample estimate of error rate and compare with in sample estimate of error rate
#
pred <- predict(fit, newdata = testing)
confmat <- confusionMatrix(pred, testing$Class)
confmat$table; confmat$overall[["Accuracy"]]
predAccuracy <- confmat$overall[["Accuracy"]]
outOfSampleError <- (1 - predAccuracy) * 100 
outOfSampleError; inSampleError
# Here we are looking for out of sample estimate error rate to be worse than in sample estimate of 
# error rate in order. This is to confirm that accuracy should be better in case of training data 
# where we knew the outcome values vs the unseen training data where we in theory don't know the 
# outcome values.
sessionInfo()
