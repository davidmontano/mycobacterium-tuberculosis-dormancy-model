# Code for differential expression analysis between the 17-hour condition sample (with 57.62% OD) and the 0-hour sample (with 81.6% OD)
dds <- DESeqDataSetFromMatrix(data4$counts, colData=PROJECT1, design = ~ conditions)
dds <- DESeq(dds)

res17h.57.62vs0h.81.6 <- results(dds, contrast=c("conditions", "17h.57.6","0h.81.6"))
final_17h.57.62vs0h.81.6 <- data.frame(
                                                         GENEID = row.names(res17h.57.62vs0h.81.6),
                                 log2BaseMean17h.57.62vs0h.81.6 = log2(res17h.57.62vs0h.81.6$baseMean),
                                    los2Ratio17h.57.62vs0h.81.6 = res17h.57.62vs0h.81.6$log2FoldChange, 
                             STDERR_log2Ratio17h.57.62vs0h.81.6 = res17h.57.62vs0h.81.6$lfcSE, 
                                                         pvalue = res17h.57.62vs0h.81.6$pvalue, 
                                                        padjust = res17h.57.62vs0h.81.6$padj,
                                                        assays(dds)$counts
                                                                        )
write.table(final_17h.57.62vs0h.81.6, file="final2_17h.57.62vs0h.81.6.tsv", sep="\t", row.names=FALSE)
