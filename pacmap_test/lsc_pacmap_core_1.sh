#!/bin/bash
#SBATCH --job-name=lsc_sample_pacmap_mix_core_1
#SBATCH --time=02:00:00
#SBATCH --partition=plgrid
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=64G
#SBATCH --nodes 1
#SBATCH --ntasks-per-node=1 
#SBATCH --account=plglscclass24-cpu
#SBATCH --output=lsc_sample_pacmap_mix_core_1.txt


PYTHON_EXEC="/net/ascratch/people/plgadabd/.conda/envs/ab_env_test/bin/python"

SAMPLE_SIZES=(100 1000 10000 100000 500000 1000000 2000000)

for SAMPLE_SIZE in "${SAMPLE_SIZES[@]}"; do
    echo "====================="
    echo "PACMAP - $SAMPLE_SIZE"
    $PYTHON_EXEC lsc_pacmap.py $SAMPLE_SIZE
done