# Casus-Transcriptomics-reuma
# Inleiding
Reumatoïde Artritis (RA) is een chronische auto-immuunziekte geassocieerd met een onstekingsproces dat zowel de gewrichten als organen kan aantasten. De ontsteking komt het meest voor in de kleine gewrichten van handen en voeten, de gewrichten zijn dan vaak stijf, gezwollen en vaak doen ze pijn. RA kan niet worden genezen en de ziekte is progressief (Grassi et al., 1998). 
De oorzaak van RA is nog niet helemaal bekend en er is niet veel onderzoek over gedaan, dit komt doordat er gedacht wordt dat RA verschillende oorzaken heeft zoals door: omgeving, genetische en hormonale factoren (Tobón et al., 2010).
Doordat er gedacht wordt dat de oorzaak van RA door verschillende factoren kan komen zijn er ook verschillen de behandelingen voor patiënten met RA. Veel patiënten krijgen fysio therapie met verschillende soorten pijnstillers en reumaremmers, dit kan helpen met de pijn in de gewrichten en de progressie van de ziekte te vertragen (Majithia & Geraci, 2007). 
In dit onderzoek wordt er gekeken met behulp van transcriptomics naar welke genen in het gewrichtsslijmvlies meer of minder tot expressie komen in personen met RA en gezonde mensen.

# Methoden 
Om te bepalen of er verschillen zijn in genexpressie in het gewrichtsslijmvlies van gezonde mensen en mensen met Reumatoïde Artritis (RA) worden er gewrichtsslijmvliezen van 8 personen onderzocht. 4 van deze mensen hebben RA en 4 zijn controle personen. Deze personen zijn allemaal vrouw en hebben de leeftijd van 15 tot en met 66 jaar. Het analyseren van de data wordt uitgewerkt in R met de volgende packages: BiocManager (1.30.26) (Bioconductor - Install, n.d.), Rsubread (2.20,0) (Liao et al., 2019), Rsamtools (2.22.0) (Bioconductor - Rsamtools, n.d.), dplyr (1.1.4) (A Grammar of Data Manipulation • Dplyr, n.d.), readr (2.1.5) (Readr Package - RDocumentation, n.d.), DESeq2 (1.46.0) (Love et al., 2014), KEGGREST (1.46.0) (Bioconductor - KEGGREST, n.d.) en pathview (1.46.0) (Luo & Brouwer, 2013).

Rsubread wordt gebruikt voor het mappen van de reads. Voor het mappen van de reads is het humane genoom (GRCh38.P14) gebruikt als referentiegenoom, deze was van de NCBI website gedownload (Homo Sapiens Genome Assembly GRCh38.P14 - NCBI - NLM, n.d.). Waarna het genoom geïndexeerd en aligned wordt (zie script voor het mappen).
featureCounts() uit de Rsubread package wordt gebruikt om een tabel te maken waarin staat hoeveel reads er gemapt zijn per gen (countmatrix). Hiervoor is het genomic.gtf bestand van de NCBI website gedownload (GCF_000001405.40) (Homo Sapiens Genome Assembly GRCh38.P14 - NCBI - NLM, n.d.). (bekijk script).
Met DESeq2 worden statistisch significante genen geanalyseerd die differentiaal tot expressie komen en gevisualiseerd met een volcano plot. (bekijk script).

Om te bepalen welke biologische processen betrokken zijn bij een veranderde genexpressie wordt er een GO-analyse uitgevoerd met goseq() en GO.dp. (Bekijk GO-analyse script). Met deze resultaten kan er met pathview de bijbehorende pathways bekeken worden van genen met een fold change van <-2 en >2 en een P-waarde van <0.05. (bekijk script van de KEGG-analyse)

