#################
# Crear Factors #
#################

# Ejemplo 1. Sin orden
sex.v <- c('M', 'F', 'F', 'M', 'M', 'F')
sex.f <- factor(sex.v)
sex.w <- as.character(sex.f) # restauramos

# Ejemplo 2. Con order (Small, Medium, Large)
size.v <- c('S', 'L', 'M', 'L', 'S', 'M')
size1.f <- factor(size.v, ordered = T)
# orden L < M < S

# Ejemplo 3. Especificando el orden
size.lvls <- c('S', 'M', 'L') # establecemos el orden
sz2.f <- factor(size.v, levels = size.lvls)

# Ejemplo 4. Ordenando con niveles y etiquetas
levels <- c(1, 2, 3, 99) # Como se leen los datos de entrada
labels <- c('Love', 'Neutral', 'Hate', NA) # Como se etiquetan
data.v <- c(1, 2, 3, 99, 1, 2, 1, 2, 99)
data.f <- factor(data.v, levels = levels, labels = labels)

# Ejemplo 5. Usando la funcion cut() para agrupar
i <- 1:50 + rnorm(50, 0, 5)
k <- cut(i, 5)

#############################
# Comparaciones de factores #
#############################
z <- sex.f[1] == sex.f[2] # Okay
z <- sex.f[1] == size1.f[2] # Mal
# factors con orden se pueden comparar
z <- size1.f[1] < size1.f[2] # Ok
z <- sex.f[1] < sex.f[2] # Mal

#######################################
# Gestionar la enumeracion de niveles #
#######################################
f <- factor(letters[1:3])
levels(f)  # todos los niveles de f
levels(f)[1] # obtenemos un nivel especifico

# Comprobar la existencia de un nivel
any(levels(f) %in% c('a', 'b')) # TRUE

# Añadir nuevos niveles
levels(f)[length(levels(f)) + 1] <- 'ZZ'
levels(f) <- c(levels(f), 'AA')

# Reordenar niveles
levels(f)
f <- factor(f, levels(f)[c(4, 1:3, 5)])

# cambiar/re-nombrar niveles
levels(f)[1] <- 'XX' # renombrar
levels(f)[levels(f) %in% 'AA'] <- 'BB'

# eliminar niveles no utilizados
f <- f[drop = TRUE]
droplevels(f)

####################
# Combinar factors #
####################
a <- factor(1:10)
b <- factor(letters[a])
union <- factor(c(as.character(a), as.character(b)))
cross <- interaction(a, b)
cross2 <- droplevels(cross)
# ambos producen un conjunto no-ordenado de factors.
# levels: union: 20; cross: 100
# Items:  union: 20; cross: 10

#########
# Traps #
#########
