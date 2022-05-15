### This is a README-file concerning paper 4, the one about the durian fruit. The durian fruit is analyzed 
### by assembling its genome, doing annotation and expression analysis. The pipeline for doing these analyses
### is explained below so one can remake this project and follow the correct order when running the scripts. 

#### FastQC

FastQC is used for doing a quality check on the raw data.

This can be done in the interactive session by writing the commands below.

``` 
module load bioinfo-tools FastQC/0.11.9
fastqc -o /home/mathi/genome_analysis/durianproject/analyses/1_fastqc_illumina/ -t 2 *.fastq.gz
fastqc -o /home/mathi/genome_analysis/durianproject/analyses/2_fastqc_pacbio/ -t 2 *.fq.gz
fastqc -o /home/mathi/genome_analysis/durianproject/analyses/3_fastqc_transcriptome/trimmed/ -t 2 *.fastq.gz
fastqc -o /home/mathi/genome_analysis/durianproject/analyses/3_fastqc_transcriptome/untrimmed/ -t 2 *.fastq.gz
```

If one is following this pipeline, one can of course choose their own output directory where to store the results.  

#### MultiQC

MultiQC is used for combining the results from FastQC into one summary report.

The script for doing this is called 8_multiqc.sh and can be found in the directory:
/home/mathi/genome_analysis/durianproject/code

#### CANU

CANU is used for assemble a genome with reads as input.

The script for doing this is called 2_assembly_pacbio.sh and can be found in the directory:
/home/mathi/genome_analysis/durianproject/code 

#### Trimmomatic

Trimmomatic is used for trimming untrimmed transcriptomic reads.

The script for doing this is called 3_trimming_transcriptome.sh and can be found in the directory: 
/home/mathi/genome_analysis/durianproject/code

Therafter, a quality report can be obtained for this newly trimmed data by doing this command below
in the interactive session.

```
module load bioinfo-tools FastQC/0.11.9
fastqc -o /home/mathi/genome_analysis/durianproject/analyses/4_fastqc/4_fastqc_transcriptome_trimmed/ -t 2 *.fq.gz 
``` 

#### BWA

BWA is used for mapping illumina reads against the assembled genome.

The script for doing this is called 5_mapping_bwa.sh and can be found in the directory: 
/home/mathi/genome_analysis/durianproject/code 

#### Pilon

Pilon is used for correcting the assembly.

The script for doing this is called 6_pilon.sh and can be found in the directory:
/home/mathi/genome_analysis/durianproject/code 

#### QUAST

QUAST is used for doing a quality check on the assembled genome.

The script for doing this is called 7_quast.sh and can be found in the directory:
/home/mathi/genome_analysis/durianproject/code 

#### RepeatMasker

RepeatMasker is used for masking the repeats in the genome. 

The script for doing this is called 9_repeatmasker.sh and can be found in the directory:
/home/mathi/genome_analysis/durianproject/code

#### Star

Star is used for mapping the trimmed transcriptomic reads to the assembled masked genome. 

The script for doing this is called 10_star.sh and can be found in the directory:
/home/mathi/genome_analysis/durianproject/code

#### BRAKER

BRAKER is used for doing a structural annotation of the genome.

The script for doing this is called 11_braker.sh and can be found in the directory:
/home/mathi/genome_analysis/durianproject/code

However, before running the script one needs to run the following commands below.

```
module load bioinfo-tools
module load augustus/20200915-ed0cb90

source $AUGUSTUS_CONFIG_COPY

chmod a+w -R /home/mathi/genome_analysis/durianproject/analyses/11_braker_annotation/augustus_config/species/
cp -vf /sw/bioinfo/GeneMark/4.33-es/snowy/gm_key $HOME/.gm_key 
```

#### EggNOGmapper

EggNOGmapper is used for doing a functional annotation of the genome. 

The script for doing this is called 12_eggnogmapper.sh and can be found in the directory:
/home/mathi/genome_analysis/durianproject/code

#### HTseq

HTseq is used for expression analysis by counting how many genes each transcriptomic read map to. 

The script for doing this is called 13_htseq.sh and can be found in the directory:
/home/mathi/genome_analysis/durianproject/code

#### DESeq2

DESeq2 is used for doing expression analysis on the genome. 

The script for doing this is called 14_deseq2.r and can be found in the directory:
/home/mathi/genome_analysis/durianproject/code

However, it is best to run this script in Rstudio and running these commands below before
running the script, in order to install the package DESeq2.

```
if (!require("BiocManager", quietly = TRUE))
	install.packages("BiocManager")
BiocManager::install("DESeq2")     
```
