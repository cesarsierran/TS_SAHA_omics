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

# prefix for output
pref=`basename $ibam .bam`

SAM_DIR=/software/bi/el7.2/version/samtools/samtools-1.10

# Convert BAM to bedGraph
# The input file is in BAM format. Note: BAM must be sorted by position (we did it in the end of previous step)
# -bg Report depth in BedGraph format.
# -split Treat “split” BAM entries as distinct BED intervals when computing coverage. 
# For BAM files, this uses the CIGAR “N” and “D” operations to infer the blocks for computing coverage. 
# -pc Calculates coverage for paired-end reads, coverage is calculated as the number of fragments covering each base pair

bedtools genomecov -bg -split -pc -ibam $ibam -g $chrfile | grep -v -P "_|GL|KI|JH" > ${pref}.bedGraph

# slopBed will adjust coordinates to chromosome sizes
bedtools slop -i ${pref}.bedGraph -g $chrfile  -b 0  > ${pref}_tmp.bedGraph

# convertion of bedGraph to bigWig format
LC_COLLATE=C sort -S 50G -k1,1 -k2,2n ${pref}_tmp.bedGraph > ${pref}_sorted.bedGraph

# remove lines with less than expected 4 columns
awk 'NF>=4' ${pref}_sorted.bedGraph > ${pref}_sorted_cleaned.bedGraph

bedGraphToBigWig ${pref}_sorted_cleaned.bedGraph mm10_chrfile_ucsc.txt ${pref}.bw


