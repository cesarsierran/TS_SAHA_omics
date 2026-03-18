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

echo $ibam
echo $pref
echo $dir

module load Singularity/3.2.1

singularity exec -e src/macs2_latest.sif macs2 callpeak -t $ibam -f BAMPE -g mm --outdir . -n ${pref} -q 0.05 --extsize 200 --nomodel &> nohup_${pref}.out

