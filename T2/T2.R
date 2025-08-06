# Número de lançamentos por simulação
n_lancamentos <- 5

# Número de simulações
num_simulacoes <- 10000

# Simulando os lançamentos: 1 = cara, 0 = coroa
resultados <- replicate(num_simulacoes, sum(sample(c(0,1), size = n_lancamentos, replace = TRUE)))

# Frequência empírica de 0 a 5 caras
frequencias_empiricas <- table(resultados) / num_simulacoes

# Probabilidades teóricas de obter k caras em 5 lançamentos (k = 0,1,2,3,4,5)
valores_k <- 0:n_lancamentos
prob_teoricas <- dbinom(valores_k, size = n_lancamentos, prob = 0.5)

# Transformar os dados em data frame para plotagem
df <- data.frame(
  Caras = valores_k,
  Teorica = prob_teoricas,
  Empirica = as.numeric(frequencias_empiricas[valores_k])
)

# Substituir NAs por 0 (caso alguma frequência empírica não tenha ocorrido)
df$Empirica[is.na(df$Empirica)] <- 0

# Plotando o gráfico
barplot(
  t(as.matrix(df[, c("Teorica", "Empirica")])),
  beside = TRUE,
  col = c("skyblue", "orange"),
  names.arg = df$Caras,
  ylim = c(0, max(df$Teorica, df$Empirica) + 0.05),
  main = "Probabilidades Teóricas vs Frequências Empíricas",
  xlab = "Número de Caras em 5 Lançamentos",
  ylab = "Probabilidade / Frequência"
)

legend("topright", legend = c("Teórica", "Empírica"), fill = c("skyblue", "orange"))
