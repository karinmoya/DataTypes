
getOption("defaultPackages")

# Lista de paquetes cargados
(.packages())

# Lista de paquetes disponibles
(.packages(all.available = TRUE))

library()

# cargar un paquete
library(ROCR)

# Comandos de Paquetes
paquetes.instalados <- installed.packages()
paquetes.disponibles <- available.packages()
paquetes.viejos <- old.packages()
paquetes.nuevos <- new.packages()
descargar.paquetes <- download.packages(pkgs=c("ROCR"), destdir = getwd())
eliminar.paquete <- remove.packages(pkgs= c("ROCR"))
actualizar.paquete <- update.packages()
establecer.repositorio <- setRepositories()

# Paquetes de otros repositorios
install.packages("devtools")

library(devtools)
install_github("ggplot2")
