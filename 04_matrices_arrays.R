###################
# Matrix creation #
###################
generalCase <- matrix(data = NA, nrow = 1, ncol = 1, byrow = F, dimnames = NULL)
M <- matrix(c(2, -1, 5, -1, 2, -1, 9, -3, 4), nrow = 3, ncol = 3, byrow = T)

# Trap
# Vectores en R no son vectores columnas de matrices. Sin embargo la clase matrix
# produce vectores de 1-columna por defecto.

b <- matrix(c(0, -1, 4)) # Column Vector
I <- diag(3) # crea una matriz diagonal de 3x3
D <- diag(c(1, 2, 3))
d <- diag(M) # un vector con la diag de M
MDF <- as.matrix(df) # data.frame a matrix

#############################
# Manipulacion de matrices  #
#############################
# M y N pueden ser matrices o vectores
newM <- cbind(M, N, ...) # join horizontal
newM <- rbind(M, N, ...) # join vertical
v <- c(M) # Convierte una matrix a vector
df <- data.frame(M) # convierte a data frame

###########################
# Matematicas de matrices #
###########################

rowMeans(M) # vector de medias de filas
colMeans(M) # vector de medias de columnas
rowSums(M)  # vector de sumas de filas
colSums(M)  # vector de sumas de columnas

t <- T(M) # transponer la matrix M
inverse <- solve(M) # Obtener la inversa de M
x <- solve(M, b) # solucionar el sistema para Mx = b
e <- eigen(M)    # lista con autovalores/autovectores
d <- det(M)      # determinante de la matriz

##################################################
# Indexacion de Matrices [row, col] [[row, col]] #
##################################################

##########
# Arrays #
##########

# Ejemplo de vector tri-dimensional
A <- array(1:8, dim = c(2, 2, 2))

# Se puede crear en dos pasos:
A <- 1:8
dim(A) <- c(2,2,2)

# Una matriz es un caso especial de array
M <- array(1:9, dim = c(3, 3))



