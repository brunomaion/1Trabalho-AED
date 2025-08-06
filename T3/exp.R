# Salvar gráfico em arquivo
png("T3/norm.png", width = 1000, height = 1000)

# Parâmetros da distribuição normal
media <- 0     # média (mu)
dp <- 1        # desvio padrão (sigma)

# Eixo x
x <- seq(-4, 4, length.out = 100)

# Eixo de probabilidade para quantis
p <- seq(0, 1, length.out = 100)

# Amostragem aleatória
set.seed(123)
amostras <- rnorm(1000, mean = media, sd = dp)

# Configurar a tela para 4 gráficos (2 linhas x 2 colunas)
par(mfrow = c(2, 2))

# 1. Função de densidade - dnorm
plot(x, dnorm(x, mean = media, sd = dp), type = "l", lwd = 2, col = "blue",
     main = "Densidade (dnorm)", xlab = "x", ylab = "f(x)")

cat("DNORM ", dnorm(x, mean = media, sd = dp), "\n")

# 2. Função de distribuição acumulada - pnorm
plot(x, pnorm(x, mean = media, sd = dp), type = "l", lwd = 2, col = "green",
     main = "Distribuição acumulada (pnorm)", xlab = "x", ylab = "F(x)")

# 3. Função quantil - qnorm
plot(p, qnorm(p, mean = media, sd = dp), type = "l", lwd = 2, col = "red",
     main = "Quantil (qnorm)", xlab = "Probabilidade", ylab = "Quantil")

# 4. Amostragem - rnorm
hist(amostras, breaks = 20, col = "gray", border = "white",
     main = "Amostragem (rnorm)", xlab = "x", ylab = "Frequência")

# Fechar o dispositivo gráfico
dev.off()
