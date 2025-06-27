setwd("C:/Users/richt/OneDrive - NHL Stenden/periode 4/transcriptomics J2P4")
getwd()

library('BiocManager')

library(Rsubread)

browseVignettes('Rsubread')

buildindex(
  basename = 'ref_ecoli',
  reference = 'ncbi_dataset_E.Coli/ncbi_dataset/data/GCF_000005845.2/GCF_000005845.2_ASM584v2_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)

align.eth1 <- align(index = "ref_ecoli", readfile1 = "Transcriptomics/SRR8394576_ethanol_12h_1.fasta.gz", output_file = "eth1.BAM")

align.eth2 <- align(index = "ref_ecoli", readfile1 = "Transcriptomics/SRR8394577_ethanol_12h_2.fasta.gz", output_file = "eth2.BAM")

align.eth3 <- align(index = "ref_ecoli", readfile1 = "Transcriptomics/SRR8394578_ethanol_12h_3.fasta.gz", output_file = "eth3.BAM")

align.control1 <- align(index = "ref_ecoli", readfile1 = "Transcriptomics/SRR8394612_control_12h_1.fasta.gz", output_file = "control1.BAM")

align.control2 <- align(index = "ref_ecoli", readfile1 = "Transcriptomics/SRR8394613_control_12h_2.fasta.gz", output_file = "control2.BAM")

align.control3 <- align(index = "ref_ecoli", readfile1 = "Transcriptomics/SRR8394614_control_12h_3.fasta.gz", output_file = "control3.BAM")

library(Rsamtools)

samples <- c('eth1', 'eth2', 'eth3', 'control1', 'control2', 'control3')

lapply(samples, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
})
lapply(samples, function(s) {indexBam(file = paste0(s, '.sorted.bam'))
})

eth1.sorted.bam


















