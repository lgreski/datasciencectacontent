#
# model accuracy calculations
# compare Bayes Theorem vs Šidák's correction of multiple tests
# 
# reference: https://github.com/lgreski/datasciencectacontent/issues/7 
# 
options(digits=9)
mdlAccuracy <- c(.8,.85,.9,.95,.99,.995,.996,.997,.9974,0.9974386,0.99743863,0.99743865,.9975)
predAccuracy <- mdlAccuracy^20
data.frame(mdlAccuracy,predAccuracy)

# alternate approach: Šidák's correction of multiple tests
# generate 95% confidence for 20 tests
(1 - .05)^(1/20)