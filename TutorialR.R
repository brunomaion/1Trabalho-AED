# Este é um tuotrial básico sobre R e Rstudio 

# Instalação - Deve ter a linguagem "R" já instalada para assim baixar e utilizar o "RStudio"

# Para atribuição de variavél deve se utilizar " <- " em vez

exemplo_variavel <- 'Texto exemplo'
#Textos/Strings podem ser apas simples ou duplas
print(exemplo_variavel)

# Para execeutar deve selecionar o trecho de código que deseja e 
# apertar "Ctrl+Enter" ou ícone RUN - a saída sera no Console
# !!! Lembrar de limpar o Console ... "Ctrl + L" ou ícone de vassoura no canto
# superior direito !!!


# exemplo de uma estrutura de lista
lista_exemplo <- list(1,2,3,4,5)
print(lista_exemplo)

# exemplo de uma estrutura de lista
vetor_exemplo <- c(1, 2, 3, 4)
print(vetor_exemplo)
# índice específico
# !!! EM R a posição zero é 1 -- !!!?????? !!!
print(vetor_exemplo[1])
#ou
print(c(4,5,6)[3])

#matriz
vetor_exemplo1 <- c(1,2,3)
vetor_exemplo2 <- c(4,5,6)

#Concatenação
vetor_concatenado <- c(vetor_exemplo1, vetor_exemplo2)
print(matriz1)


# Criação da matriz (2 linhas, 3 colunas)
matriz1 <- matrix(c(vetor_exemplo1, vetor_exemplo2), nrow = 2, byrow = TRUE)
print(matriz1)


# FOR em R
for (i in vetor_concatenado) {
  cat("Index exemplo em for: ", i, "\n")
} # cat() serve melhor doq print()














