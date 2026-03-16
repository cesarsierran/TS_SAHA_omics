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

module load star/2.7.11b

cd /scratch/csierra/CRG/RNA_N/STAR_index_new
echo "Current working directory: $(pwd)"

STAR --runMode genomeGenerate --genomeDir . \
            --genomeFastaFiles GRCm39.primary_assembly.genome.fa \
            --sjdbGTFfile gencode.vM33.primary_assembly.annotation.gtf \
            --sjdbOverhang 50 --outFileNamePrefix GRCm39
            
