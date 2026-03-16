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

SAM_DIR=/software/bi/el7.2/version/samtools/samtools-1.10

echo $fpref
echo $ibam
echo ${bed_file}

# Split bam files in two
#-b Output in the BAM format
#-u uncompressed bam
#-L FILE Only output alignments overlapping the input BED FILE
#-U FILE Write alignments that are not selected by the various filter options to FILE. 
#When -U option is used, all alignments intersecting the regions specified are written 
#to either the output file or this file, but never both
#lgmSeq is offline  	

$SAM_DIR/samtools view -bu -@ 4 -h -L ${bed_file} -U ${fpref}_noregion.bam ${ibam} > ${fpref}_region.bam

# subsample region.bam
$SAM_DIR/samtools view -s 123.6666666 -bu -h -@ 4 ${fpref}_region.bam -o ${fpref}_region_subsample.bam
	
# concatenate both files
$SAM_DIR/samtools cat -o ${fpref}_tmp.bam ${fpref}_noregion.bam ${fpref}_region_subsample.bam 

# sort final file by leftmost coordinate
$SAM_DIR/samtools sort -@ 4 -o ${fpref}_corrected.bam ${fpref}_tmp.bam 

