#!/usr/bin/env bash

#SBATCH -J ${file}
#SBATCH --time=24:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=cesar.sierra@epfl.ch
#SBATCH --export=ALL
#SBATCH --nodes=1 --ntasks-per-node=48
#SBATCH --signal=2
#SBATCH --no-requeue
#SBATCH --mem=160GB

cd /nfs/users/mdierssen/csierra/FANS_ATAC_RNA/ATAC/temp/
module load Bowtie2/2.2.9-foss-2016a

##better gunzip outside of script
#gunzip ${file}_trimmed_R*.fastq

bowtie2 -k 5 -X2000 --mm -x /users/mdierssen/csierra/bowtie_indexes/mm10 --threads 16 \
-1 ~/FANS_ATAC_RNA/ATAC/temp/${file}_trimmed_R1.fastq -2 ~/FANS_ATAC_RNA/ATAC/temp/${file}_trimmed_R2.fastq -S ${file}.sam

samtools view -Sb ${file}.sam -o ${file}.bam

rm ${file}.sam

samtools sort -n -f ${file}.bam -o ${file}sorted.bam

flagstat_qc="${file}.flagstat.qc"
samtools view 24Asorted.bam  | SAMstats --sorted_sam_file -  --outf ${flagstat_qc}
 

