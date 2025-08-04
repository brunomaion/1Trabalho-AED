# Eixo comum para as curvas
x <- seq(130, 220, by = 1)

# Curvas de densidade normal
y1 <- dnorm(x, mean = 175, sd = 20)
y2 <- dnorm(x, mean = 175, sd = 10)
y3 <- dnorm(x, mean = 165, sd = 10)

png("dnorm1.png", width = 1200, height = 700, res = 150)
# Plotar a primeira curva
plot(x, y1, type = "l", col = "blue", lwd = 2,
     ylim = c(0, max(y1, y2, y3)),
     xlab = "Altura", ylab = "Densidade",
     main = "Curvas de Densidade Normal: dnorm()")

axis(1, at = seq(130, 220, by = 10))
# Adicionar as outras curvas
lines(x, y2, col = "red", lwd = 2)
lines(x, y3, col = "green", lwd = 2)
# Linhas verticais nas médias
abline(v = 175, col = "red", lty = 2, lwd = 1.5)  # Média de y1 e y2
abline(v = 165, col = "green", lty = 2, lwd = 1.5) # Média de y3
# Adicionar legenda com notação matemática
legend("topright", legend = c(
  expression(paste(N(175, 20^2))),
  expression(paste(N(175, 10^2))),
  expression(paste(N(165, 10^2)))
), col = c("blue", "red", "green"), lwd = 2, lty = 1)

dev.off()

# Calcular densidade exatamente na média
d1 <- dnorm(175, mean = 175, sd = 20)
d2 <- dnorm(175, mean = 175, sd = 10)
d3 <- dnorm(165, mean = 165, sd = 10)


# Printar os valores no console
cat("Densidade em média y1 (N(175, 20²)):", round(d1, 4), "\n")
cat("Densidade em média y2 (N(175, 10²)):", round(d2, 4), "\n")
cat("Densidade em média y3 (N(165, 10²)):", round(d3, 4), "\n")