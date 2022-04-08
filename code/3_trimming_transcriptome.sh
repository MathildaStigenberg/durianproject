#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:00:00
#SBATCH -J 2_trim_transcript
#SBATCH -o trimming_transcriptome.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load trimmomatic/0.39
# Your commands

trimmomatic PE -threads 2 /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/untrimmed/SRR6040095_scaffold_10.1.fastq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/untrimmed/SRR6040095_scaffold_10.2.fastq.gz -baseout /home/mathi/genome_analysis/durianproject/analyses/3_trim/3_trim_transcript/SRR6040095_scaffold_10.fq.gz ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/snowy/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
