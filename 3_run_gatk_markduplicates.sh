#!/usr/bin/env bash

#SBATCH -J ${file}
#SBATCH --time=12:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=cesar.sierra@epfl.ch
#SBATCH --export=ALL
#SBATCH --nodes=1 --ntasks-per-node=48
#SBATCH --signal=2
#SBATCH --no-requeue
#SBATCH --mem=160GB
#SBATCH --output=/scratch/csierra/CRG/RNA_N/slurm_logs/%x_%j.out

#name=`basename $bam _X2000_sort.bam`
echo ${file}
singularity exec --cleanenv gatk-4.2.0.0.simg /gatk/gatk MarkDuplicates \
                INPUT=alignments_STAR/${file}Aligned.sortedByCoord.out.bam \
                OUTPUT=dedup_bam/${file}_dedup.bam \
                ASSUME_SORTED=true \
                REMOVE_DUPLICATES=true \
                METRICS_FILE=${file}.metrics.txt \
                VALIDATION_STRINGENCY=LENIENT

