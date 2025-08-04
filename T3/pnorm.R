# Parâmetros
media <- 170
dp <- 10

# Sequência de alturas
x <- seq(130, 210, by = 0.1)
y <- pnorm(x, mean = media, sd = dp)

# Cores
cor_165 <- rgb(1, 0, 0, 0.6)
cor_175 <- rgb(0, 0, 1, 0.6)

# Gráfico da função de distribuição acumulada
plot(x, y, type = "l", lwd = 2, col = "black",
     xlab = "Altura (cm)", ylab = "Probabilidade acumulada",
     main = "Função Acumulada: pnorm()")

# Linha e ponto para P(X ≤ 165)
p_165 <- pnorm(165, mean = media, sd = dp)
abline(v = 165, col = cor_165, lty = 2)
abline(h = p_165, col = cor_165, lty = 2)
points(165, p_165, col = cor_165, pch = 19)
text(165 + 1, p_165, paste0("P(X ≤ 165) = ", round(p_165, 3)),
     pos = 4, col = cor_165)

# Linha e ponto para P(X ≤ 175)
p_175 <- pnorm(175, mean = media, sd = dp)
abline(v = 175, col = cor_175, lty = 2)
abline(h = p_175, col = cor_175, lty = 2)
points(175, p_175, col = cor_175, pch = 19)
text(175 + 1, p_175, paste0("P(X ≤ 175) = ", round(p_175, 3)),
     pos = 4, col = cor_175)

# Diferença entre P(165 < X < 175)
p_intervalo <- round(p_175 - p_165, 3)
text(170, (p_165 + p_175) / 2, paste0("P(165 < X < 175) = ", p_intervalo),
     col = "darkgreen", pos = 3, font = 2)
