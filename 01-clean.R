#cargar paquetes

pacman::p_load("vroom","dplyr")

# Verificar el directorio de trabajo actual
setwd ('C:/Users/ANDREA/Desktop/analisis_SNI')
getwd()

# Leer la data
la_data <- vroom(file = "C:/Users/ANDREA/Desktop/analisis_SNI/data/data_original.csv")

# Verificar la estructura de la_data
str(la_data)


# cargar paquetes
pacman::p_load( "vroom", "dplyr" )

# leer la data
la_data <- vroom( file = "data/data_original.csv" )

# nos quedamos solo con DR. y DRA.
data_filtrada <- la_data %>%
  filter( nobilis == "DR." | nobilis == "DRA." )

# creamos un directorio de resultados
dir.create( path = "results" )

# guardar esta data
write.csv( x = data_filtrada, file = "results/limpia.csv" )

# Calcular la proporcion de Dr y DRA que pierden SNI
data_resumen <- data_filtrada %>% 
  filter( cambio == "perdio SNI" ) %>% 
  group_by( nobilis ) %>% 
  summarise( totales = sum( miembros ) )

# Guardamos la data resumen
write.csv( x = data_resumen, file = "results/resumen.csv" )

#TO-DOs
#AndreaIribe :Calcular el % de DR y DRA que pierde SNI
#    COMO TOTAL INGRESOS / TOTAL PERDIDAS