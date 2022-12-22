library(readxl)
library(readr)
library(openxlsx)

Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory <- read_csv("datasets/Airlinewise Monthly International Air Traffic To And From The Indian Territory.csv")

trafico_mensual_por_linea_aerea <- Airlinewise_Monthly_International_Air_Traffic_To_And_From_The_Indian_Territory

View(trafico_mensual_por_linea_aerea)

# Análisis exploratotio de datos

#Detectar los datos numéricos
datos_num <- trafico_mensual_por_linea_aerea[, 6:ncol(trafico_mensual_por_linea_aerea)]
print(datos_num) #Entradas y salidas de pasajeros


#Tipos de datos y clasificación
str(trafico_mensual_por_linea_aerea)

#vizualizar datos por terminal 
head(trafico_mensual_por_linea_aerea, 3)


# Examen final :D 
  
  # El Trabajo de Investigación debe ser presentado mediante los archivos que consideren necesarios.
  # El Trabajo de Investigación debe ser presentado únicamente por el encargado del Grupo.
  # El Grupo, al momento de realizar la presentación de su Trabajo de Investigación, podrá acompañarse de diapositivas.
  # La exposición tendrá una duración máxima de 20 minutos.
  # El trabajo consiste en realizar el (análisis descriptivo) del Dataset que cada Grupo selecciono, el cual consiste en:
  
  # 1. Dos tablas de frecuencia agrupada basada en variable cualitativa.
    #Se emplearan: El data frame de trafico aereo mensual por linea aerea 
    
    colnames(trafico_mensual_por_linea_aerea) <- c("Año", "Mes", "Cuartil", "Linea aérea", "Tpo de portador", "Pasajeros hacia India", "Pasajeros desde India","Flete desde India", "Flete hacia India")    #Si se desea trabajr en español
    
      #Tabla de frecuencia basad en aereolineas 

    # Limpieza de datoss
    trafico_mensual_por_linea_aerea <- na.omit(trafico_mensual_por_linea_aerea)
    View(trafico_mensual_por_linea_aerea)
    
    # Nombres y cantidad de aereolineas
    print(length(sort(unique(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`)))))
    print(length(sort(unique(trafico_mensual_por_linea_aerea[["AIRLINE NAME"]])))) # Lo mismo
  
    print(sort(unique(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`))))
    
    # Seleción de datos por todos los años
    
    View(trafico_mensual_por_linea_aerea) #Comprobar integridad de los datos
    
    # Tabla representa las frecuencias de pasajeros que emplearon la aereolinea desde 2015 hasta 2017  
    
    #  Aereolinea Pasajeros 
      
      tabla <- trafico_mensual_por_linea_aerea[,-c(1,2,3,5,8,9)]
      View(tabla)
    
    # Ordenamiento alfabetico por linea aerea
    trafico_mensual_por_linea_aerea <- trafico_mensual_por_linea_aerea[order(trafico_mensual_por_linea_aerea$`AIRLINE NAME`), ]
    View(trafico_mensual_por_linea_aerea)
    
    # Trabajo con los datos deseados
    nombres_de_aereolineas <- sort(unique(as.factor(trafico_mensual_por_linea_aerea$`AIRLINE NAME`)))
    
    total_passengers <- c(1:length(nombres_de_aereolineas))
    
    #Creación de data frame por aereolinea
    for (i in 1:length(nombres_de_aereolineas)){
      airline <- trafico_mensual_por_linea_aerea[trafico_mensual_por_linea_aerea$`AIRLINE NAME`==nombres_de_aereolineas[i], ]
      passengers <- sum(airline$`PASSENGERS TO INDIA`) + sum(airline$`PASSENGERS FROM INDIA`)
      total_passengers[i] <- passengers
    }
    
    # Data frame final
    tabla <- data.frame(nombres_de_aereolineas, total_passengers )
    tabla <- tabla[order(tabla$total_passengers),]
    View(tabla)
  
  # Dos tablas de frecuencia No agrupada basada en variable cuantitativa.
  
  
  # Dos tablas de frecuencia agrupada basada en variable cuantitativa.
  
  # Una tabla de frecuencia bivariada basada en variable cualitativa vs. cualitativa.
  
  # Una tabla de frecuencia bivariada basada en variable cualitativa vs. cuantitativa.
  
  # Una tabla de frecuencia bivariada basada en variable cuantitativa vs. cuantitativa.
  # Calcular: Cuartiles, Media, Moda, Rango, Varianza, Desviación Estándar y Coeficiente de variación de una variable cuantitativa.
  
  # Gráfico de Dispersión, Análisis de Correlación e Interpretación.
  # Generación de modelos (Lineal y No Lineal) e Interpretación.    

