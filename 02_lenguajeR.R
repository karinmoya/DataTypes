############################
# Ejemplos de Expresiones  #
############################
x <- 1

if (1 > 2) "yes" else "no"

127 %% 10

#######################
# Ejemplos de Objetos #
#######################
c(1,2,3,4,5)

# vector de caracteres con un elemento
"Esto es un objeto tambien"

# una lista
list(c(1,2,3,4,5), "esto es un objeto", "todo es una lista")

####################
# Copia de Objetos #
####################
u <- list(1)
u[[1]] <- "hat"
u
v

########################
# Constantes Built-in
#######################
LETTERS
letters
month.abb
month.name
pi

#######################
# Creacion de Objetos
#######################
sz <- 20
x <- 4
t <- 'c' # vector longitud 1
a <- letters[ceiling(runif(sz, 0.00001, 26))]
names(a) <- LETTERS[1:sz] # un vector con nombre
i <- 1:sz
j <- i + rnorm(sz, 0, 2)
z <- exp((0+1i)*pi) + 1 + 0i # num complejo
d <- as.Date('2015-01-01') + seq(1, sz)
f <- factor(rep(1:x, sz/x), levels = x:1)

df <- data.frame(a = a, d = d, f = f, i = i, j = j, 
                 stringsAsFactors = FALSE)

m <- matrix(rnorm(x^2), nrow = x, ncol = x)
l <- list(df, m, a, z)

#########################################
# Inspeccion de Objetos
#########################################
mode(i)
class(df)
typeof(j)
dput(a)
str(l)
summary(df)
head(df)
tail(df)
attributes(l)
is.null(i)

names(a)
dimnames(df)
colnames(df)
rownames(df)
dim(df)
nrow(m)
ncol(df)
is.list(l)
is.factor(f)
is.complex(z)
is.character(a)
is.matrix(m)
is.numeric(z)
is.integer(i)
is.vector(i)
is.data.frame(df)
is.ordered(f)

isTRUE(all.equal(1:10, as.numeric(1:10)))
identical(1:10, as.numeric(1:10)) # False

#############################################
# Funciones de utilidad
############################################
save(df, file = "myDF.RData")

load("myDF.RData")
assign("mi.data.frame", df)
rm(df)

assign('nombre.variable', 5) # como <- 
c(i, j) # concatenar
rep(NA, 20) # repetir
append(l, list(c(1, 2, 3)))
seq_along(a) # generar secuencias regulares
seq(from = 5, to = 100, by = 5)
seq_len(nrow(df))

sort(a, decreasing = T)
order(a)
rank(a)
rev(a)

any(i %in% c(21, 23, 25))
all(i %in% c(1, 3, 5))
which(a %in% letters[21:26])
match('l', a)

max <- ifelse(i > j, i, j) # vectorised if
switch(txt, a = {print('a')}, 
       b = {print('b')}, 
       {print('default')}) # not vectorised

df <- transform(df, k = i + j)
df <- within(df, s <- i/j) # merge(df1, df2)
x <- with(df, j+5)
df <- cbind(df, z)
row.df <- head(df, 1)
pp <- rbind(df, row.df)
df$f <- reorder(df$f, df$j, mean) # reordenamos los niveles de factor

# funciones para conversion, etc...
as.integer(f)
as.data.frame(m)

#########################
# Funciones Matematicas #
#########################
is.na(i)
is.nan(i)
is.null(d)
is.finite(j)
is.infinite(j)
Re(z); Im(z) # Coeficientes Real e Imaginarios
abs(j)
sqrt(i)
log(i)
log10(j)
exp(j)
ceiling(j)
floor(j)
round(j, digits = 2)
trunc(j)
sin(j)
cos(j)
tan(j)
asin(0.5)
acos(0.5)
atan(1)
sum(j)
prod(j)
cumsum(j)
cumprod(j)

#######################
# Funciones de String #
#######################
s
as.character(j)
toString(l)
nchar(a)
B <- toupper(a)
b <- tolower(B)
s <- "la vaca salto sobre la luna"
sub('la', 'a', s)
gsub('la', 'a', s)
substr(s, 5, 7)
substr(s, 5, 9) <- "perro"

paste0("/home/", "Dropbox/my_directory/")

ll <- paste('a', 'b', 'c', sep = ";")
strsplit(ll, ";")

strsplit(s, ' ')
grep("x", s) # ver tambien grepl y agrep
aa <- make.unique(a) # cambia duplicados en el vector
format(j, digits = 2)
format(d, format= "%A %Y-%b-%d")
sprintf("%d: %s", i, a)

########################
# Funciones de fechas  #
########################

# Date. Un double con el numero de dias desde 1970-01-01
x <- as.Date('18-07-1935', format = '%d-%m-%Y')
Sys.Date()
dias.dif <- d-x
Sys.Date() - x
weekdays(d)
months(d)
Sys.setlocale("LC_TIME", "es_ES.UTF-8") # cambiamos locale
weekdays(d)
months(d)
Sys.setlocale("LC_TIME","")

dp <- as.POSIXlt(d)
dp$year <- dp$year - 1
d <- as.Date(dp)
names(unclass(dp))

# Paquetes utiles zoo y lubridate

#################################
# Gestion de scripts y paquetes #
#################################
source("program.R") # incorpora el codigo R
install.packages("ggplot2") # instala el paquete ggplot2
library(ggplot2)
require(ggplot2) # dentro de funciones

source("01_packages.R")

######################
# Entorno de trabajo #
######################
ls()
rm(z)
help('help')
help.search('help') # buscar ayuda
q() # salir

######################
# Funciones de Debug #
######################
debug()
trace()
stopifnot(i[i] == 1) # assert
warning("mensaje")
stop("mensaje")
