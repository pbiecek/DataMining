Project 2 - Internet of Things
------------------------------

# Introduction

Find segments of visitors with similar behavior. 
Show the flow of visitors across different stations.

# The Data

Download the dataset from  https://www.dropbox.com/s/okhx69t68k839mw/logs.rda?dl=0

Smaller dataset https://www.dropbox.com/s/shh2oo35gjxixhs/smalllogs.rda?dl=0

```
> head(logs)
                 date station visitor     type                               scene
1 2012-01-01 09:00:52  cnk02a      -1 Entering <Scene:CustomSplash sceneId=Splash>
2 2012-01-03 08:15:54  cnk02a      -1 Entering <Scene:CustomSplash sceneId=Splash>
3 2012-01-03 09:31:22  cnk02a  795513  Leaving <Scene:CustomSplash sceneId=Splash>
4 2012-01-03 09:31:22  cnk02a  795513 Entering       <Scene:Screen sceneId=Screen>
5 2012-01-03 09:31:45  cnk02a  795513  Leaving       <Scene:Screen sceneId=Screen>
6 2012-01-03 09:31:45  cnk02a  795513 Entering <Scene:CustomSplash sceneId=Splash>
```

# The Goal

In this dataset you have detailed information about interactions of visitors with different stations.

Our goal is to characterize the flow of visitors through these stations. 


# Phases

After each phase you should create a single report (e.g. with the use of knitr). This report will be presented during classes and scored.

In the first phase you should characterize types of interactions with different machines (exploratory analysis). Try to answer following questions:

* what is the average (or distribution) time of interaction with a given machine
* is there a relation between the duraion of an interaction and variables like weekday or hour

In the second phase you should try to segment visitors into separate categories / segments. Try to answer following questions:

* how to define the similarity measure between visitors?
* is the population homogenous or heterogonous. If heterogeneous then how many groups you can derive/define? 
* How to characterize different groups of visitors?
* Is there a pattern in stations that visitor tends to visit?

In the third phase you should create a brief summary of your results. Try to make it an easy to understand for non-specialist.
 We will host a guest that will help to give an feedback related to these analyses.

 

