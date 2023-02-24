# Run ARIBA on multiple read sets using the
# CARD database and a file with one data accession per line
# Zoe Dyson zoe.dyson(at)lshtm.ac.uk
# 24/02/2023
# Example usage 'bash getAribaCard > runAribaCardLog.txt'
#
#!/bin/bash
#
# Loop through accessions in file
while read file;
 # run ariba on each read set with the card database
 do ariba run /home/ubuntu/databases/ariba/card/out.card.prepareref ../reads/$file/${file}_1.fastq.gz ../reads/$file/${file}_2.fastq.gz ${file}.run --threads 1
# get accessions from file 'ids.txt'
done<../ids.txt
