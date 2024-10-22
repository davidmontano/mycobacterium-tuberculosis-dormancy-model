# Code for obtaining RNA-seq reads

compressedFastq <- list.files(path="fastq/", pattern="*.fastq.gz$", full.names=TRUE)
for (t in 1:NROW(compressedFastq)) {
    gunzip((compressedFastq[t]), remove=FALSE)
}

allFastq_1 <- list.files(path="fastq/", pattern="*._1.fastq$", full.names=TRUE)
allFastq_2 <- list.files(path="fastq/", pattern="*._2.fastq$", full.names=TRUE)

gunzip("cromosoma/GCF_000195955.2_ASM19595v2_genomic.fna.gz")

# Code for aligning reads to the MTB genome
bowtie2_build("cromosoma1/GCF_000195955.2_ASM19595v2_genomic.fna" , bt2Index = "cromosoma1/mtbee" )
PROJECT <- data.frame(fastq_1 = allFastq_1 , fastq_2 = allFastq_2)
write.table(PROJECT, file="myproject.tsv", sep="\t", row.names=FALSE)
PROJECT  <- read.table("myproject.tsv" , header=TRUE, sep="\t")
dir.create("aligned")
for(t in 1:NROW(PROJECT))
{
   myfq1 <- PROJECT$fastq_1[t]
   myfq2 <- PROJECT$fastq_2[t]
   mysam <- paste0("aligned/" , PROJECT1$conditions[t], "-", PROJECT1$replicate[t], ".sam")
   bowtie2(bt2Index = "cromosoma/mtbee",samOutput = mysam, seq1 = myfq1, seq2=myfq2,  "--threads 3")
   asBam(mysam)
}
data4 <- featureCounts(
                                files = bamFiles,
                            annot.ext = "genes/sequence.gff3",             
                      isGTFAnnotation = TRUE,
                      GTF.featureType = "gene",
                         GTF.attrType = "ID",
                          isPairedEnd = TRUE,
                requireBothEndsMapped = TRUE,
                               minMQS = 20,
                       strandSpecific = 2,
                                                       nthreads = 3
                       )
write.table(data4$counts, file = "raw_counts.tsv", sep =" \t")
