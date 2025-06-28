# Pathview analyse van patiënten met Reumatoïde Artritis (RA) laat significante verhoging van genexpressie zien van genen die betrokken zijn in immuunactivatie ten opzichte van gezonde personen
# Inleiding
Reumatoïde Artritis (RA) is een chronische auto-immuunziekte geassocieerd met een onstekingsproces dat zowel de gewrichten als organen kan aantasten. De ontsteking komt het meest voor in de kleine gewrichten van handen en voeten, de gewrichten zijn dan vaak stijf, gezwollen en vaak doen ze pijn. RA kan niet worden genezen en de ziekte is progressief (Grassi et al., 1998). 
De oorzaak van RA is nog niet helemaal bekend en er is niet veel onderzoek over gedaan, dit komt doordat er gedacht wordt dat RA verschillende oorzaken heeft zoals door: omgeving, genetische en hormonale factoren (Tobón et al., 2010).
Doordat er gedacht wordt dat de oorzaak van RA door verschillende factoren kan komen zijn er ook verschillen de behandelingen voor patiënten met RA. Veel patiënten krijgen fysio therapie met verschillende soorten pijnstillers en reumaremmers, dit kan helpen met de pijn in de gewrichten en de progressie van de ziekte te vertragen (Majithia & Geraci, 2007). 
Het is belangrijk om te weten welke genen meer/minder tot expressie komen bij mensen met RA, omdat er dan bijvoorbeeld betere behandelingen kunnen worden voorgescheven of dat er vroegtijdige symptonen kunnen worden ontdekt.
In dit onderzoek wordt er gekeken met behulp van transcriptomics naar welke genen in het gewrichtsslijmvlies meer of minder tot expressie komen in personen met RA en gezonde mensen.

# Methoden 
Om te bepalen of er verschillen zijn in genexpressie in het gewrichtsslijmvlies van gezonde mensen en mensen met Reumatoïde Artritis (RA) worden er gewrichtsslijmvliezen van 8 personen onderzocht. 4 van deze mensen hebben RA en 4 zijn controle personen. Deze personen zijn allemaal vrouw en hebben de leeftijd van 15 tot en met 66 jaar. Het analyseren van de data wordt uitgewerkt in R met de volgende packages: BiocManager (1.30.26) (Bioconductor - Install, n.d.), Rsubread (2.20,0) (Liao et al., 2019), Rsamtools (2.22.0) (Bioconductor - Rsamtools, n.d.), dplyr (1.1.4) (A Grammar of Data Manipulation • Dplyr, n.d.), readr (2.1.5) (Readr Package - RDocumentation, n.d.), DESeq2 (1.46.0) (Love et al., 2014), KEGGREST (1.46.0) (Bioconductor - KEGGREST, n.d.) en pathview (1.46.0) (Luo & Brouwer, 2013).

Rsubread wordt gebruikt voor het mappen van de reads. Voor het mappen van de reads is het humane genoom (GRCh38.P14) gebruikt als referentiegenoom, deze was van de NCBI website gedownload (Homo Sapiens Genome Assembly GRCh38.P14 - NCBI - NLM, n.d.). Waarna het genoom geïndexeerd en aligned wordt [zie script voor het mappen](https://github.com/Richt01/Casus-Transcriptomics-reuma/blob/main/R_scripts/script_voor_mappen.R).
featureCounts() uit de Rsubread package wordt gebruikt om een tabel te maken waarin staat hoeveel reads er gemapt zijn per gen (countmatrix). Hiervoor is het genomic.gtf bestand van de NCBI website gedownload (GCF_000001405.40) (Homo Sapiens Genome Assembly GRCh38.P14 - NCBI - NLM, n.d.). [bekijk script](https://github.com/Richt01/Casus-Transcriptomics-reuma/blob/main/R_scripts/tellen_van_de_reads.R).
Met DESeq2 worden statistisch significante genen geanalyseerd die differentiaal tot expressie komen en gevisualiseerd met een volcano plot. [bekijk script](https://github.com/Richt01/Casus-Transcriptomics-reuma/blob/main/R_scripts/volcano_plot.R).

Om te bepalen welke biologische processen betrokken zijn bij een veranderde genexpressie wordt er een GO-analyse uitgevoerd met goseq() en GO.dp. [Bekijk GO-analyse script](https://github.com/Richt01/Casus-Transcriptomics-reuma/blob/main/R_scripts/GO_J2P4.R). Met deze resultaten kan er met pathview de bijbehorende pathways bekeken worden van genen met een fold change van <-5 en >5 en een P-waarde van <0.05. [bekijk script van de KEGG-analyse](https://github.com/Richt01/Casus-Transcriptomics-reuma/blob/main/R_scripts/KEGG.R). In figuur 1 is het flowschema weergegeven.
![flowschema](./figuren/flowchart.png) 
<a id="Fig1">Figuur1:</a> 

*flowschema van analyse data uit gewrichtsslijmvlies van 8 vrouwen 4 met RA en 4 controle personen. Leeftijd is van 15 tot en met 66 jaar. Eerst worden de reads gemapt, waarna de reads getelt kunnen worden. Van deze tellingen worden de statistisch significante genen berekent (p < 0.05 en een fold change van < -1 en > 1). En met deze resultaten wordt er m.b.v een GO-analyse de top 10 statistisch significantie biologische processen weergeven (P < 0,05 en een fold change van < -2 en > 2). Met als laatste stap worden de relevante KEGG-pathways van RA bekeken (P < 0,05 en een fold change van < -5 en > 5).

# Resultaten 
Om verschil in expressie van genen te bepalen bij mensen met RA en personen zonder is er van 8 vrouwen gewrichtsslijmvlies onderzocht (4 met RA en 4 als controle personen). Deze data was gemapt en gecount in R en gevisualiseerd met een volcano plot. De statistisch significante genen (P < 0.05) met een fold change van < -2 en > 2 werden berekent met een GO-analyse waarmee een KEGG-analyse werd uitgevoerd met de relevante pathways.

In figuur 2 is de volcano plot weergegeven waar er 4572 statistisch significante genen zijn gevonden die meer/minder tot expressie komen bij RA patiënten ten opzichte van gezonde personen (p < 0.05 en een fold change van < -1 en > 1). Het gen met de laagste p waarde en hoogste fold change is het gen ANKRD30bl, de genen die erna volgen zijn: MT-ND6, SLC9A3R2 en ZNF598. Deze genen worden statistisch significant minder afgeschreven bij mensen met reuma ten opzichte van gezonde personen.
![volcano plot](./figuren/volcano.png) 
<a id="Fig1">Figuur2:</a>

*Figuur 2: volcano plot van alle genen met een p waarde van < 0.05 en een fold change van < -1 en > 1. Waar de niet statistisch significante genen grijs, log2FC groen en de -log2p-value in het rood zijn weergegeven.

In figuur 3 zijn de top 10 Enriched GO-termen weergeven (P < 0,05 en een fold change van < -2 en > 2). Uit de GO-analyse is gebleken dat uit de top 10 Enriched GO-termen de meeste biologische processen te maken hebben met het immuunsysteem. Met de nadruk op B-cellen, lymfocyten en antilichamen.
 ![GO analyse](./figuren/goresult.png) 
<a id="Fig1">Figuur3:</a>
*Figuur 3: De top 10 Enriched GO-termen met een statistisch significantie van P < 0,05 en een fold change van < -2 en > 2.

In figuur 4 is er naar de algemene RA KEGG-pathway gekeken waar P < 0,05 is en de is fold change van < -5 en > 5. De genen die verhoogt tot expressie komen zijn in het rood en verlaagd in het groen weergegeven. In deze pathway is er een verhoogde T-cel activatie, chemocines, cytokineproductie, osteoclastactivatie en botafbraak te zien (Malemud, 2018). 
![KEGG Reuma](./figuren/hsa05323.pathview.png) 
<a id="Fig1">Figuur4:</a>
*Figuur 4: De algemene KEGG-pathway van RA (P < 0,05 is en de is fold change van < -5 en > 5).

In figuur 5 is de synthese van B-cellen weergeven met een KEGG-pathway waar P < 0,05 is en de is fold change van < -5 en > 5. Hier wordt er gezien dat de B-celreceptorroute eerst geactiveerd wordt, maar in de downstream is een remming weergeven. 
![KEGG B-cel](./figuren/hsa04662.pathview.png) 
<a id="Fig1">Figuur5:</a>
*Figuur 5: pathway analyse van B-cell synthese (P < 0,05 is en de is fold change van < -5 en > 5).

# Conclusie
Om te bepalen wat de verschillen in genexpressie is tussen personen met Reumatoïde Artritis (RA) en gezonde personen is er van 8 vrouwen gewrichtsslijmvlies onderzocht (4 met RA en 4 als controle personen).
Uit de resultaten is gebleken dat er veel genen die betrokken zijn bij de activatie van het immuunsysteem een verhoogde expressie vertonen bij RA patiënten dan bij gezonde personen. Met een verhoogde activatie van T-cellen en B-cellen, wat kan duiden op een bijdrage aan de chronische ontstekingsreactie van RA. Dit is ook in de literatuur gevonden (Yoon et al., 2014).

# Bronnen
A Grammar of Data Manipulation • dplyr. (n.d.). Retrieved May 29, 2025, from https://dplyr.tidyverse.org/

Bioconductor - Install. (n.d.). Retrieved June 22, 2025, from https://bioconductor.org/install/

Bioconductor - KEGGREST. (n.d.). Retrieved June 22, 2025, from https://bioconductor.org/packages/release/bioc/html/KEGGREST.html

Bioconductor - Rsamtools. (n.d.). Retrieved June 22, 2025, from https://www.bioconductor.org/packages/release/bioc/html/Rsamtools.html

Grassi, W., De Angelis, R., Lamanna, G., & Cervini, C. (1998). The clinical features of rheumatoid arthritis. European Journal of Radiology, 27(SUPPL. 1), S18–S24. https://doi.org/10.1016/S0720-048X(98)00038-2

Homo sapiens genome assembly GRCh38.p14 - NCBI - NLM. (n.d.). Retrieved June 22, 2025, from https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/

Liao, Y., Smyth, G. K., & Shi, W. (2019). The R package Rsubread is easier, faster, cheaper and better for alignment and quantification of RNA sequencing reads. Nucleic Acids Research, 47(8). https://doi.org/10.1093/NAR/GKZ114

Love, M. I., Huber, W., & Anders, S. (2014). Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. Genome Biology, 15(12). https://doi.org/10.1186/S13059-014-0550-8

Luo, W., & Brouwer, C. (2013). Pathview: An R/Bioconductor package for pathway-based data integration and visualization. Bioinformatics, 29(14), 1830–1831. https://doi.org/10.1093/BIOINFORMATICS/BTT285

Majithia, V., & Geraci, S. A. (2007). Rheumatoid Arthritis: Diagnosis and Management. American Journal of Medicine, 120(11), 936–939. https://doi.org/10.1016/j.amjmed.2007.04.005

Malemud, C. J. (2018). The role of the JAK/STAT signal pathway in rheumatoid arthritis. Therapeutic Advances in Musculoskeletal Disease, 10(5–6), 117–127. https://doi.org/10.1177/1759720X18776224/ASSET/1FA3CD84-4CA3-4B06-8151-60F863A364C4/ASSETS/IMAGES/LARGE/10.1177_1759720X18776224-FIG2.JPG

readr package - RDocumentation. (n.d.). Retrieved June 22, 2025, from https://www.rdocumentation.org/packages/readr/versions/2.1.5

Tobón, G. J., Youinou, P., & Saraux, A. (2010). The environment, geo-epidemiology, and autoimmune disease: Rheumatoid arthritis. Journal of Autoimmunity, 35(1), 10–14. https://doi.org/10.1016/j.jaut.2009.12.009

Yoon, B. R., Yoo, S. J., Choi, Y. H., Chung, Y. H., Kim, J., Yoo, I. S., Kang, S. W., & Lee, W. W. (2014). Functional Phenotype of Synovial Monocytes Modulating Inflammatory T-Cell Responses in Rheumatoid Arthritis (RA). PLOS ONE, 9(10), e109775. https://doi.org/10.1371/JOURNAL.PONE.0109775






































