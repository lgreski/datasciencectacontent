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
sessionInfo()
