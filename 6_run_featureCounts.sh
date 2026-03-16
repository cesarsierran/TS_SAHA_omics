#!/usr/bin/env bash

#SBATCH -J ${file}
#SBATCH --time=06:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=cesar.sierra@epfl.ch
#SBATCH --export=ALL
#SBATCH --nodes=1 --ntasks-per-node=48
#SBATCH --signal=2
#SBATCH --no-requeue
#SBATCH --mem=80GB
#SBATCH --output=/scratch/csierra/CRG/RNA_N/slurm_logs/%x_%j.out

source activate rnaseq

featureCounts \
      -t gene \
      -g gene_id \
      --primary \
      -p \
      -C \
      -a STAR_index_new/gencode.vM33.primary_assembly.annotation.gtf \
      -o counts/${file}.featureCounts \
      dedup_bam/${file}_dedup.bam
