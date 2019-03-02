
##################
# Forma estándar #
#################

plus <- function(x, y) {x + y}
plus(5, 6) # 11
# no es necesario el return. El último valor calculado es devuelto
# Las llaves son opcionales en funciones de 1 línea
x.to.y <- function(x, y) return(x^y)

##########################################
# Argumentos pasados por posicion/nombre #
##########################################

myfuncion <- function(df.clientes) {
  
  df.clientes <- df.clientes[1:3,]
  
  return(df.clientes)
}

df <- myfuncion(df)

b <- function(cat, dog, cow) cat + dog + cow
b(1, 2, 3) # cat=1, dog=2, cow=3
b(cow = 3, cat = 1, dog = 2) # no hay problema de orden
b(co = 3, d = 2, ca = 1) # abreviaciones
# Trap: no todos los argumentos se tienen que pasar
f <- function(x) missing(x); f(); f('here')

##########################
# Argumentos por defecto #
##########################
x2y.1 <- function(x, y = 2) { x ^ y}
x2y.2 <- function(x, y = x) { x ^ y}
x2y.2(3)
x2y.2(2, 3) # 27 8

########################
# Argumentos Variables #
########################

}

x <- f(5)
dput(x) # 5 en una lista

g <- function(...) {
  dots <- substitute(list(...))[-1]
  dots.name <- sapply(dots, deparse)
}
x <- g(a, b, c, d, e)
dput(x) # c("a", "b", "c")

# los puntos se pueden pasar a otra funcion
h <- function(x, ...) g(...)
x <- h(a, b, c)
dput(x) # c("b", "c")


############################
# Entorno de las funciones #
############################

# Nota. Diseñada para ser llamada dentro una fn
called.by <- function() {
  # devuelve string
  if(length(sys.parents()) <= 2) 
    return('.GlobalEnv')
  deparse(sys.call(sys.parent(2)))
}
g <- function(...){ called.by()}
f <- function(...) g(...); 
f(a, 2)

###########################
# Ambito de las variables #
###########################
h <- function(x) {x + a} # a un-defined
a <- 5 # a definida en el entorno global
h(5) # devuelve 10
k <- function(x) {a <- 100; h(x)}
k(10) # devuelve 15
# Nota: variable a local en K no es accedida en h()

######################################
# Efectos laterales de las funciones #
######################################
# Ej. x <<- y ignora la x local y busca el
# super entorno de de a para reemplazar x
acumulador <- function() {
  a <- 0
  function (x) {
    a <<- a + x
    a # imprime
  }
}
acc <- acumulador() 
acc(1); acc(5); acc(2) # imprime 1, 6, 8
###############################
# Funciones Reflection Utiles #
###############################

# variables
?exists
?get
?assign
?substitute
?quote
?eval
?do.call
?parse
?deparse
?quote
?enquote
