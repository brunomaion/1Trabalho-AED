# Gerar dados com runif(n, min=0, max =1)
dados_runif <- runif(10, 0, 1)
print(dados_runif)

dados_runif <- runif(10, 1, 10)
print(dados_runif)

# Gerar dados com rnorm(n, média, desvio padrão)
dados_rnorm <- rnorm(10, 0, 1)
print(dados_rnorm)

dados_rnorm <- rnorm(10, 50, 0)
print(dados_rnorm)

# Gerar dados com rbinom(n, numero de tentativas, probabilidade)
dados_rbinom <- rbinom(10, 7, 1/6)
print(dados_rbinom)