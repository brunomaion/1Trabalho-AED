# Parâmetros
media <- 170
dp <- 10

# Probabilidade para quantil
prob <- 0.40

q <- qnorm(prob, mean = media, sd = dp)

cat("Probabilidade =", prob, "-> Quantil q =", round(q, 2), "\n")

x <- seq(130, 220, by = 1)
y <- dnorm(x, mean = media, sd = dp)

# Abrir dispositivo gráfico
png("T3/qnorm.png", width = 1000, height = 600, res = 150)

# Plot curva normal
plot(x, y, type = "l", lwd = 2, col = "black",
     xlab = "Altura (cm)", ylab = "Densidade",
     main = expression(paste("qnorm() ", N(170, 10^2))),
     xaxt = "n")


axis(1, at = seq(130, 220, by = 10))

x_sombra <- x[x <= q]
y_sombra <- dnorm(x_sombra, mean = media, sd = dp)
polygon(c(x_sombra, rev(x_sombra)),
        c(y_sombra, rep(0, length(y_sombra))),
        col = rgb(0.2, 0.6, 1, 0.4), border = NA)

abline(v = media, col = "red", lty = 2, lwd = 2)

# Legenda
legend("topright", legend = c(
  bquote(q[.(prob)] == .(round(q, 2))),
  "Média = 170"
), col = c("blue", "red"), lwd = 2, lty = 2, bty = "n")

# Fechar dispositivo gráfico
dev.off()
