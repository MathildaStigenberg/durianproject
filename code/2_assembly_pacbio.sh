#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 19:00:00
#SBATCH -J 2_assembly_pacbio_output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load canu/2.2
# Your commands

canu -p -d /home/mathi/genome_analysis/durianproject/analyses/2_assembly genomeSize=42100m corThreads=4 -pacbio-raw SRR6037732_scaffold_06.fq.gz SRR6037732_scaffold_10.fq.gz SRR6037732_scaffold_11.fq.gz
  
