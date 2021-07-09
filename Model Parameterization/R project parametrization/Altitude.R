
setwd("P:/LANDIS II/R_calculus")

#install.packages("raster")
library(raster)

#install.packages("rgdal")
library(rgdal)

#install.packages("rgeos")
#library(rgeos)

#install.packages("devtools")
library(devtools)

install_github("paul-carteron/cadastreAnalysis")
library(cadastreAnalysis)
library(tidyverse)
library(sf)
library(nngeo)

### ### ### Importing data


setwd("P:/Stage 2A/Qgis/Estudio/Expansion/Cuenca sedimentaria Gondwanica/Bajo")
ListData =list.files(path = ".", pattern = "\\.csv$")
num=c(1,3,5,7,9)
listname =c("G13B1","G13B2","G13C2","H10A4","H13D3")
for(i in c(1:5)){name=listname[i]j=num[i]1
year66 =read.csv(ListData[j])
cobertura66 =mean(year66$bosque)*100
year16 =read.csv(ListData[j+1])
cobertura16 =mean(year16$bosque)*100
Delta = ((cobertura16-cobertura66)/cobertura66)*100
Covering =rbind(Covering,c(name,cobertura66,"1966","CSG"))
Covering =rbind(Covering,c(name,cobertura16,"2016","CSG"))
Expansion =rbind(Expansion,c(name,Delta,"low","CSG"))}
