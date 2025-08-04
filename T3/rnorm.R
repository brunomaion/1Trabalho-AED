# Parâmetros
media <- 170
dp <- 10

# Gerar amostras aleatórias
set.seed(123)  # para reprodutibilidade
valores <- rnorm(20, mean = media, sd = dp)

# Calcular densidade da curva para o eixo x
x <- seq(130, 220, by = 1)
y <- dnorm(x, mean = media, sd = dp)

# Abrir dispositivo gráfico
png("T3/rnorm.png", width = 1000, height = 600, res = 150)

# Plot curva normal
plot(x, y, type = "l", lwd = 2, col = "black",
     xlab = "Altura (cm)", ylab = "Densidade",
     main = expression(paste("rnorm() ", N(170, 10^2))),
     xaxt = "n")

axis(1, at = seq(130, 220, by = 10))

# Adicionar pontos gerados à curva
points(valores, dnorm(valores, mean = media, sd = dp),
       col = "blue", pch = 19)

# Linha na média
abline(v = media, col = "red", lty = 2, lwd = 2)

# Legenda
legend("topright", legend = c(
  "Pontos simulados",
  "Média = 170"
), col = c("blue", "red"), pch = c(19, NA), lty = c(NA, 2), lwd = c(NA, 2), bty = "n")

# Exibir os valores gerados
cat("Valores gerados com rnorm():\n", round(valores, 2), "\n")

# Fechar dispositivo gráfico
dev.off()
