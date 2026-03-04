for file in *.gbk; do seqretsplit -sequence $file -feature Y -firstonly -outseq ${file%.*}_chrom.gbk -osformat2 genbank; mv 1.genbank ${file%.*}_chrom.gbk; done
