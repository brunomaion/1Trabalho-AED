# Abrir o dispositivo gráfico para salvar em PNG
png("T3/dunif.png", width = 1000, height = 1000)

# Parâmetros da distribuição uniforme
min <- 0
max <- 10

# Eixo x
x <- seq(min - 1, max + 1, length.out = 100)

# Valores de probabilidade para a função quantil
p <- seq(0, 1, length.out = 100)

# Amostragem aleatória
set.seed(123)
amostras <- runif(1000, min, max)

# Configurar a tela para 4 gráficos (2 linhas x 2 colunas)
par(mfrow = c(2, 2))

# 1. Função de densidade - dunif
plot(x, dunif(x, min, max), type = "l", lwd = 2, col = "blue",
     main = "Densidade (dunif)", xlab = "x", ylab = "f(x)")

cat("DUNIF ", dunif(x, min, max))

# 2. Função de distribuição acumulada - punif
plot(x, punif(x, min, max), type = "l", lwd = 2, col = "green",
     main = "Distribuição acumulada (punif)", xlab = "x", ylab = "F(x)")

# 3. Função quantil - qunif
plot(p, qunif(p, min, max), type = "l", lwd = 2, col = "red",
     main = "Quantil (qunif)", xlab = "Probabilidade", ylab = "Quantil")

# 4. Amostragem - runif
hist(amostras, breaks = 20, col = "gray", border = "white",
     main = "Amostragem (runif)", xlab = "x", ylab = "Frequência")

cat("Amostras ", amostras)

# Fechar o dispositivo gráfico
dev.off()
