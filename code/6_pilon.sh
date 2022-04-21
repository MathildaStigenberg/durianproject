#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 3:00:00
#SBATCH -J 6_pilon
#SBATCH -o pilon.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load Pilon/1.24

# Your commands

java -jar $PILON_HOME/pilon.jar --genome /home/mathi/genome_analysis/durianproject/analyses/2_assembly/ass_pb.contigs.fasta --bam /home/mathi/genome_analysis/durianproject/analyses/5_mapping_bwa/aln_seq_bwa.bam --outdir /home/mathi/genome_analysis/durianproject/analyses/6_improvement_pilon --threads 2
