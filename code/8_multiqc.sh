#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00
#SBATCH -J 8_multiqc
#SBATCH -o multiqc.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load MultiQC/1.12

# Your commands

multiqc /home/mathi/genome_analysis/durianproject/analyses/1_fastqc/1_fastqc_illumina/*10* -o /home/mathi/genome_analysis/durianproject/analyses/8_multiqc/8_multiqc_illumina

multiqc /home/mathi/genome_analysis/durianproject/analyses/1_fastqc/1_fastqc_pacbio/*10* -o /home/mathi/genome_analysis/durianproject/analyses/8_multiqc/8_multiqc_pacbio

multiqc /home/mathi/genome_analysis/durianproject/analyses/1_fastqc/1_fastqc_transcriptome/trimmed/*10* -o /home/mathi/genome_analysis/durianproject/analyses/8_multiqc/8_multiqc_transcriptome/8_trimmed

multiqc /home/mathi/genome_analysis/durianproject/analyses/1_fastqc/1_fastqc_transcriptome/untrimmed/*10* -o /home/mathi/genome_analysis/durianproject/analyses/8_multiqc/8_multiqc_transcriptome/8_untrimmed

multiqc /home/mathi/genome_analysis/durianproject/analyses/4_fastqc/4_fastqc_transcriptome_trimmed/*10* -o /home/mathi/genome_analysis/durianproject/analyses/8_multiqc/8_multiqc_transcriptome/8_untrimmed_is_trimmed 


