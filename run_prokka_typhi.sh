for file in *.fasta*; do prokka --outdir ${file%.*}_prokka --locustag ${file%.*}_ --genus Salmonella --species enterica --usegenus --proteins Typhi_CT18.faa $file; done
