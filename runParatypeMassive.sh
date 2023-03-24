#!/bin/bash
#SBATCH --qos=normal
#SBATCH --account=js66
#SBATCH --job-name="paratype"
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=24576
#SBATCH --time=100:00:00

module load python/3.6.2-static
module load bcftools
module load bowtie2

while read file
  do python3 ./Paratype/paratype.py --id $file --mode fastq --fastq ../reads/${file}/${file}_1.fastq.gz ../reads/${file}/${file}_2.fastq.gz --output ${file}_paratype.txt
done<../ids.txt
