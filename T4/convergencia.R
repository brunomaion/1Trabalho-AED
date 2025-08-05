# Parâmetros da distribuição
media_real <- 170
dp_real <- 10

# Tamanhos amostrais a simular
tamanhos <- c(5, 10, 30, 50, 100, 1000, 10000)

# Para armazenar resultados
resultados <- data.frame(
  n = integer(),
  media_empirica = numeric(),
  variancia_empirica = numeric()
)

set.seed(123)  # Reprodutibilidade

for (n in tamanhos) {
  amostra <- rnorm(n, mean = media_real, sd = dp_real)
  media_emp <- mean(amostra)
  var_emp <- var(amostra)
  
  resultados <- rbind(resultados, data.frame(
    n = n,
    media_empirica = media_emp,
    variancia_empirica = var_emp
  ))
  
  cat(sprintf("n = %4d -> média = %.2f | variância = %.2f\n", n, media_emp, var_emp))
}

# Salvar tabela em CSV
write.csv(resultados, file = "T4/resultados_empiricos.csv", row.names = FALSE)

# === Gráfico 1: Convergência da média ===
png("T4/media.png", width = 1000, height = 600, res = 150)
plot(resultados$n, resultados$media_empirica, type = "b", pch = 19,
     log = "x",  # eixo X em escala log
     xaxt = "n",
     ylim = c(min(resultados$media_empirica) - 1, max(resultados$media_empirica) + 1),
     xlab = "Tamanho da amostra (escala log)", ylab = "Média empírica",
     main = "Convergência da média amostral")
axis(1, at = tamanhos, labels = tamanhos)
abline(h = media_real, col = "red", lty = 2)
legend("bottomright", legend = c("Média empírica", "Média real"),
       col = c("black", "red"), lty = c(1, 2), pch = c(19, NA), bty = "n")
dev.off()


# === Gráfico 2: Convergência da variância ===
png("T4/variancia.png", width = 1000, height = 600, res = 150)
plot(resultados$n, resultados$variancia_empirica, type = "b", pch = 19,
     log = "x",
     xaxt = "n", yaxt = "n",
     ylim = c(60, 110),
     xlab = "Tamanho da amostra (escala log)", ylab = "Variância empírica",
     main = "Convergência da variância amostral")

# Eixo X (tamanhos reais)
axis(1, at = tamanhos, labels = tamanhos)

# Eixo Y (de 60 a 110, passo 10)
axis(2, at = seq(60, 110, by = 10), las = 2)  # las = 2 para texto vertical

# Linha da variância real
abline(h = dp_real^2, col = "blue", lty = 2)

# Legenda
legend("bottomright", legend = c("Variância empírica", "Variância real"),
       col = c("black", "blue"), lty = c(1, 2), pch = c(19, NA), bty = "n")
dev.off()
