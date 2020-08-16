# Limpiado de vriables
rm(list = ls())

install.packages("rvest")

# cargar las librerias
library(xml2)
library(rvest)

#b) Con las funciones entregadas anteriormente realice la extracción de la 
#noticia, elimine todos los caracteres raros, conectores y lleve todas las 
#palabras a minúscula para esto use las funciones gsub y tolower. Separe las 
#palabras, almacenarlas en una lista, para esto tiene el comando strsplit
#(“texto a separar”,”separador”)[[1]], utilizando for calcule la repetición de 
#cada una de las palabras.

#Extraer datos de html
readHtml <- read_html("Tarea3.html")
print(readHtml)
parrafNoticia <- html_nodes(readHtml,".justificado")
print(parrafNoticia)
parrafNoticia <- html_text(parrafNoticia)
print(parrafNoticia)

#Eliminar caracteres raros y conectores
parrafNoticia <- gsub("\r\n","",parrafNoticia)
parrafNoticia <- gsub("\\n","",parrafNoticia)
parrafNoticia <- gsub("\\r","",parrafNoticia)
parrafNoticia <- gsub("[.]","",parrafNoticia)
parrafNoticia <- gsub("[,]","",parrafNoticia)
parrafNoticia <- gsub("[()]","",parrafNoticia)
parrafNoticia <- gsub("[%]","",parrafNoticia)
parrafNoticia <- gsub("[;]","",parrafNoticia)
parrafNoticia <- gsub("[-]","",parrafNoticia)
print(parrafNoticia)

#Palabras en minuscula
parrafNoticia <- tolower(parrafNoticia)
print(parrafNoticia)

#Separar palabras
palabrasNoticia <- strsplit(parrafNoticia," "[[1]])
print(palabrasNoticia)

#Almacenar palabras en lista 
listaPalabras <- as.list(palabrasNoticia)
print(listaPalabras)

#Calcular repeticion de cada palabra

repeticiontabla<- table(listaPalabras)
View(repeticiontabla)

#c) Extraiga los datos de la tabla y almacenarlos en una variable tipo data, a 
#los datos extraídos usando herramientas de for calcule promedio y mediana.

#Extraer datos de la tabla
extracDatos <- html_nodes(readHtml,".tabla > table")
tablaProductos <- html_table(extracDatos)
print(tablaProductos)
tablaProductos <- tablaProductos[[1]]
print(tablaProductos)
View(tablaProductos)

#Limpiar datos tabla
print(tablaProductos[[2]])
precios <- gsub("[.]","",tablaProductos[[2]])
precios <- gsub("$","",precios)
precios <- as.numeric(precios)
print(precios)

#Promedio y Mediada de Precios

sumaPrecio<-0

for(preciosTabla in 1:length(precios)){
  sumaPrecio <- sumaPrecios + precios[preciosTabla]
}

promedio <- sumaPrecio/length(precios)
print(paste("El promedio es:$", promedio))
mediana <- median(precios)
print(paste("La mediana es:$", mediana))



