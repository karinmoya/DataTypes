
######################
# Creacion de listas #
######################

l1 <- list('gato', 5, 1:10, FALSE) # sin nombre
l2 <- list(x='perro', y = 5 + 2i, z = 3:8) # con nombre
l3 <- c(l1, l2) # una lista parcialmente con nombre
l4 <- list(l1, l2) # una lista de 2 listas
l5 <- as.list(c(1, 2, 3)) # conversion a lista
l6 <- append(origL, insertVarL, position)

#######################
# Contenidos de lista #
#######################
print(l)         # imprime el contenido de la lista
str(l) ; dput(l) # imprime la estructura de la lista
head(l); tail(l) # Primeros/Ultimos elementos en l

# Trap
cat(x) # No funciona en listas

################################
# Indexacion. Ejemplos. get 1D #
################################
j <- list(a = 'gato', b = 5, c = FALSE)
x <- j$a # establece un elemento char vec 'gato' en x
x2 <- j[['a']] # igual que el anterior
x3 <- j['a']   # pone una lista de 1 elemento 'gato' en x3 
x4 <- j[[1]]   # un elemento char vec en 'gato'
x5 <- j[1]     # una lista de 1 elemento 'gato' en x5

#############################
# Indexacion. Ejemplos. Set #
#############################
l <- list(x = 'a', y = 'b', z = 'c', t = 'd')
l[[6]] <- 'new' # tambien pone l[[5]] a NULL 
l$w <- 'new-w'  # pasa a ser l[[7]] llamado 'w'
l[['w']] <- 'dog' # l[[7]] se establece a 'dog'

# cambiar contenido de valores con nombre (ignorando el orden)
l[names(l) %in% c('t', 'x')] <- c(1, 2)
# l$x se pone a 1 y l$t a 2

##################################
# Indexacion. Multidimension get #
##################################

# Se indexa evaluando de izquierda a derecha
i <- c('aa', 'bb', 'cc')
j <- list(a = 'cat', b = 5, c = FALSE)
k <- list(i, j) # lista de cosas

k[[1]] -> x
k[[2]] -> y
k[2] -> x

x <- k[[1]][[1]] # pone el vector 'aa' en x
x <- k[1][1] # mismo que k[1]
x <- k[1][1][1][1][1] # mismo que arriba
x <- k[[1]][[2]] # pone el vector 'bb' en x
x <- k[1][2]     # Error. k[1] es una lista de 1-item
x <- k[1][[2]]   # Error. como arriba
x <- k[[2]][1]   # pone la lista de 'cat' en x
x <- k[[2][[1]]  # pone el vector 'cat' en x
