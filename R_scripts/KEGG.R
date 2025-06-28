setwd("C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus")

#resultaten inladen
resultaten2 <- read.csv("C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Resultaten_Reuma.csv", sep = " "
)
#Lybrary's dei nodig zijn voor de KEGG analyse 
library(pathview)
library(readr)
library(KEGGREST)

resultaten2[1] <- NULL
resultaten2[2:5] <- NULL

# er wordt gebruik gemaakt van de reuma pathview
pathview(
  gene.data = resultaten2,
  pathway.id = "hsa05323",  # KEGG ID voor reuma
  species = "hsa",          # humaan
  gene.idtype = "SYMBOL",   # er wordt gebruik gemaakt van genesymbols
  limit = list(gene = 5)    # Kleurbereik voor log2FC van -5 tot +5
)


pathview(
  gene.data = resultaten2,
  pathway.id = "hsa04662",  # KEGG ID voor reuma
  species = "hsa",          # humaan
  gene.idtype = "SYMBOL",   # er wordt gebruik gemaakt van genesymbols
  limit = list(gene = 5)    # Kleurbereik voor log2FC van -5 tot +5
)





















































