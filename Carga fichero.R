#Carga de datos
setwd("C:/Users/JON/Desktop/Ex�men_DS")
load("C:/Users/JON/Desktop/Ex�men_DS/muestra24.RData")
muestra24d<-muestra24

#An�lisis de la estructura
dim(muestra24)#Dimensiones de datos (299110 x 3)
str(muestra24)#Estructura de datos (Un dataframe de 3 variables, todas de clase character)

#Ajuste de nombre
names(muestra24)[1]="nif"
names(muestra24)[2]="nombre"
names(muestra24)[3]="genero"

#Realizaci�n de expresiones regulares para la variable nif
#Filtrar los nif "completos o buenos"
parametros <- "([[:digit:]]{8})([[:alpha:]]{1})" #Creaci�n de los par�metros/criterios (que tenga 8 n�meros y una letra al final)
grepl(pattern = parametros, x = muestra24$nif) #Se usa la funci�n grepl en la que de introducen los parametros y la columna donde se le van a aplicar 
filtrado<-grepl(pattern = parametros, x = muestra24$nif) #Se guarda en un objeto el anterior filtro
conversion_a_vector<-as.vector(which(filtrado, arr.ind=FALSE)) #Conversi�n a vector de el anterior objeto
muestra24<-muestra24[c(conversion_a_vector),] #Adjudicaci�n del anterior vector al dataframe muestra 24

#Las dimensiones son (me sale logical(0), aunque creo que el c�digo est� bien)


#Creaci�n de la variable genero_imp
muestra24$genero_imp<-" " #Creaci�n de una variable vac�a
library(mice) #Carga de la libre�a mice
#class(muestra24)
impute <- mice(muestra24[,c(2,4)], m=3, method="pmm", seed = 123) #Imputaci�n por el m�todo pmm



















