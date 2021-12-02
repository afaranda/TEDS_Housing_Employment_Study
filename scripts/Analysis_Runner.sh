#!/bin/bash
#SBATCH --mem=128000


# Create result directories
mkdir -p analysis_objects
mkdir -p results

## Run Exploration and Preprocessing
jupyter nbconvert --to pdf\
    --output-dir=results\
    --execute notebooks/01_Explore_And_Process.ipynb
