# large-scale-dimensionality-reduction

Each folder contains `.sh` scripts designed to run jobs using `sbatch` on the Ares (AGH).

### Folder Descriptions:
* **dimension_test** - Scripts for testing the effect of varying the number of dimensions (features) in the input sample.
  
* **node_test** - Scripts for testing the impact of using a varying number of compute nodes during job execution.

* **pacmap_test** - Scripts utilizing the PaCMAP algorithm for dimensionality reduction, tested across various input sample sizes.

* **pca_test** - Scripts utilizing the Principal Component Analysis (PCA) algorithm for dimensionality reduction, tested across various input sample sizes.

* **tsne_test** - Scripts utilizing the t-SNE algorithm for dimensionality reduction, tested across various input sample sizes.

* **umap_test** - Scripts utilizing the UMAP algorithm for dimensionality reduction, tested across various input sample sizes.

## Usage

Run a script using the command:
   ```bash
   sbatch script_name.sh
   ```
Monitor task progress with the command:
   ```bash
   squeue -u [your_username]
   ```

Each script can be customized by editing the parameters in the `.sh` file.
