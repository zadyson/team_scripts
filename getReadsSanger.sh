# Downloads multiple read sets from ena using entrez
# using a file with one data accession per line
# Zoe Dyson zoe.dyson(at)lshtm.ac.uk
# Updated for Sanger cluster 04/10/2023
# Example usage 'bash getReads.sh > getReadsLog.txt'
#
#!/bin/bash
#
# Load modules
module load ena-browser-tools/1.6
module load bsub.py/0.42.1
# Loop through accessions in file
while read file;
 # fetch data by accession with enterz and
 # save in fastq format in folder 'reads'
 do bsub.py 1 $file  /data/pam/typhinet/scratch/zd2/2023_TyphiNET_ParatyphiA/software/enaBrowserTools/python3/enaDataGet -f fastq -d reads $file;
    sleep 1
# get accesion numbers from file 'ids.txt'
done<ids.txt
