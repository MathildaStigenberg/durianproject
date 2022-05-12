#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 2:00:00
#SBATCH -J 11_braker
#SBATCH -o braker.output
#SBATCH --mail-type=ALL
#SBATCH --mail-user mathilda.stigenberg.5156@student.uu.se

# Load modules
module load bioinfo-tools
module load samtools/1.8
module load braker/2.1.1_Perl5.24.1
module load augustus/3.2.3_Perl5.24.1
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0
module load GeneMark/4.33-es_Perl5.24.1

# Your commands
cd /home/mathi/genome_analysis/durianproject/analyses/11_braker_annotation 

/sw/bioinfo/braker/2.1.1/snowy/braker.pl --species durio_zibethinus --genome /home/mathi/genome_analysis/durianproject/analyses/9_repeatmasker/pilon.fasta.masked --bam /home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040092_scaffold_10_mappedAligned.sortedByCoord.out.bam,/home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040093_scaffold_10_mappedAligned.sortedByCoord.out.bam,/home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040094_scaffold_10_mappedAligned.sortedByCoord.out.bam,/home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040095_scaffold_10_P_mappedAligned.sortedByCoord.out.bam,/home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040095_scaffold_10_U_mappedAligned.sortedByCoord.out.bam,/home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040096_scaffold_10_mappedAligned.sortedByCoord.out.bam,/home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6040097_scaffold_10_mappedAligned.sortedByCoord.out.bam,/home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6156066_scaffold_10_mappedAligned.sortedByCoord.out.bam,/home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6156067_scaffold_10_mappedAligned.sortedByCoord.out.bam,/home/mathi/genome_analysis/durianproject/analyses/10_star_mapping/SRR6156069_scaffold_10_mappedAligned.sortedByCoord.out.bam --cores 8 --useexisting --AUGUSTUS_CONFIG_PATH=/home/mathi/genome_analysis/durianproject/analyses/11_braker_annotation/augustus_config --AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin --AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts --GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy --gff3 



 



