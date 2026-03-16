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

module load SAMtools/1.10-GCC-9.3.0
#fpref=`basename $ibam .nodup.bam`
#SAM_DIR=/software/bi/el7.2/version/samtools/samtools-1.10

#echo $fpref

# Extract forward reads and add +4bp to their mapping coordinates
samtools view -h -@ 4 -F 16 ${file}.nodup.bam | \
	awk '{if ($0 ~ /^@/) {print $0} else {$4=$4+4; $8=$8+4; print} }' OFS="\t" | \
	samtools view -h -@ 4 -b -o ${file}_F16_tmp.bam

# Extract reverse reads and subtract -5bp to their mapping coordinates
samtools view -h -@ 4 -f 16 ${file}.nodup.bam | \
	awk '{if ($0 ~ /^@/) {print $0} else {$4=$4-5; $8=$8-5; print} }' OFS="\t" | \
	samtools view -h -@ 4 -b -o ${file}_f16_tmp.bam
	
# concatenate both files
samtools cat -o ${file}_tmp.bam ${file}_F16_tmp.bam ${file}_f16_tmp.bam

# sort final file
samtools sort -@ 4 -o ${file}_shift.bam ${file}_tmp.bam

# remove temporary files
#rm *_tmp.bam


