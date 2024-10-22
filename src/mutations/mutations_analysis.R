#Trajectory analysis towards the attractor
startState <- generateState(net, specs=c("Rv3133c"= 0,"Rv3132c"=0, "Rv0081"=0, "Rv0474"=0, Rv0757"=0, "Rv1990c"=0, "Rv0967"=0, "Rv1994c"=0, "Rv2021c"=0,"Rv3597c"=0, "Rv3681c"=0, "Rv2324 "=0,  "Rv0324"=1, "Rv0494"=1, "Rv0653c"=1, "Rv1985c"=1,  "Rv2034"=0, "Rv2011c"=1,"Rv2031c"=1, "Rv3574"=1))
stateTransition(net,startState)
path <- getPathToAttractor(network=net, state=startState)
plotSequence(sequence=path)
# Code for activation mutation
