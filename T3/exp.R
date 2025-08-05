png("T3/dexp.png", width = 1000, height = 1000)

# Parâmetro da distribuição exponencial (lambda)
taxa <- 1  # λ = 1 → média = 1

# Eixo x
x <- seq(0, 10, length.out = 100)

# Probabilidade quantil
p <- seq(0, 1, length.out = 100)

# Amostragem aleatória
set.seed(123)
amostras <- rexp(1000, rate = taxa)

# Configurar a tela para 4 gráficos (2 linhas x 2 colunas)
par(mfrow = c(2, 2))

# 1. Função de densidade - dexp
plot(x, dexp(x, rate = taxa), type = "l", lwd = 2, col = "blue",
     main = "Densidade (dexp)", xlab = "x", ylab = "f(x)")

cat("DEXP ", dexp(x, rate = taxa), "\n")

# 2. Função de distribuição acumulada - pexp
plot(x, pexp(x, rate = taxa), type = "l", lwd = 2, col = "green",
     main = "Distribuição acumulada (pexp)", xlab = "x", ylab = "F(x)")

# 3. Função quantil - qexp
plot(p, qexp(p, rate = taxa), type = "l", lwd = 2, col = "red",
     main = "Quantil (qexp)", xlab = "Probabilidade", ylab = "Quantil")

# 4. Amostragem - rexp
hist(amostras, breaks = 20, col = "gray", border = "white",
     main = "Amostragem (rexp)", xlab = "x", ylab = "Frequência")

cat("Amostras ", amostras, "\n")

# Fechar o dispositivo gráfico
dev.off()
