##################
### Curso de Doctorado
### Análisis de datos para cargas energéticas en edificios. Contexto, Métodos de análisis, Herramientas y Aplicaciones
### UPV/EHU, 2021
### Roberto GARAY MARTINEZ, roberto@robertogaray.com / roberto.garay@Tecnalia.com
### Mikel LUMBRERAS MUGAGUREN
##################

##################
### Práctica 02
### Script 1: REPASO DE CONCEPTOS

rm(list = ls())
#### VAMOS A RECORDAR COMO CARGAR UN CSV DE UN DIRECTORIO EN CONCRETO

## PARA OBTENER LA DIRECCION DE TRABAJO ACTUAL
getwd()

## PARA CAMBIAR EL DIRECTORIO A UNO EN CONCRETO <-- CAMBIAR CADA 1
Directorio <-      ### INSERTAR EL DIRECTORIO
setwd(Directorio)
## LEEMOS EL ARCHIVO QUE CONTIENE LOPS DATOS DEL EDIFICIO EN LA CARPETA DATA
DatosEdificioHora <- read.csv("BuildingData.csv" , header = T , sep = ",")
## QUITAR LA PRIMERA COLUMNA DEL 
DatosEdificioHora <-  ### LA POSICION DE LA COLUMNA QUE QUE QUEREMOS QUITAR

### PASAMOS DE DATOS HORARIOS A DATOS DIARIOS <-- CREAR LA FUNCIÓN
DeHorarioaDiario <- function(DatosEdificioHora)
{
  ### GENERAMOS UN DATAFRAME DIARIO CON LAS MISMAS COLUMNAS QUE EL HORARIO, PERO SIN LAS HORAS
  #### ESTE FRAME TIENE 21 COLUMNAS, QUITANDO HOUR_DAY, HOUR_YEAR, PAR_INPAR Y MOVAVG
  ### EL RESTO PASAMOS A FORMATO DIARIO <-- ALGUNAS SE SUMAN, OTRAS MEDIAS, ETC. 
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




