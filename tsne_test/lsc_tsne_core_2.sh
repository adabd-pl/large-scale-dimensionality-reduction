#!/bin/bash
#SBATCH --job-name=lsc_sample_tsne_mix_core_2
#SBATCH --time=02:00:00
#SBATCH --partition=plgrid
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=32G
#SBATCH --nodes 1
#SBATCH --ntasks-per-node=1 
#SBATCH --account=plglscclass24-cpu
#SBATCH --output=lsc_sample_tsne_mix_core_2.txt


PYTHON_EXEC="/net/ascratch/people/plgadabd/.conda/envs/ab_env_test/bin/python"

SAMPLE_SIZES=(100 1000 10000 100000 500000 1000000 2000000)

for SAMPLE_SIZE in "${SAMPLE_SIZES[@]}"; do
    echo "====================="
    echo "TSNE - $SAMPLE_SIZE"
    $PYTHON_EXEC lsc_tsne.py $SAMPLE_SIZE
done