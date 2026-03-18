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

fpref=`basename $ibam _dedup.bam`
SAM_DIR=/software/bi/el7.2/version/samtools/samtools-1.10

echo $fpref

# Remove multi-mapped reads (i.e. those with MAPQ < 30 [for Bowtie2], using -q in SAMtools)
$SAM_DIR/samtools view -h -q 30 -@ 1 $ibam > ${fpref}_rm_multi.bam

# Remove reads unmapped, mate unmapped, not primary alignment, reads failing platform, duplicates (-F 1804)
# Retain properly paired reads -f 2
$SAM_DIR/samtools view -h -@ 1 -b -F 1804 -f 2 ${fpref}_rm_multi.bam > ${fpref}_filtered.bam

