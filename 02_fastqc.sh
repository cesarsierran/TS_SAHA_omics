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

fastqc -o . ${fastq}
