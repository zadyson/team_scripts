#!/bin/bash
#SBATCH --qos=normal
#SBATCH --account=js66
#SBATCH --job-name="vfdb_ariba"
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=24576
#SBATCH --time=100:00:00

module load ariba/2.14.4

# Loop through accessions in file
while read file;
 # run ariba on each read set with the card database
 do ariba run vfdb_core.out ../reads/$file/${file}_1.fastq.gz ../reads/$file/${file}_2.fastq.gz ${file} --threads 1
# get accessions from file 'ids.txt'
done<../ids.txt
