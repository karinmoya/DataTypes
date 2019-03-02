# Vector: Un objeto con valores contiguos indexados
# Los indices van de 1 a lenght(vector)
# todos los valores son del mismo tipo básico atómico
# Los vectores no tienen el atributo de dimensión
# Tienen un tamaño fijo cuando son creados

########################
# Creacion de vectores #
########################

# Usando longitud fija
u <- vector(mode = 'logical', length = 4)
print(u)
v <- vector(mode = 'integer', length = 4)
numeric(4)
character(4)
raw(4)

# Usando el operador secuencia
i <- 1:5 # produce una secuencia de enteros
j <- 1.4:5.4 # secuencia numerica
k <- seq(from = 0, to = 1, by = 0.1)
  
# Usando la función c()
l <- c(TRUE, FALSE)    # vector logico
n <- c(1.3, 7, 7/20)   # vector numerico
z <- c(1+2i, 2, 3+4i)  # vector complejo
c <- c('pink', 'blue') # vector caracter

# Otras cosas
v1 <- c(a = 1, b = 2, c = 3) # vector con nombre
v2 <- rep(NA, 3) # repetir NA 3 veces
v3 <- c(v1, v2) # concatenar
v4 <- append(1:5, 0:1, after = 3)

##########################
# Conversion de vectores #
##########################

as.vector(v)
as.logical(v)
as.integer(v)
as.numeric(v)
as.character(v)
unlist(l) # convierte una lista a un vector atomico

########################
# Informacion vectores #
########################
mode(v)
class(v)
typeof(v)
attributes(v)
is.numeric(v)
is.character(v)
(is.vector(v) && is.atomic(v))

###########################
# Contenidos de un vector #
###########################

cat(v); print(v) # imprime el contenido del vector
str(v); dput(v)  # imprime la estructura del vector
head(v); tail(v) # primeros y ultimos 6 elementos

####################
# Indexando [ y [[ #
####################
m <- 2
n <- 4
# Indexando con numeros positivos (Estos)
v4[c(1, 2, 3)] # obtenemos el primero doble y el cuarto
v4[m:n]        # obtenemos los elementos con los indices del m al n
v4[[12]] <- 6   # establecemos el valor 6 en el septimo elemento
v4[which(v4 == 'M')] # which devuelve los indices

# Indexando con numeros negativos (Estos no)
v4[-1] # todos menos el primer elemento
v4[-length(v4)] # todos menos el ultimo elemento
v4[-c(1,3,5,7,9)] # todos menos esos indices

# Indexando con vectores logicos (atomicos)
v[c(TRUE, FALSE, TRUE)] # obtenemos el 1 y el 3 elemento
v[v > 2] # todos los elementos donde v > 2
v[v > 2 & v < 9] # todos los elementos donde v>2 y v<9
v[v == 'M'] # todos los que v sea igual a 'M'
v[v %in% c('me', 'andMe', 'meToo')]

# Indexando por nombre (solo con vectores con nombre)
v[['alpha']] # obtenemos todos los del mismo nombre
v[['beta']] <- 'b' # establecemos el valor
v[c('alpha', 'beta')] 
v[!(names(v) %in% c('a','b'))] # todos los que no esten en a y b
names(v)['z'] <- 'omega' # establecemos el nombre omega

#####################################
# funciones/operadores vectorizados #
#####################################
c(1, 3, 5) + c(5, 3, 1)
c(1, 3, 5) * c(5, 3, 1)

###########
# Sorting #
###########
upSorted <- sort(v)
v[order(v)]
d <- sort(v, decreasing = T) # rev(sort(v))

###############
# Raw vectors #
###############
s <- charToRaw('raw')
r <- as.raw(c(114, 97, 119))
print(r)

#########
# Traps #
#########

c(1, 2, 3, 4, 5) + 1
c(1, 2, 3, 4, 5) * c(1, 0)

# coercion de tipos automatica
x <- c(5, 'a') # convierte 5 a '5'
x <- 1:3
x[3] <- 'a' # ahora '1','2','a'
typeof(1:2) == typeof(c(1, 2))

# algunas operaciones booleanas no estan vectorizadas
c(T, F, T) && c(T, F, F) # TRUE !vectorizada
c(T, F, T) & c(T, F, F) # TRUE, FALSE, FALSE
# de forma similar || no esta vectorizada y | si
# Los indices factor se tratan como enteros.
# Truco decodificarlos
v[as.character(f)]
