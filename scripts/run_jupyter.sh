#!/bin/bash
#SBATCH --mem=256000
#SBATCH --ntasks=32

echo Running Jupyter Notebook $1 
jupyter nbconvert --to html\
    --output-dir=results\
    --execute notebooks/${1}
