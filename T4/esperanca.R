# Criar pasta se não existir
if (!dir.exists("T3")) dir.create("T3")

# Parâmetros da distribuição
media_real <- 170
dp_real <- 10

# Tamanhos amostrais a simular
tamanhos <- c(5, 10, 30, 100, 1000)

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
  
  # Registrar
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
png("T4/convergencia_media.png", width = 1000, height = 600, res = 150)
plot(resultados$n, resultados$media_empirica, type = "b", pch = 19,
     ylim = c(min(resultados$media_empirica)-1, max(resultados$media_empirica)+1),
     xlab = "Tamanho da amostra", ylab = "Média empírica",
     main = "Convergência da média amostral")
abline(h = media_real, col = "red", lty = 2)
legend("bottomright", legend = c("Média empírica", "Média real"),
       col = c("black", "red"), lty = c(1, 2), pch = c(19, NA), bty = "n")
dev.off()

# === Gráfico 2: Convergência da variância ===
png("T4/convergencia_variancia.png", width = 1000, height = 600, res = 150)
plot(resultados$n, resultados$variancia_empirica, type = "b", pch = 19,
     ylim = c(min(resultados$variancia_empirica)-5, max(resultados$variancia_empirica)+5),
     xlab = "Tamanho da amostra", ylab = "Variância empírica",
     main = "Convergência da variância amostral")
abline(h = dp_real^2, col = "blue", lty = 2)
legend("topright", legend = c("Variância empírica", "Variância real"),
       col = c("black", "blue"), lty = c(1, 2), pch = c(19, NA), bty = "n")
dev.off()
