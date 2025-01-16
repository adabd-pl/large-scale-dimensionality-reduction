#!/bin/bash
#SBATCH --job-name=100k_dim_mix_core_1
#SBATCH --time=01:00:00
#SBATCH --partition=plgrid-now
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=90G
#SBATCH --nodes 1
#SBATCH --ntasks-per-node=1 
#SBATCH --account=plglscclass24-cpu
#SBATCH --output=100k_dim_mix_core_1.txt


PYTHON_EXEC="/net/ascratch/people/plgadabd/.conda/envs/ab_env_test/bin/python"


SAMPLE_SIZES=(100000)
DIMENSIONS=(10 20 50 100 200 400)


for SAMPLE_SIZE in "${SAMPLE_SIZES[@]}"; do
    for DIMENSION in "${DIMENSIONS[@]}"; do
        echo "====================="
        echo "PCA - SAMPLE_SIZE: $SAMPLE_SIZE, DIMENSIONS: $DIMENSION"
        $PYTHON_EXEC pca.py $SAMPLE_SIZE $DIMENSION

	echo "====================="
        echo "PACMAP - SAMPLE_SIZE: $SAMPLE_SIZE, DIMENSIONS: $DIMENSION"
        $PYTHON_EXEC pacmap.py $SAMPLE_SIZE $DIMENSION

	echo "====================="
        echo "UMAP - SAMPLE_SIZE: $SAMPLE_SIZE, DIMENSIONS: $DIMENSION"
        $PYTHON_EXEC umap.py $SAMPLE_SIZE $DIMENSION

	echo "====================="
        echo "TSNE - SAMPLE_SIZE: $SAMPLE_SIZE, DIMENSIONS: $DIMENSION"
        $PYTHON_EXEC tsne.py $SAMPLE_SIZE $DIMENSION
    done
done
