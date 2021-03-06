

#create vector congruence coefficient correlation matrix
VCV <-dotcorr (neurocranium.nosymm.geomorph$coords)

#save VCV
save(VCV, file = 'VCV.R')

#import point by point module definition file
module.df <- as.data.frame(read.csv("D:/modularity guide.csv"))

#Run EMMLi (second input is number of specimens in sample)
EMMLi(VCV,62,module.df, saveAs = ("D:/Current/NHM/data/Pelagiaria/Modularity/neurocranium_EMMLi.csv"), pprob = 0.05)

#you'll need to create a .csv file ("modularity guide.csv") listing all your hypotheses (see .csv)
#The numbers in the columns correspond to the module in that hypothesis, e.g. all the landmarks belonging to module 1 have a number 1 in the relevant column

