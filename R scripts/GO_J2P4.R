setwd("C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus")

#librarys nodig voor GO analyse 
library(goseq)
library(tidyverse)
library(GO.db)
library(readr)

#resultaten inladen
resultaten2 <- read.csv("C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Resultaten_Reuma.csv", sep = " "
)
#data frame maken 
resultaten2 <- as.data.frame(resultaten2)
head(resultaten2)

#sigdata aanmeken met een foldchange <-2 en > 2. P value onder 0,05
sigData <- as.integer(!is.na(resultaten2$padj) & resultaten2$padj < 0.05 & (resultaten2$log2FoldChange < -2 | resultaten2$log2FoldChange > 2))
names(sigData) <- rownames(resultaten2)

#sigdata bekijken
head(sigData)
View(sigData)
sum(sigData)

#PWF maken met genoom hg19
pwf <- nullp(sigData, "hg19", "geneSymbol")

#voer de GO analyse uit
goResults <- goseq(pwf, "hg19", "geneSymbol", test.cats=c("GO:BP"))

#maak een plot van het resultaat
goResults %>% 
  top_n(10, wt=-over_represented_pvalue) %>% 
  mutate(hitsPerc=numDEInCat*100/numInCat) %>% 
  ggplot(aes(x=hitsPerc, 
             y=term, 
             colour=over_represented_pvalue, 
             size=numDEInCat)) +
  geom_point() +
  expand_limits(x=0) +
  labs(x="Hits (%)", y="GO term", colour="p value", size="Count")

#bekijk hoeveel genen een P value hebben onder 0.01
goResults %>%
  filter(over_represented_pvalue < 0.01) %>%
  nrow()






























































