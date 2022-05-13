#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 5:00:00
#SBATCH -J 13_htseq
#SBATCH -o htseq.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load htseq/0.12.4

# Your commands

cd /home/mathi/genome_analysis/durianproject/analyses/13_htseq_countfeatures

for x in /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/*.bam
do
	htseq-count -f bam -r pos -i ID -n 8 -o count -c ${x%%.*}_counted $x /home/mathi/genome_analysis/durianproject/analyses/11_braker_annotation/braker/durio_zibethinus/augustus.hints.gff3 
done
