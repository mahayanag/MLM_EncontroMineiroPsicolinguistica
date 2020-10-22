library(lme4)

## importando

priming <- read.csv("dados/priming.csv")

## inspecionando

head(priming)
str(priming)

## um modelo linear

modelo <- lm(tempo ~ prime, priming)

      ## resultados

      summary(modelo)
      
      
      
## um modelo linear misto
      
modelolm <- lmer(tempo ~ prime + (1+prime|participante) + (1+prime|item),
                 priming, REML = FALSE) ##problemas convergencia

modelolm <- lmer(tempo ~ prime + (1+prime|participante) + (1|item),
                 priming, REML = FALSE)
        
        ## resultados
        summary(modelolm)
        

## comparacao por modelos aninhados
        
modelolm.nulo <- lmer(tempo ~ 1 + (1+prime|participante) + (1|item), priming, REML = FALSE)        
        
anova(modelolm, modelolm.nulo)