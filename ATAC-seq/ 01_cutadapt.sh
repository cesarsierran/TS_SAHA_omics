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

module  load GCCcore/5.4.0
module load binutils/2.26-GCCcore-5.4.0
module load cutadapt/1.9.1-foss-2016a-Python-2.7.11

#sample_info=FANS_ATAC_RNA/ATAC/temp/file_list
#file_list=$(cut -f 1 $sample_info)

#for file in ${file_list}
#do

cutadapt -a CTGTCTCTTATACACATCT -o ~/FANS_ATAC_RNA/ATAC/temp/${file}_trimmed_R1.fastq.gz -p ~/FANS_ATAC_RNA/ATAC/temp/${file}_trimmed_R2.fastq.gz  -m 5 ~/FANS_ATAC_RNA/ATAC/data/${file}_R1.fastq.gz ~/FANS_ATAC_RNA/ATAC/data/${file}_R2.fastq.gz 1>${file}.log 

gzip ~/FANS_ATAC_RNA/ATAC/temp/${file}_trimmed_R*.fastq.gz

#done
