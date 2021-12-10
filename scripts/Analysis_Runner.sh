#!/bin/bash
#SBATCH --mem=128000


# Create result directories
mkdir -p analysis_objects
mkdir -p results

## Run Exploration and Preprocessing
jupyter nbconvert --to html\
    --output-dir=results\
    --execute notebooks/01_Explore_And_Process.ipynb

## Run Logistic Models for IC Laws on Target Endpoints
jupyter nbconvert --to html\
    --output-dir=results\
    --execute notebooks/02_Logistic_Models.ipynb

## Run Gradient Boosted Forests to predict Relapse
jupyter nbconvert --to html\
    --output-dir=results\
    --execute notebooks/03_Gradient_Boosted_Relapse_Classification.ipynb
