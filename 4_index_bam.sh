#!/usr/bin/env bash

#SBATCH -J ${file}
#SBATCH --time=01:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=cesar.sierra@epfl.ch
#SBATCH --export=ALL
#SBATCH --nodes=1 --ntasks-per-node=24
#SBATCH --signal=2
#SBATCH --no-requeue
#SBATCH --mem=80GB
#SBATCH --output=/scratch/csierra/CRG/RNA_N/slurm_logs/%x_%j.out

module load samtools/1.19.2

samtools index dedup_bam/${file}_dedup.bam

