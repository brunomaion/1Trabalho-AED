# Parâmetros
media <- 170
dp <- 10
limite1 <- 180  # para P(X < 180)
limite2 <- 175  # para P(X > 175)

x <- seq(130, 220, by = 1)
y <- dnorm(x, mean = media, sd = dp)

# Probabilidades
prob1 <- round(pnorm(limite1, mean = media, sd = dp), 4)
prob2 <- round(1 - pnorm(limite2, mean = media, sd = dp), 4)

cat("P(X < 180) =", prob1, "\n")
cat("P(X > 175) =", prob2, "\n")

png("T3/pnorm.png", width = 1000, height = 600, res = 150)

plot(x, y, type = "l", lwd = 2, col = "black",
     xlab = "Altura (cm)", ylab = "Densidade",
     main = expression(paste("pnorm() ", N(170, 10^2))),
     xaxt = "n")  # Desliga o eixo x padrão para customizar

axis(1, at = seq(130, 220, by = 10))

x_sombra1 <- x[x <= limite1]
y_sombra1 <- dnorm(x_sombra1, mean = media, sd = dp)
polygon(c(x_sombra1, rev(x_sombra1)),
        c(y_sombra1, rep(0, length(y_sombra1))),
        col = rgb(0.2, 0.6, 1, 0.4), border = NA)

x_sombra2 <- x[x >= limite2]
y_sombra2 <- dnorm(x_sombra2, mean = media, sd = dp)
polygon(c(x_sombra2, rev(x_sombra2)),
        c(y_sombra2, rep(0, length(y_sombra2))),
        col = rgb(0.2, 0.8, 0.2, 0.4), border = NA)

abline(v = media, col = "red", lty = 2, lwd = 1.5)         # Média = 170
abline(v = limite1, col = "blue", lty = 2, lwd = 1.5)       # Linha azul em 180
abline(v = limite2, col = "darkgreen", lty = 2, lwd = 1.5)  # Linha verde em 175

legend("topright", legend = c(
  bquote(P(X < 180) == .(prob1)),
  bquote(P(X > 175) == .(prob2))
), col = c("blue", "darkgreen"), lwd = 2, lty = 2, bty = "n")

dev.off()
