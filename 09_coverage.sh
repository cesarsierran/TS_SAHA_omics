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

module load SAMtools/1.10-GCC-9.3.0

#region=chr16:84M-98M
#region=chr17:3M-10M
#region=chr2:84M-98M
region=chr2:3M-10M

#for i in /nfs/users/mdierssen/csierra/FANS_ATAC_RNA/ATAC/bams/shifted_coords/25A*.bam
for i in /nfs/users/mdierssen/csierra/FANS_ATAC_RNA/ATAC/bams/shifted_coords/38A_lib_01902AAC_GCGTAG_*bam 
do
echo `basename $i _shift.bam` >> ${i}coverage_${region}.txt
if [ ! -f $i.bai ]; then
    samtools index $i
fi
samtools coverage -r ${region} $i >> ${i}coverage_${region}.txt
done
