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

echo ${file}
singularity exec --cleanenv ../src_csn/gatk-4.2.0.0.simg /gatk/gatk MarkDuplicates \
                INPUT=${file}sorted.bam \
                OUTPUT=${file}_dedup.bam \
                ASSUME_SORTED=true \
                REMOVE_DUPLICATES=true \
                METRICS_FILE=${file}.metrics.txt \
                VALIDATION_STRINGENCY=LENIENT

