#!/bin/bash
#
# Run ARIBA on multiple read sets using the
# PlasmidFinder database and a file with one data accession per line
# Zoe Dyson zoe.dyson(at)lshtm.ac.uk
# 02/03/2023
# Example usage 'bash runAribaPlasmidFinder.sh > runAribaPlasmidFinderLog.txt'
#
# Loop through accessions in file
while read file;
 # run ariba on each read set with the card database
 do ariba run /home/ubuntu/databases/ariba/plasmidfinder/plasmidfinder.out ../reads/$file/${file}_1.fastq.gz ../reads/$file/${file}_2.fastq.gz ${file} --threads 1
# get accessions from file 'ids.txt'
done<../ids.txt
