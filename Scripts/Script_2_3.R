#### SCRIP 2.3: INTRODUCCION A LAS REGRESIONES LINEALES 

### VAMOS A COMPARAR DOS REGRESIONES LINEALES, PLOTEANDOLAS, CALCULAR METRICAS DE ERROR
### VAMOS A APRENDER A USAR GGPLOT <-- HERRAMIENTA MUY POTENTE PARA DIBUJAR

## PARA ELLO, VAMOS A CARGAR LOS DATOS PREVIAMENTE TRATADOS

## PASO 1: SEPARAR DATOS DE ENTRENAMIENTO Y DATOS DE TESTEO <-- Funcion 1
## PASO 2: CALCULAR COEFICIENTES DE REGRESION <-- MODELO ENTRENAMIENTO
## PASO 3: PROBAR MODELO EN DATOS DE TESTEO
## PASO 4: CALCULAR METRICAS DE ERROR

Direc <- "C:/Users/mlumbreras001/OneDrive/Tecnalia/ProyectosR/Practica_02_CursoR/Data/"
LecturaDatos <- function(DirectorioDatos)
{
  setwd(DirectorioDatos)
  BuildingData <- read.csv(paste(DirectorioDatos , "BuildingDataDay.csv" , sep = "") , header = T , sep = ",")
  BuildingData <- BuildingData[,-1]
  return(BuildingData)
}

DatosEdificio <- LecturaDatos(Direc)
DatosEdificio <- DatosEdificio[-which(is.na(DatosEdificio$Wind.direction) == T),]

## FUNCION 1 <- SEPARAR TRAIN Y TEST (80% TRAIN Y 20% TEST)
TrainingTesting <- function(FrameEdificio)
{
  return(FrameTraining , FrameTesting)
}

RegresionLinealUnivariable <- function(FrameTraining)
{
  ## Q = A + BxT
  return(CoeficientesUV)
}

RegresionLinealMultivariable <- function(FrameTraining)
{
  ## Q = A + BxT + CxGt + DxWs + ExWd
  return(CoeficientesMV)
}

TesteandoRegresiones <- function(FrameTesting , Coef_UV , Coef_MV)
{
  return(list(Regresion_1 , Regresion_2))
}

MetricasError <- function()
{
  return(list(Rsquared, RootmeanSE))
}

