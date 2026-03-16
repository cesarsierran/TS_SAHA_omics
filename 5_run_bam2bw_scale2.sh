#!/usr/bin/env bash

#SBATCH -J ${file}
#SBATCH --time=10:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=cesar.sierra@epfl.ch
#SBATCH --export=ALL
#SBATCH --nodes=1 --ntasks-per-node=48
#SBATCH --signal=2
#SBATCH --no-requeue
#SBATCH --mem=160GB
#SBATCH --output=/scratch/csierra/CRG/RNA_N/slurm_logs/%x_%j.out

module load py-deeptools/3.5.1

bamCoverage -b dedup_bam/$file*dedup.bam -o bw/${file}.bw \
    --binSize 10 \
    --normalizeUsing RPKM \
    --effectiveGenomeSize 2150570000 \
    --ignoreForNormalization chrX \
    --extendReads
