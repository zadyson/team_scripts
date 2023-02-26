#!/bin/bash
#
# Downloads multiple read sets from ena using entrez
# using a file with one data accession per line. Won't 
# overwrite data if some accessions/files fail.
# Zoe Dyson zoe.dyson(at)lshtm.ac.uk
# 24/02/2023
# Example usage 'bash getReads.sh > getReadsLog.txt'
#
# Loop through accessions in file
while read file;
 # fetch data by accession with enterz and
 # save in fastq format in folder 'reads'
 do enaDataGet -f fastq -d reads $file;
# get accesion numbers from file 'ids.txt'
done<ids.txt
