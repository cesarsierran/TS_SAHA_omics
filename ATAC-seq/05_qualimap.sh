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

# qualimap rnaseq module on ChIP-seq data to check proportion of reads falling in exons, introns etc.
/software/bi/el7.2/version/qualimap/qualimap_v2.2.1/qualimap rnaseq -bam ${inbam} \
        -gtf ${ingtf} \
        -outdir ${outd} \
        -outformat PDF:HTML \
        --java-mem-size=20G \
        -p non-strand-specific

