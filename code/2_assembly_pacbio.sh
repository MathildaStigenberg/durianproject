#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 19:00:00
#SBATCH -J 2_assembly_pacbio
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load canu/2.2
# Your commands    

canu -d /home/mathi/genome_analysis/durianproject/analyses/2_assembly -p ass_pb genomeSize=24m useGrid=False corThreads=4 -pacbio /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_10.fq.gz

