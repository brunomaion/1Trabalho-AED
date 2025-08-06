# Script para testar convergência da esperança e variância de uma normal
# com média 170 e desvio padrão 10, de n=5 até n=100000

set.seed(123) # Para reprodutibilidade

media <- 170
dp <- 10
n_min <- 5
n_max <- 100005
step <- 100

# Vetores para armazenar resultados
n_seq <- seq(n_min, n_max, by=step)
esperanca <- numeric(length(n_seq))
variancia <- numeric(length(n_seq))
erro_esperanca <- numeric(length(n_seq))
erro_variancia <- numeric(length(n_seq))

for (i in seq_along(n_seq)) {
  amostra <- rnorm(n_seq[i], mean=media, sd=dp)
  esperanca[i] <- mean(amostra)
  variancia[i] <- var(amostra)
  erro_esperanca[i] <- abs(esperanca[i] - media)
  erro_variancia[i] <- abs(variancia[i] - dp^2)
}

# Criar data frame com todos os resultados
resultados <- data.frame(
  tamanho_amostra = n_seq,
  media_amostral = esperanca,
  erro_esperanca = erro_esperanca,
  variancia_amostral = variancia,
  erro_variancia = erro_variancia
)

# ---- GRÁFICO DA ESPERANÇA ----
png("T4/Esperanca.png", width=1000, height=600)
plot(n_seq, esperanca, type="l", col="blue", lwd=2,
     xlab="Tamanho da amostra", ylab="Esperança (Média)",
     main="Convergência da Esperança",
     xaxt="n")
abline(h=media, col="red", lty=2)
axis(1, at=c(5, 1005, 10005, 50005, 100005),
     labels=c("5", "1005", "10005", "50005", "100005"))
dev.off()

# ---- GRÁFICO DA VARIÂNCIA ----
png("T4/Variancia.png", width=1000, height=600)
plot(n_seq, variancia, type="l", col="green", lwd=2,
     xlab="Tamanho da amostra", ylab="Variância",
     main="Convergência da Variância",
     xaxt="n")
abline(h=dp^2, col="red", lty=2)
axis(1, at=c(5, 1005, 10005, 50005, 100005),
     labels=c("5", "1005", "10005", "50005", "100005"))
dev.off()

# ---- FILTRAGEM DO CSV ----
amostras_desejadas <- c(5, 1005, 10005, 50005, 100005)
resultados_filtrados <- subset(resultados, tamanho_amostra %in% amostras_desejadas)

# Evitar notação científica
options(scipen = 999)

# Salvar CSV filtrado
write.csv(resultados_filtrados, "T4/resultados_convergencia.csv", row.names = FALSE)
