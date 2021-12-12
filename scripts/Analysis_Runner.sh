#!/bin/bash
#SBATCH --mem=16000


# Create result directories
mkdir -p analysis_objects
mkdir -p results

# Create Temporary Script

cat <<EOF > scripts/run_jupyter.sh
#!/bin/bash
#SBATCH --mem=256000
#SBATCH --ntasks=32

echo Running Jupyter Notebook \$1 
jupyter nbconvert --to html\
    --output-dir=results\
    --execute notebooks/\${1}
EOF 


## Run Exploration and Preprocessing
if [ -f "results/01_Explore_And_Process.html" ]
then
    echo Found Result File: "results/01_Explore_And_Process.html"
else
    echo Generating "results/01_Explore_And_Process.html"
    sbatch scripts/run_jupyter.sh 01_Explore_And_Process.ipynb
fi    

## Run Logistic Models for IC Laws on Target Endpoints
if [ -f "results/02_Logistic_Models.html" ]
then
    echo Found Result File: "results/02_Logistic_Models.html"
else
    echo Generating "results/02_Logistic_Models.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    sbatch scripts/run_jupyter.sh 02_Logistic_Models.ipynb
    else
	    echo Must run Notebook 01_Explore_And_Processs.ipynb first
    fi
    
fi

## Run Gradient Boosted Forests to predict Relapse
if [ -f "results/03_Gradient_Boosted_Relapse_Classification.html" ]
then
   echo Found Result File: "results/03_Gradient_Boosted_Relapse_Classification.html"
else
    echo Generating "results/03_Gradient_Boosted_Relapse_Classification.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    sbatch scripts/run_jupyter.sh 03_Gradient_Boosted_Relapse_Classification.ipynb
    else
	    echo Must run Notebook 01_Explore_And_Processs.ipynb first
    fi
fi

## Run Gradient Boosted Forests to predict Service Utilization
if [ -f "results/04_Gradient_Boosted_Service_Classification.html" ]
then
   echo Found Result File: "results/04_Gradient_Boosted_Service_Classification.html"
else
    echo Generating "results/04_Gradient_Boosted_Service_Classification.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    sbatch scripts/run_jupyter.sh 04_Gradient_Boosted_Service_Classification.ipynb
    else
	    echo Must run Notebook 01_Explore_And_Processs.ipynb first
    fi
fi



## Cleanup temporary script
rm scripts/run_jupyter.sh
