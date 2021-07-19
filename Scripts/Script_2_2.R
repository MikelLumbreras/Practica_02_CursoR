######## SCRIP 2.2: ANALISIS DE CORRELACIONES ENTRE VARIABLES
rm(list = ls())
### LIMPIAMOS EL ENTORNO

### VAMOS A CARGAR EL ARCHIVO GENERADO CON LOS DATOS DIARIOS
## PARA ELLO CREAMOS UNA FUNCION: INPUT: DIRECTORIO, OUTPUT: DATOS
getwd()
Direc <- "C:/Users/mlumbreras001/OneDrive/Tecnalia/ProyectosR/Practica_02_CursoR/Data/"
LecturaDatos <- function(DirectorioDatos)
{
  setwd(DirectorioDatos)
  BuildingData <- read.csv(paste(DirectorioDatos , "BuildingDataDay.csv" , sep = "") , header = T , sep = ",")
  BuildingData <- BuildingData[,-1]
  return(BuildingData)
}

DatosEdificio <- LecturaDatos(Direc)

## PARA VER QUE ESTÁN TODOS LOS DATOS CORRECTAMENTE:

summary(DatosEdificio)

## COMO VERÉIS, HAY DATOS QUE SON NAs <-- QUITARLOS

DatosEdificio <- DatosEdificio[-which(is.na(DatosEdificio$Wind.direction) == T),]

### COMPROBAMOS QUE YA NO HAY NAs

summary(DatosEdificio)

### VAMOS A ANALIZAR LA CORRELACION ENTRE VARIABLES
## PARA ELLO, VAMOS A INSTALAR Y CARGAR UNA LIBRERIA DE R LLAMADA ggpubr
## LO PODEMOS HACER DE VARIAS MANERAS: EN CODIGO:
install.packages("ggpubr")
library("ggpubr")

## EXISTEN OTRAS MANERAS DE CARGAR Y BUSCAR LIBRERIAS <- ver

### cor() y cor.test() son funciones que están implementadas dentro de esta librería
## Estas funciones tienen implementadas las ecuaciones de pearson, spearman entre otros

## 1. CORRELATION TEST
## PEARSON
### EJEMPLO PARA CONSEGUIR COEF. DE PEARSON ENTRE DEMANDA Y TEMPERATURA EXTERIOR
cor(DatosEdificio$Temperature , DatosEdificio$Power.kW., method = c("pearson"))
cor.test(DatosEdificio$Temperature , DatosEdificio$Power.kW., method = c("pearson"))
## SPEARMAN
cor(DatosEdificio$Temperature , DatosEdificio$Power.kW., method = c("spearman"))
cor.test(DatosEdificio$Temperature , DatosEdificio$Power.kW., method = c("spearman"))

### PLOTEAMOS ESTE EJEMPLO DE CORRELACION
### PARA GENERAR UN NUEVO DIBUJO dev.new()
dev.new()
ggscatter(DatosEdificio, x = "Temperature", y = "Power.kW.", 
        add = "reg.line", conf.int = TRUE, 
        cor.coef = TRUE, cor.method = "pearson",
        xlab = "OUTDOOR TEMPERATURE", ylab = "DEMAND")

## DE ESTA FORMA PODRIAMOS ANALIZAR UNA A UNA LA CORRELACION ENTRE VARIABLES

## 2. CORRELATION MATRIX
## ESTE PASO SE PODRÍA HACER UNO A UNO PARA CADA VARIABLE O USAR LA SIGUIENTE LIBRERIA

## GENERAMOS LA DATAFRAME CON LAS VARIABLES QUE NOS INETERESAN
FrameCorrelation <- cbind.data.frame(DatosEdificio$Power.kW. , DatosEdificio$Temperature , 
                                     DatosEdificio$Wind.speed , DatosEdificio$Wind.direction , DatosEdificio$Irradiation.flux)


install.packages("corrplot")
library("corrplot")
#The result of rquery.cormat function is a list containing the following components :
#r : The table of correlation coefficients
#p : Table of p-values corresponding to the significance levels of the correlations
#sym : A representation of the correlation matrix in which coefficients are replaced by symbols according to the strength of the dependence. For more description, see this article: Visualize correlation matrix using symnum function
#In the generated graph, negative correlations are in blue and positive ones in red color.

{
  dev.new()
  a <- rquery.cormat(FrameCorrelation)
}
SpearmanCoef <- a[[1]]
PearsonCoef <- a[[2]]





