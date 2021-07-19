#### SCRIP 2.1: REPASO PRACTICA 1
rm(list = ls())
#### VAMOS A RECORDAR COMO CARGAR UN CSV DE UN DIRECTORIO EN CONCRETO

## PARA OBTENER LA DIRECCION DE TRABAJO ACTUAL
getwd()

## PARA CAMBIAR EL DIRECTORIO A UNO EN CONCRETO <-- CAMBIAR CADA 1
Directorio <- "C:/Users/mlumbreras001/OneDrive/Tecnalia/ProyectosR/Practica_02_CursoR/Data/"
setwd(Directorio)
## LEEMOS EL ARCHIVO
DatosEdificioHora <- read.csv("BuildingData.csv" , header = T , sep = ",")
##♣ QUITAR LA PRIMERA COLUMNA
DatosEdificioHora <- DatosEdificioHora[,-1] ### LA POSICION DE LA COLUMNA QUE QUE QUEREMOS QUITAR

### PASAMOS DE DATOS HORARIOS A DATOS DIARIOS
DeHorarioaDiario <- function(DatosEdificioHora)
{
  ### GENERAMOS UN DATAFRAME DIARIO CON LAS MISMAS COLUMNAS QUE EL HORARIO, PERO SIN LAS HORAS
  DatosEdificioDia <- data.frame(matrix(ncol = 21, nrow = max(DatosEdificioHora$Day_Year)))
  for (j in 1:6)
    colnames(DatosEdificioDia)[j] <- colnames(DatosEdificioHora)[j]
  colnames(DatosEdificioDia)[7] <- "Day_year"
  for (j in 8:length(DatosEdificioDia))
    colnames(DatosEdificioDia)[j] <- colnames(DatosEdificioHora)[j]
  for (n in 1:length(DatosEdificioDia$ADDRESS))
  {
    Datos_Diarios <- DatosEdificioHora[DatosEdificioHora$Day_Year == n ,]
    for (j in 1:6)
      DatosEdificioDia[n,j] <- Datos_Diarios[1,j]
    DatosEdificioDia[n,7] <- n
    DatosEdificioDia[n,8] <- as.character(Datos_Diarios[1,8]) 
    DatosEdificioDia[n,9] <- Datos_Diarios[1,9]
    DatosEdificioDia[n,10] <- Datos_Diarios[1,10]
    DatosEdificioDia[n,11] <- sum(Datos_Diarios[,11]) 
    DatosEdificioDia[n,12] <- sum(Datos_Diarios[,12])
    for (j in 13:20)
      DatosEdificioDia[n,j] <- mean(Datos_Diarios[,j])
    DatosEdificioDia[n,21] <- sum(Datos_Diarios$Irradiation.flux)
  }
  return(DatosEdificioDia)
}

### LLAMAMOS A LA FUNCION CREADA PARA CAMBIAR EL FORMATO DE HORARIO A DIARIO
DatosDiarios <- DeHorarioaDiario(DatosEdificioHora)

### GUARDAMOS EL ARCHIVO DIARIO (Mismo Directorio)
write.csv(DatosDiarios , file = "BuildingDataDay.csv")


### FIN DEL REPASO A LA PRACTICA 1
## VOLVEMOS A LIMPIAR EL ENVIRONMENT

rm(list = ls())

##########################################################################################################




