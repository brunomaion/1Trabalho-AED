# T1. SIMULACAO DE EXPERIMENTOS ALEATORIOS EM R
# SIMULACAO E ANALISE DE JOGO CLASSICO (LANCAMENTO DE MOEDA)
# SIMULANDO 500 LANCAMENTOS DE UMA MOEDA JUSTA EQUILIBRADA (1= CARA, 0= COROA NOS LANCAMENTOS FUTUROS)

set.seed(1234)
lados_moeda <- c("Cara", "Coroa")
lancamentos <- sample(c(0, 1), size = 500, replace = TRUE)

# Calculando o numero de caras (1) e coroas (0) 
n_cara <- sum(lancamentos == 1)
n_coroa <- sum(lancamentos == 0)

# Calculando as proporcoes
prop_cara <- n_cara / length(lancamentos)
prop_coroa <- n_coroa / length(lancamentos)

# Calculo das proporcoes_empiricas a cada lancamento 
proporcoes_empiricas <- cumsum(lancamentos) / (1:500)

# Criando um data.frame para exportar em CSV
# Seleciona apenas os lançamentos desejados
indices <- c(1, 10, 100, 200, 300, 400, 500)
df <- data.frame(
  lancamento = indices,
  resultado = lancamentos[indices],
  proporcao_empirica = proporcoes_empiricas[indices]
)

# Salvando em CSV
write.csv(df, "T1/simulacao_moeda.csv", row.names = FALSE)

# Opcional: imprimir resumo no console
cat("Resumo:\n")
cat("Total de Caras:", n_cara, "\n")
cat("Total de Coroas:", n_coroa, "\n")
cat("Proporcao de Caras:", prop_cara, "\n")
cat("Proporcao de Coroas:", prop_coroa, "\n")