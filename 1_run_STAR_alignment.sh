#!/usr/bin/env bash

#SBATCH -J ${file}
#SBATCH --time=24:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=cesar.sierra@epfl.ch
#SBATCH --export=ALL
#SBATCH --nodes=1 --ntasks-per-node=48
#SBATCH --signal=2
#SBATCH --no-requeue
#SBATCH --mem=160GB


module load star/2.7.11b

cd /scratch/csierra/CRG/RNA_N

STAR --genomeDir STAR_index_new \
      --readFilesIn /scratch/csierra/CRG/RNA_N/fastqs/${file}.read1.fastq.gz /scratch/csierra/CRG/RNA_N/fastqs/${file}.read2.fastq.gz \
      --readFilesCommand zcat \
      --outSAMtype BAM SortedByCoordinate \
      --quantMode GeneCounts \
      --outFileNamePrefix /scratch/csierra/CRG/RNA_N/alignments_STAR/${file}
