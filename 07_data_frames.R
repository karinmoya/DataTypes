#
# 
#
empty <- data.frame()
c1 <- 1:10            # vector de enteros
c2 <- letters[1:10]   # vector de strings
df <- data.frame(col1 = c1, col2 = c2)

####################################
# Importar y exportar a un fichero #
####################################
d2 <- read.csv('filename.csv', header = T)
write.csv(df, file = "filename.csv", quote = F) #exportar

d2 <- read.table('filename.csv', header = T, sep = "|")
write.table(df, file = "filename.csv", quote = F, sep = "|",
            row.names = F)

save(df, file = "df.RData")

load("df.RData", verbose = T)



write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = TRUE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

read.table(file, header = FALSE, sep = "", quote = "\"'",
           dec = ".", numerals = c("allow.loss", "warn.loss", "no.loss"),
           row.names, col.names, as.is = !stringsAsFactors,
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE, fill = !blank.lines.skip,
           strip.white = FALSE, blank.lines.skip = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           stringsAsFactors = default.stringsAsFactors(),
           fileEncoding = "", encoding = "unknown", text, skipNul = FALSE)

######################
# Referenciar celdas #
######################

# [[ para seleccionar individual de celda; [ para múltiple
vec <- df[[5, 2]] # Obtiene la celda de con el num row/col
newDF <- df[1:5, 1:2] # Obtiene varias celdas
df[[2, 'col1']] <- 12 # Set una celda
df[3:5, c('col1', 'col2')] <- 9 # Set varias celdas

###########################
# Referenciar Filas [r, ] #
###########################
# Ojo. Devuelve un data frame y no un vector
row.1 <- df[1, ]
row.n <- df[nrow(df), ]
# Para obtener una fila como vector
row <- 2
vrow <- as.numeric(as.vector(df[row, ]))
vrow <- as.character(as.vector(df[row, ]))

########################
# Referenciar Columnas #
########################
# La mayoria de las referencias devuelven un vector
col.vec <- df$col1 # devuelve un vector
col.vec <- df[, 'col1'] # devuelve un vector
a <- 1
col.vec <- df[, a] # a es un int o string
col.vec <- df[['col1']] # devuelve un vector
frogs.df <- df['col1'] # devueve un df de 1 columna
first.df <- df[1] # devuelve un df con 1 columna
first.col <- df[, 1] # devuelve un vector
last.col <- df[, ncol(df)] # devuelve un vector

################
# Añadir Filas #
################

# La mejor forma si los dos argumentos son dfs
df <- rbind(df, data.frame(col1 = 'd', col2 = 'j'))

###################
# Añadir Columnas #
###################

df$newCol <- rep(NA, nrow(df)) # columna NA
df[, 'copyOfCol'] <- df$col1 # copiamos una columna
df$y.percent.of.x <- df$col1 /sum(df$col1) * 100
df <- cbind(col, df)
df <- cbind(df, col)
df$c3 <- with(df, col1 + col2) # sin comillas
transform(df, col3 = col1* col2)
df <- within(df, colC <- colA + colB)

###########################
# Set nombres de Columnas #
###########################
colnames(df) <- c('date', 'alpha', 'beta')
colnames(df)[1] <- 'new.name.for.col.1'
colnames(df)[colnames(df) %in% c('a', 'b')]
<- c('x','y')

###############################
# Seleccionar multiples filas #
###############################
firstTenRows <- df[1:10, ] # head(df, 10)
todoMenosFila2 <- df[-2, ]
sub <- df[(df$x > 5 & df$y < 5), ]
sub <- subset(df, x > 5 & y < 5)
# Nota. Operadores de vectores & y | 
notLastRow <- head(df, -1) # df[-nrow(df),]

##################################
# Seleccionar múltiples Columnas #
##################################
df <- df[, c(1, 2, 3)] # seleccionar por pos
df <- df[, c('col1', 'col3')] # seleccionar por nombre
# Eliminar columnas
df <- df[, -1] # todas menos la primera columna
df <- df[, -c(1, 3)] # quitar col 1 y col3
df <- df[, !(colnames(df) %in% c('estano', "niesta"))]

# Remplazar elementos de columnas por seleccion de filas
df[df$new.name.for.col.1 == '12', 'col2'] <- c(3)
df[is.na(df$alpha),] <- c('a')
