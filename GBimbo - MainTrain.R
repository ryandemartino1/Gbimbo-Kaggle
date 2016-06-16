#Load Libs
  library(ggplot2) # Data visualization
  library(readr) # CSV file I/O, e.g. the read_csv function
  library(plyr) #for data management
  library(data.table)

#Load Data
  set.seed(4)
  setwd("D:/Sargonnis/Documents/GBimbo Kaggle")
  # train.raw <- read_csv("train.csv")
  n <- 350000
  con <- file("train.csv", open = "r")
  head <- readLines(con, 1)
  sampdat <- readLines(con, n)
  k <- n
  while (length(curline <- readLines(con, 1))) {
    k <- k + 1
    if (runif(1) < n/k)
      sampdat[sample(n, 1)] <- curline
  }
  close(con)
  sampleTrain1 <- read.csv(textConnection(c(head, sampdat)))
  clientFrame <- read_csv("cliente_tabla.csv")
  trainFrame <- join(clientFrame,sampleTrain1,by = "Cliente_ID",type = "right")
  productFrame <- preprocessed
  trainFrame <- join(productFrame,trainFrame,by = "Producto_ID",type = "right")
  townStateFrame <- read_csv("town_state.csv")
  trainFrame <- join(townStateFrame,trainFrame,by = "Agencia_ID",type = "right")
  
  trainFrame$Canal_ID <- as.factor(trainFrame$Canal_ID)
  trainFrame$Ruta_SAK <- as.factor(trainFrame$Ruta_SAK)
  trainFrame$State <- as.factor(trainFrame$State)
  trainFrame$Town <- as.factor(trainFrame$Town)
  trainFrame$NombreCliente <- as.factor(trainFrame$NombreCliente)
  
  #Feature Ideas: state or town population, brand or product popularity/total revenue or profit/shelf life, 
  