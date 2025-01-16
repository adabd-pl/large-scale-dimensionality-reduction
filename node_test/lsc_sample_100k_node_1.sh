#!/bin/bash
#SBATCH --job-name=lsc_sample_100k_node_2_cpus_1
#SBATCH --time=02:00:00
#SBATCH --partition=plgrid
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=180G
#SBATCH --nodes 1
#SBATCH --ntasks-per-node=1 
#SBATCH --account=plglscclass24-cpu
#SBATCH --output=lsc_sample_100k_node_2.txt


PYTHON_EXEC="/net/ascratch/people/plgadabd/.conda/envs/ab_env_test/bin/python"

SAMPLE_SIZES=(100000)

for SAMPLE_SIZE in "${SAMPLE_SIZES[@]}"; do
    echo "====================="
    echo "PACMAP - $SAMPLE_SIZE"
    $PYTHON_EXEC pacmap_test/lsc_pacmap.py $SAMPLE_SIZE

    echo "====================="
    echo "PCA - $SAMPLE_SIZE"
    $PYTHON_EXEC pca_test/lsc_pca.py $SAMPLE_SIZE

    echo "====================="
    echo "UMAP - $SAMPLE_SIZE"
    $PYTHON_EXEC umap_test/lsc_umap.py $SAMPLE_SIZE

    echo "====================="
    echo "TSNE - $SAMPLE_SIZE"
    $PYTHON_EXEC tsne_test/lsc_tsne.py $SAMPLE_SIZE
done
