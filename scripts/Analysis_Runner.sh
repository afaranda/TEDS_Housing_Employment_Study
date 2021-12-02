#!/bin/bash
#SBATCH --mem=128000


# Create result directories
mkdir -p analysis_objects
mkdir -p results

# Activate Conda Environment
conda activate binf667013_final_project

## Run Exploration and Preprocessing
jupyter nbconvert --to pdf\
    --output-dir=results\
    --execute notebooks/01_Explore_And_Process.ipynb
