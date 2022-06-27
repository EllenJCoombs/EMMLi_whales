
library(geomorph)

#run CR analysis for each module hypothesis
MT.1 <-modularity.test(Y.gpa,module.df$X1)
MT.2 <-modularity.test(Y.gpa,module.df$X2)
MT.3 <-modularity.test(Y.gpa,module.df$X3)

#compare CR test
MT.patch.compare <- compare.CR(MT.1,MT.2,MT.3,CR.null = TRUE)
summary(MT.patch.compare)

#the module.df object is the same input .csv as you use for EMMLi
#the best supported hypothesis is the one with the smallest effect size in summary()
