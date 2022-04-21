#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00
#SBATCH -J 7_quast
#SBATCH -o quast.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load quast/5.0.2

# Your commands

python /sw/bioinfo/quast/5.0.2/snowy/bin/quast.py -t 2 -o /home/mathi/genome_analysis/durianproject/analyses/7_quality_assessment_quast -e /home/mathi/genome_analysis/durianproject/analyses/6_improvement_pilon/pilon.fasta


