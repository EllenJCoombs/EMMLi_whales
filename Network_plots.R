
#plotting a network
update.packages(ask = FALSE, checkBuilt = TRUE)

library(ggplot2)
library(ggnetwork)
library(network)
install.packages("qgraph")
library(qgraph)

# Load VCV matrix
load(file="D:/Current/NHM/data/Pelagiaria/saved R outputs/pelagiaria.VCV.R")
em1<-EMMLi(VCV,35,module.df)
#nmodules is the number of modules in the model you want to graph
nmodules=7
#rho list directs the code to the results. this will be the "rhos_best" thing for subsampled emmli
rholist<-t(em1$rho$`X6.sep.Mod + sep.between`)
words<-strsplit(rownames(rholist), split = " ")
corrmat_new<-matrix(data = NA, nrow = nmodules, ncol = nmodules)
for (i in 1:(length(words)-1)){
  if (length(words[[i]]) == 2){
    corrmat_new[as.numeric(words[[i]][2]),as.numeric(words[[i]][2])] <- rholist[i,2]
  }
  if (length(words[[i]]) == 3){
    corrmat_new[as.numeric(words[[i]][1]),as.numeric(words[[i]][3])] <- rholist[i,2]
    corrmat_new[as.numeric(words[[i]][3]),as.numeric(words[[i]][1])] <- rholist[i,2]
  }
}

#now a list of your module names in order
mod.names<-c("braincase","anterior neurocranium","upper jaw","operculum","lower jaw","supraoccipital","suspensorium") 
within<-diag(corrmat_new)
between<-corrmat_new
#OPTIONAL: make a csv table to define the shape of your graph
layout1<-as.matrix(read.csv("D:/Current/NHM/data/Pelagiaria/R scripts/layout_pelagiaria.csv", header = FALSE))

qgraph(between, shape="circle", posCol="darkgreen",  labels = mod.names, vsize=(within)*10, diag = FALSE, title="rho values", layout = layout1)

####################
#load in CR cofficient results:

load("~/Google Drive/UCL/ERC Project/June 2017 Analyses/regularmodularitytest.R")
qgraph(regularmod1$CR.mat, shape="circle", posCol="darkgreen",  labels = mod.names, diag = FALSE,cut = .75, title = "CR values")
