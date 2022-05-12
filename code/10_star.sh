#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 30:00
#SBATCH -J 10_star
#SBATCH -o star.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load star/2.7.9a
module load samtools/1.14

# Your commands

STAR --runThreadN 8 --runMode genomeGenerate --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --genomeFastaFiles /home/mathi/genome_analysis/durianproject/analyses/9_repeatmasker/pilon.fasta.masked

STAR --runThreadN 8 --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --readFilesIn /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040092_scaffold_10.1.fastq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040092_scaffold_10.2.fastq.gz --readFilesCommand zcat --outFileNamePrefix /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040092_scaffold_10_mapped --outSAMtype BAM SortedByCoordinate 

STAR --runThreadN 8 --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --readFilesIn /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040093_scaffold_10.1.fastq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040093_scaffold_10.2.fastq.gz --readFilesCommand zcat --outFileNamePrefix /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040093_scaffold_10_mapped --outSAMtype BAM SortedByCoordinate 

STAR --runThreadN 8 --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --readFilesIn /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040094_scaffold_10.1.fastq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040094_scaffold_10.2.fastq.gz --readFilesCommand zcat  --outFileNamePrefix /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040094_scaffold_10_mapped --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 8 --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --readFilesIn /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040096_scaffold_10.1.fastq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040096_scaffold_10.2.fastq.gz --readFilesCommand zcat  --outFileNamePrefix /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040096_scaffold_10_mapped --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 8 --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --readFilesIn /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040097_scaffold_10.1.fastq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6040097_scaffold_10.2.fastq.gz --readFilesCommand zcat  --outFileNamePrefix /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040097_scaffold_10_mapped --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 8 --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --readFilesIn /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156066_scaffold_10.1.fastq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156066_scaffold_10.2.fastq.gz --readFilesCommand zcat  --outFileNamePrefix /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6156066_scaffold_10_mapped --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 8 --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --readFilesIn /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156067_scaffold_10.1.fastq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156067_scaffold_10.2.fastq.gz --readFilesCommand zcat  --outFileNamePrefix /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6156067_scaffold_10_mapped --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 8 --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --readFilesIn /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156069_scaffold_10.1.fastq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/transcriptome/trimmed/SRR6156069_scaffold_10.2.fastq.gz --readFilesCommand zcat  --outFileNamePrefix /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6156069_scaffold_10_mapped --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 8 --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --readFilesIn /home/mathi/genome_analysis/durianproject/analyses/3_trim/3_trim_transcript/SRR6040095_scaffold_10_1P.fq.gz /home/mathi/genome_analysis/durianproject/analyses/3_trim/3_trim_transcript/SRR6040095_scaffold_10_2P.fq.gz --readFilesCommand zcat  --outFileNamePrefix /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040095_scaffold_10_P_mapped --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 8 --genomeDir /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/10_indexed_genome --readFilesIn /home/mathi/genome_analysis/durianproject/analyses/3_trim/3_trim_transcript/SRR6040095_scaffold_10_1U.fq.gz /home/mathi/genome_analysis/durianproject/analyses/3_trim/3_trim_transcript/SRR6040095_scaffold_10_2U.fq.gz --readFilesCommand zcat  --outFileNamePrefix /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040095_scaffold_10_U_mapped --outSAMtype BAM SortedByCoordinate







 







 
 
