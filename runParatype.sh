#!/bin/bash
#
# Run Paratype on multiple files.
#
# Zoe Dyson zoe.dyson(at)lshtm.ac.uk
# 27/02/2023
# Example usage 'bash runParatype  > runParatypeLog.txt'
#
# Loop through accessions in file
while read file;
 # run paratype on each accession
 do python3 ~/software/Paratype/paratype.py --id $file --mode fastq --fastq ../reads/${file}/${file}_1.fastq.gz ../reads/${file}/${file}_2.fastq.gz --output ${file}_paratype.txt
# get accesion numbers from file 'ids.txt'
done<../ids.txt
