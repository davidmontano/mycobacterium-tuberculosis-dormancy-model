# Code for obtaining the attractors of the network
install.packages("BoolNet") 
library(BoolNet) 
getwd() 
net <- loadNetwork("redmtbe19.txt") 
plotNetworkWiring(net) 
net <- loadNetwork("redmtbe19.txt") 
attr <- getAttractors(net)
plotAttractors(attr)
