#!/bin/bash
#
# Run Paratype on multiple files.
#
# Zoe Dyson zoe.dyson(at)lshtm.ac.uk
# Updated for Sanger cluster 04/10/23
# Example usage 'bash runParatype  > runParatypeLog.txt'
#
# Load modules
module purge
module load bsub.py
module load bowtie2/2.3.5--py37he860b03_0
module load bcftools/1.9--h68d8f2e_9
module load samtools/1.9--h91753b0_8

# Activate python3 env with bio
source /data/pam/typhinet/scratch/zd2/2023_TyphiNET_ParatyphiA/tgc_data/paratyphi_a/datasets/Silva_medrixiv_2023/paratype/my_project/bin/activate

# Loop through accessions in file
while read file;
 # run paratype on each accession
 do bsub -E 'test -e /nfs/users/nfs_z/zd2' -R "select[mem>16000] rusage[mem=16000]" -M16000 -o ${file}.o -e ${file}.e -J $file -n8 python3 /data/pam/typhinet/scratch/zd2/2023_TyphiNET_ParatyphiA/software/Paratype/paratype.py --id $file --mode fastq --fastq ../reads/${file}/${file}_1.fastq.gz ../reads/${file}/${file}_2.fastq.gz --threads 8 --output ${file}_paratype.txt
# get accesion numbers from file 'ids.txt'
done<../ids.txt
