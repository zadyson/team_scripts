#!/bin/bash
#
# Run ARIBA on multiple read sets using the
# CARD database and a file with one data accession per line
# Zoe Dyson zoe.dyson(at)lshtm.ac.uk
# 20/10/2023
#

# Load modules for Sanger cluster
module purge
module load bsub.py
module load ariba/release-v2.14.6 # same version as on CLIMB (sept 2020 release)

# Loop through accessions in file
while read file;
 # run ariba on each read set with the card database
 do bsub.py 1 $file ariba run /lustre/scratch125/pam/projects/typhinet/zd2/2023_TyphiNET_ParatyphiA/databases/ariba/plasmidfinder/plasmidfinder.out ../reads/$file/${file}_1.fastq.gz ../reads/$file/${file}_2.fastq.gz ${file} --threads 1
# get accessions from file 'ids.txt'
done<../ids.txt
