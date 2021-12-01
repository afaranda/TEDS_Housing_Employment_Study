#!/bin/bash


## Run Exploration and Preprocessing
jupyter nbconvert --to pdf\
    --output-dir=results\
    --execute notebooks/01_Explore_And_Process.ipynb
