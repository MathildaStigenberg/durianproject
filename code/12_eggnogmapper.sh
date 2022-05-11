#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 12:00:00
#SBATCH -J 12_eggnogmapper
#SBATCH -o eggnogmapper.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load eggNOG-mapper/2.1.5

# Your commands
/sw/bioinfo/eggNOG-mapper/2.1.5/snowy/bin/emapper.py -i /home/mathi/genome_analysis/durianproject/analyses/9_repeatmasker/pilon.fasta.masked --itype genome -o functional_annotation --output_dir /home/mathi/genome_analysis/durianproject/analyses/12_eggnog_annotation --cpu 4 
