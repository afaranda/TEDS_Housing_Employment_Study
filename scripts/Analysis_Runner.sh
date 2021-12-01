#!/bin/bash
#SBATCH --mem=128000

## Run Exploration and Preprocessing
jupyter nbconvert --to pdf\
    --output-dir=results\
    --execute notebooks/01_Explore_And_Process.ipynb
