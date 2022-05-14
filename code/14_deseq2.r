# load packages
library("DESeq2")
library("gplots")
library("RColorBrewer")
library("genefilter")

#Read in read counts
SRR6040092 <- read.delim('C:/Users/Mathilda Stigenberg/Dropbox/Uppsala/genomeanalysis/htseq_files/SRR6040092_scaffold_10_mappedAligned_counted', header=FALSE);
colnames(SRR6040092)=c('gene', 'SRR6040092')
SRR6040093 <- read.delim('C:/Users/Mathilda Stigenberg/Dropbox/Uppsala/genomeanalysis/htseq_files/SRR6040093_scaffold_10_mappedAligned_counted', header=FALSE);
colnames(SRR6040093)=c('gene', 'SRR6040093')
SRR6040094 <- read.delim('C:/Users/Mathilda Stigenberg/Dropbox/Uppsala/genomeanalysis/htseq_files/SRR6040094_scaffold_10_mappedAligned_counted', header=FALSE);
colnames(SRR6040094)=c('gene', 'SRR6040094')
SRR6040096 <- read.delim('C:/Users/Mathilda Stigenberg/Dropbox/Uppsala/genomeanalysis/htseq_files/SRR6040096_scaffold_10_mappedAligned_counted', header=FALSE);
colnames(SRR6040096)=c('gene', 'SRR6040096')
SRR6040097 <- read.delim('C:/Users/Mathilda Stigenberg/Dropbox/Uppsala/genomeanalysis/htseq_files/SRR6040097_scaffold_10_mappedAligned_counted', header=FALSE);
colnames(SRR6040097)=c('gene', 'SRR6040097')
SRR6156066 <- read.delim('C:/Users/Mathilda Stigenberg/Dropbox/Uppsala/genomeanalysis/htseq_files/SRR6156066_scaffold_10_mappedAligned_counted', header=FALSE);
colnames(SRR6156066)=c('gene', 'SRR6156066')
SRR6156067 <- read.delim('C:/Users/Mathilda Stigenberg/Dropbox/Uppsala/genomeanalysis/htseq_files/SRR6156067_scaffold_10_mappedAligned_counted', header=FALSE);
colnames(SRR6156067)=c('gene', 'SRR6156067')
SRR6156069 <- read.delim('C:/Users/Mathilda Stigenberg/Dropbox/Uppsala/genomeanalysis/htseq_files/SRR6156069_scaffold_10_mappedAligned_counted', header=FALSE);
colnames(SRR6156069)=c('gene', 'SRR6156069')
SRR6040095_P <- read.delim('C:/Users/Mathilda Stigenberg/Dropbox/Uppsala/genomeanalysis/htseq_files/SRR6040095_scaffold_10_P_mappedAligned_counted', header=FALSE);
colnames(SRR6040095_P)=c('gene', 'SRR6040095_P')
SRR6040095_U <- read.delim('C:/Users/Mathilda Stigenberg/Dropbox/Uppsala/genomeanalysis/htseq_files/SRR6040095_scaffold_10_U_mappedAligned_counted', header=FALSE);
colnames(SRR6040095_U)=c('gene', 'SRR6040095_U')

#Merging count read data into one matrix
table_gene_counts <- merge(merge(merge(merge(merge(merge(merge(merge(merge(SRR6040092, SRR6040093, by="gene", all.x=TRUE, all.y=TRUE), SRR6040094, by="gene", all.x=TRUE, all.y=TRUE), SRR6040096, by="gene", all.x=TRUE, all.y=TRUE), SRR6040097,by="gene", all.x=TRUE, all.y=TRUE), SRR6156066, by="gene", all.x=TRUE, all.y=TRUE), SRR6156067, by="gene", all.x=TRUE, all.y=TRUE), SRR6156069, by="gene", all.x=TRUE, all.y=TRUE), SRR6040095_P, by="gene", all.x=TRUE, all.y=TRUE), SRR6040095_U, by="gene", all.x=TRUE, all.y=TRUE)  

#Converting to a deseq friendly format
gene_names <- table_gene_counts$gene
sample_index <- grepl("SRR\\d+", colnames(table_gene_counts))
matrix_deseq <- as.matrix(table_gene_counts[,sample_index])
rownames(matrix_deseq) <- gene_names

#Creating matrix with tissue type
SRR <- c('SRR6040092', 'SRR6040093', 'SRR6040094', 'SRR6040096', 'SRR6040097', 'SRR6156066', 'SRR6156067', 'SRR6156069', 'SRR6040095_P', 'SRR6040095_U');
tis_type <- c('leaf', 'root', 'aril_mk', 'stem', 'aril_mk', 'aril_mon', 'aril_mon', 'aril_mon', 'aril_mk', 'aril_mk');
tissues <- data.frame(tis_type)

#Converting to a deseq friendly format
rownames(tissues) <- c(SRR)

deseq2_data <- DESeqDataSetFromMatrix(countData=matrix_deseq, colData=tissues, design= ~ tis_type)

as.data.frame(colData(deseq2_data))
dds <- DESeq(deseq2_data)

# Regularized-logarithm transform
rld <- rlog(dds)

#PCA
dev.off()
print(plotPCA(rld, intgroup=c("tis_type")))

#Heat map with gene clustering
dev.off()
topVarGenes <- head(order(rowVars(assay(rld)), decreasing=TRUE), 10)
heatmap.2(assay(rld)[topVarGenes, ], scale="row", trace="none", dendogram="column", margins=c(8,8), col=colorRampPalette(rev(brewer.pal(9, "RdBu")))(255))


