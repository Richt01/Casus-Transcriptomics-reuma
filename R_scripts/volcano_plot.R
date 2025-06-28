setwd("C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus")
getwd()

#library's die nodig zijn voor de resultaten bewerken
library(pathview)
library(DESeq2)
library(EnhancedVolcano)

#countmatrix inladen
count_matrix_Reuma <- read.csv("bewerkt_countmatrix_Reuma.csv", row.names = 1)

#tabel aanmaken voor differentiele expressieanalyse
treatment <- c("normal", "normal", "normal", "normal", "reuma", "reuma","reuma","reuma")
treatment_table <- data.frame(treatment)
rownames(treatment_table) <- c("normal1", "normal2", "normal3", "normal4",  
                               "reuma1", "reuma2", "reuma3", "reuma4")


#Maak DESeqDataSet aan
dds_Reuma <- DESeqDataSetFromMatrix(countData = round(count_matrix_Reuma),
                                    colData = treatment_table,
                                    design = ~ treatment)
#Voer analyse uit
dds_Reuma <- DESeq(dds_Reuma)
resultaten_Reuma <- results(dds_Reuma)

#Resultaten opslaan in een bestand
write.table(resultaten_Reuma, file = 'Resultaten_Reuma.csv', row.names = TRUE, col.names = TRUE)

#tellen hoeveel genen er statistisch significant op- of neer-gereguleerd zijn
sum(resultaten_Reuma$padj < 0.05 & resultaten_Reuma$log2FoldChange > 1, na.rm = TRUE)
sum(resultaten_Reuma$padj < 0.05 & resultaten_Reuma$log2FoldChange < -1, na.rm = TRUE)

#sorteer resultaat om te kijken welke genen deze zijn
hoogste_fold_change <- resultaten_Reuma[order(resultaten_Reuma$log2FoldChange, decreasing = TRUE), ]
laagste_fold_change <- resultaten_Reuma[order(resultaten_Reuma$log2FoldChange, decreasing = FALSE), ]
laagste_p_waarde <- resultaten_Reuma[order(resultaten_Reuma$padj, decreasing = FALSE), ]

#bekijk welke genen het belangrijkst waren
head(laagste_p_waarde)
head(hoogste_fold_change)

#visualisatie van e resultaten met een volcanoplot
EnhancedVolcano(resultaten_Reuma,
                lab = rownames(resultaten_Reuma),
                x = 'log2FoldChange',
                y = 'padj')

EnhancedVolcano(resultaten_Reuma,
                lab = rownames(resultaten_Reuma),
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 0)

#sla de plot op
dev.copy(png, 'VolcanoplotReuma.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()

#resultaten opslaan 
resultaten_Reuma <- as.data.frame(resultaten_Reuma)
















