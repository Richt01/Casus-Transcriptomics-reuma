setwd("C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus")
getwd()

#library's die er nodig zijn voor het tellen van de gemapte reads
library(readr)
library(dplyr)
library(Rsamtools)
library(Rsubread)

#GFF inlezen
gff_Reuma <- read_tsv("C:/human_GTF/ncbi_dataset/data/GCF_000001405.40/genomic.gtf", comment = "#", col_names = FALSE)

#kolomnamen toevoegen
colnames(gff_Reuma) <- c("seqid", "source", "type", "start", "end", "score", "strand", "phase", "attributes")

#Alleen genregels selecteren
gff_gene_Reuma <- gff_Reuma %>% filter(type == "gene")

#'type' aanpassen naar 'exon' zodat featureCounts het accepteert
gff_gene_Reuma$type <- "exon"

# defineer een vector met namen van BAM-bestanden
allsamples <- c("normal1.BAM", "normal2.BAM", "normal3.BAM", "normal4.BAM", "reuma1.BAM", "reuma2.BAM","reuma3.BAM","reuma4.BAM")

#Hier wordt weergegeven hoe een countmatrix gemaakt wordt, echter is deze niet gebruikt in de casus
#count_matrix <- featureCounts(
#files = allsamples,
#annot.ext = "C:/human_GTF/ncbi_dataset/data/GCF_000001405.40/genomic.gtf",
#isPairedEnd = TRUE,
#isGTFAnnotationFile = TRUE,
#GTF.attrType = "gene_id",
#useMetaFeatures = TRUE)

#Countmatrix inladen
count_matrix_Reuma <- read.table("C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/count_matrix.txt")

#countmatrix bekijken
head(count_matrix_Reuma$annotation)
head(count_matrix_Reuma$counts)
str(count_matrix_Reuma)

#De verkregen Countmatrix was al gefiterd op "counts" dus deze stap was niet nodg
#count_matrix_Reuma <-count_matrix_Reuma$counts

#kolomnamen toevoegen
colnames(count_matrix_Reuma) <- c("normal1", "normal2", "normal3", "normal4",  
                                  "reuma1", "reuma2", "reuma3", "reuma4")

#countmatrix opslaan
write.csv(count_matrix_Reuma, "bewerkt_countmatrix_Reuma.csv")

#bewerkte countmatrix bekijken
head(count_matrix_Reuma)














































