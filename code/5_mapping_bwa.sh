#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:30:00
#SBATCH -J 5_mapping_bwa
#SBATCH -o mapping_bwa.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa/0.7.17
module load samtools/1.14

# Your commands

bwa index /home/mathi/genome_analysis/durianproject/analyses/2_assembly/ass_pb.contigs.fasta 

bwa mem -t 2 /home/mathi/genome_analysis/durianproject/analyses/2_assembly/ass_pb.contigs.fasta /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_10.1P.fastq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/illumina_data/SRR6058604_scaffold_10.2P.fastq.gz > /home/mathi/genome_analysis/durianproject/analyses/5_mapping_bwa/aln_seq_bwa.sam

samtools sort /home/mathi/genome_analysis/durianproject/analyses/5_mapping_bwa/aln_seq_bwa.sam -o /home/mathi/genome_analysis/durianproject/analyses/5_mapping_bwa/aln_seq_bwa.bam

samtools index /home/mathi/genome_analysis/durianproject/analyses/5_mapping_bwa/aln_seq_bwa.bam /home/mathi/genome_analysis/durianproject/analyses/5_mapping_bwa/aln_seq_bwa.bai 

 


