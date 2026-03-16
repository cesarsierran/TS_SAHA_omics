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


source activate rnaseq
export _JAVA_OPTIONS="-Djava.io.tmpdir=./tmp -Xmx6G"

cd /scratch/csierra/CRG/RNA_N

#mkdir qc_qualimap/${file}

qualimap rnaseq -bam alignments_STAR/${file}*.sortedByCoord.out.bam \
	-gtf STAR_index_new/gencode.vM33.primary_assembly.annotation.gtf \
	-outdir qc_qualimap/${file} -p non-strand-specific --java-mem-size=16G
