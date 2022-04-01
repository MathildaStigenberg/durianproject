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
  
canu -d /home/mathi/genome_analysis/durianproject/analyses/2_assembly -p canu genomeSize=738m corThreads=4 stopOnLowCoverage=7 minInputCoverage=7 gridOptions="-A uppmax2022-2-5 -M snowy" -trimmed -corrected -pacbio /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_06.fq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_10.fq.gz /home/mathi/genome_analysis/durianproject/4_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_11.fq.gz 
