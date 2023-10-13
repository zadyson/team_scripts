# Run GenoTyphi Mykrobe
# Zoe Dyson zoe.dyson(at)lshtm.ac.uk
# Updated 13/10/23
# Example usage 'bash runGenoTyphiMykrobeSanger.sh'
#
#!/bin/bash
#
# Load modules
module load bsub.py

# Iteratre through PE fastq files
for fastqs in  /nfs/users/nfs_z/zd2/paratyphi/tgc_data/typhi/Balaji_GenoTyphi/reads/*/*_1.fastq.gz
do
  # Submit 1 job per genome
  bsub.py 1 mykrobe mykrobe predict --sample $(basename -- $fastqs "_1.fastq.gz") --species typhi --format json --out $(basename -- $fastqs "_1.fastq.gz").json --seq /nfs/users/nfs_z/zd2/paratyphi/tgc_data/typhi/Balaji_GenoTyphi/reads/$(basename -- $fastqs "_1.fastq.gz")/$(basename -- $fastqs) /nfs/users/nfs_z/zd2/paratyphi/tgc_data/typhi/Balaji_GenoTyphi/reads/$(basename -- $fastqs "_1.fastq.gz")/$(basename -- $fastqs "_1.fastq.gz")_2.fastq.gz
  # Sleep/pause for 1 second between job submissions
  sleep 1
done
