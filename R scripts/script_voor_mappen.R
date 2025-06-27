setwd("C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus")
getwd()

#library's die er nodig zijn voor het mappen
library('BiocManager')
library(Rsamtools)
library(Rsubread)

#Het humame referentie genoom indexeren 
buildindex(
  basename = "ref_human",
  reference = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/ncbi_human/ncbi_dataset/data/GCF_000001405.40/GCF_000001405.40_GRCh38.p14_genomic.fna",
  memory = 4000,
  indexSplit = TRUE)

#Het mappen van de reads tegen het humane genoom
align.normal1 <- align(index = "ref_human", readfile1 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785819_1_subset40k.fastq",
                       readfile2 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785819_2_subset40k.fastq", output_file = "normal1.BAM")


align.normal2 <- align(index = "ref_human", readfile1 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785820_1_subset40k.fastq", 
                       readfile2 =  "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785820_2_subset40k.fastq", output_file = "normal2.BAM")


align.normal3 <- align(index = "ref_human", readfile1 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785828_1_subset40k.fastq", 
                       readfile2 =  "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785828_2_subset40k.fastq", output_file = "normal3.BAM")



align.normal4 <- align(index = "ref_human", readfile1 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785831_1_subset40k.fastq", 
                       readfile2 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785831_2_subset40k.fastq", output_file = "normal4.BAM")




align.reuma1 <- align(index = "ref_human", readfile1 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785979_1_subset40k.fastq", 
                      readfile2 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785979_2_subset40k.fastq", output_file = "reuma1.BAM")


align.reuma2 <- align(index = "ref_human", readfile1 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785980_1_subset40k.fastq",
                      readfile2 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785980_2_subset40k.fastq", output_file = "reuma2.BAM")


align.reuma3 <- align(index = "ref_human", readfile1 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785986_1_subset40k.fastq",
                      readfile2 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785986_2_subset40k.fastq", output_file = "reuma3.BAM")



align.reuma4 <- align(index = "ref_human", readfile1 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785988_1_subset40k.fastq", 
                      readfile2 = "C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4/casus/Data_RA_raw/Data_RA_raw/SRR4785988_2_subset40k.fastq", output_file = "reuma4.BAM")


#Sample namen van de monsters 
samples <- c("normal1", "normal2", "normal3", "normal4",  
             "reuma1", "reuma2", "reuma3", "reuma4")

#Het sorteren en indexeren van de BAM files
lapply(samples, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
})




