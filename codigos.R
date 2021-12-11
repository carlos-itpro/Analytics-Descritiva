library(tidyverse)

## Leitura dos dados
survey <- read_csv("dados/kaggle_survey_2021_responses.csv", 
                   locale = locale())

## Separação da primeira linha com a descr. da variável
descricao_survey <- survey %>% 
  slice(n = 1)

# Observações da base
survey_limpo <- survey %>% 
  slice(n = 2:n()) # n() total de linhas na base

survey_limpo %>% 
  count(Q2) %>% 
  arrange(-n)

# %>%  / PIPE:  x %>% f()  ::: f(x)

survey_limpo %>% 
  count(Q2) %>% 
  ggplot() +
  geom_bar(aes(x = reorder(Q2, n), 
               y = n, fill = Q2) , 
           stat = "identity" 
  ) +
  coord_flip() + ylab("Total de Ocorrências") + xlab("Gênero") +
  labs(fill = "Gênero")



tabela  = count(survey_limpo,  Q2)  

ggplot(tabela) + geom_bar(aes(x = reorder(Q2, n), 
                              y = n, fill = Q2) , 
                          stat = "identity", show.legend = FALSE) +
  coord_flip()
