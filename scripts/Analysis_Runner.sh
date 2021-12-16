#!/bin/bash
#SBATCH --mem=16000


# Create result directories
mkdir -p analysis_objects
mkdir -p results


## Run Exploration and Preprocessing
if [ -f "results/01_Analyze_Missing_and_Impute.html" ]
then
    echo Found Result File: "results/01_Analyze_Missing_and_Impute.html"
else
    echo Generating "results/01_Analyze_Missing_and_Impute.html"
    sbatch scripts/run_jupyter.sh 01_Analyze_Missing_and_Impute.ipynb
fi    

## Run Generate Descriptive Statistics for IC Laws on Target Endpoints
if [ -f "results/02_Prepare_Descriptive_Statistics.html" ]
then
    echo Found Result File: "results/02_Prepare_Descriptive_Statistics.html"
else
    echo Generating "results/02_Prepare_Descriptive_Statistics.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
        echo skipping
	    #sbatch scripts/run_jupyter.sh 02_Prepare_Descriptive_Statistics.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
    
fi

## Run Gradient Boosted Forests to predict Relapse
if [ -f "results/03_Gradient_Boosted_Relapse_Classification_All.html" ]
then
   echo Found Result File: "results/03_Gradient_Boosted_Relapse_Classification_All.html"
else
    echo Generating "results/03_Gradient_Boosted_Relapse_Classification_All.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    echo sbatch scripts/run_jupyter.sh 03_Gradient_Boosted_Relapse_Classification_All.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi


if [ -f "results/04_Gradient_Boosted_Relapse_Classification_NoState.html" ]
then
   echo Found Result File: "results/04_Gradient_Boosted_Relapse_Classification_NoState.html"
else
    echo Generating "results/04_Gradient_Boosted_Relapse_Classification_NoState.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    echo sbatch scripts/run_jupyter.sh 04_Gradient_Boosted_Relapse_Classification_NoState.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi

if [ -f "results/05_Gradient_Boosted_Relapse_Classification_NoIC.html" ]
then
   echo Found Result File: "results/05_Gradient_Boosted_Relapse_Classification_NoIC.html"
else
    echo Generating "results/05_Gradient_Boosted_Relapse_Classification_NoIC.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    echo sbatch scripts/run_jupyter.sh 05_Gradient_Boosted_Relapse_Classification_NoIC.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi

if [ -f "results/06_Gradient_Boosted_Relapse_Classification_NoGeo.html" ]
then
   echo Found Result File: "results/06_Gradient_Boosted_Relapse_Classification_NoGeo.html"
else
    echo Generating "results/06_Gradient_Boosted_Relapse_Classification_NoGeo.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    echo sbatch scripts/run_jupyter.sh 06_Gradient_Boosted_Relapse_Classification_NoGeo.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi

## Run Single Predictor Logit Models
if [ -f "results/07_Single_Predictor_Logit_Models.html" ]
then
   echo Found Result File: "results/07_Single_Predictor_Logit_Models.html"
else
    echo Generating "results/07_Single_Predictor_Logit_Models.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
        echo skipping
	    sbatch scripts/run_jupyter.sh 07_Single_Predictor_Logit_Models.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi

## Run XGBoost for Dropout
if [ -f "results/08_Gradient_Boosted_Dropout_Classification_All.html" ]
then
   echo Found Result File: "results/08_Gradient_Boosted_Dropout_Classification_All.html"
else
    echo Generating "results/08_Gradient_Boosted_Dropout_Classification_All.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
        #echo skipping
	    sbatch scripts/run_jupyter.sh 08_Gradient_Boosted_Dropout_Classification_All.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi


if [ -f "results/09_Gradient_Boosted_Dropout_Classification_NoState.html" ]
then
    echo Found Result File: "results/09_Gradient_Boosted_Dropout_Classification_NoState.html"
else
    echo Generating "results/09_Gradient_Boosted_Dropout_Classification_NoState.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    # echo skipping
	    sbatch scripts/run_jupyter.sh 09_Gradient_Boosted_Dropout_Classification_NoState.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi


if [ -f "results/10_Gradient_Boosted_Dropout_Classification_NoIC.html" ]
then
   echo Found Result File: "results/10_Gradient_Boosted_Dropout_Classification_NoIC.html"
else
    echo Generating "results/10_Gradient_Boosted_Dropout_Classification_NoIC.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    # echo skipping
	    sbatch scripts/run_jupyter.sh 10_Gradient_Boosted_Dropout_Classification_NoIC.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi


if [ -f "results/11_Gradient_Boosted_Dropout_Classification_NoGeo.html" ]
then
   echo Found Result File: "results/11_Gradient_Boosted_Dropout_Classification_NoGeo.html"
else
    echo Generating "results/11_Gradient_Boosted_Dropout_Classification_NoGeo.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    # echo skipping
	    echo skip sbatch scripts/run_jupyter.sh 11_Gradient_Boosted_Dropout_Classification_NoGeo.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi

## Run XGBoost for All REASON
if [ -f "results/12_Gradient_Boosted_REASON_Classification_All.html" ]
then
   echo Found Result File: "results/12_Gradient_Boosted_REASON_Classification_All.html"
else
    echo Generating "results/12_Gradient_Boosted_REASON_Classification_All.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
        #echo skipping
	    sbatch scripts/run_jupyter.sh 12_Gradient_Boosted_REASON_Classification_All.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi


if [ -f "results/13_Gradient_Boosted_REASON_Classification_NoState.html" ]
then
    echo Found Result File: "results/13_Gradient_Boosted_REASON_Classification_NoState.html"
else
    echo Generating "results/13_Gradient_Boosted_REASON_Classification_NoState.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    # echo skipping
	    sbatch scripts/run_jupyter.sh 13_Gradient_Boosted_REASON_Classification_NoState.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi


if [ -f "results/14_Gradient_Boosted_REASON_Classification_NoIC.html" ]
then
   echo Found Result File: "results/14_Gradient_Boosted_REASON_Classification_NoIC.html"
else
    echo Generating "results/14_Gradient_Boosted_REASON_Classification_NoIC.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    # echo skipping
	    sbatch scripts/run_jupyter.sh 14_Gradient_Boosted_REASON_Classification_NoIC.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi


if [ -f "results/15_Gradient_Boosted_REASON_Classification_NoGeo.html" ]
then
   echo Found Result File: "results/15_Gradient_Boosted_REASON_Classification_NoGeo.html"
else
    echo Generating "results/15_Gradient_Boosted_REASON_Classification_NoGeo.html"
    if [ -f "analysis_objects/teds_imp_laws.csv" ]
    then
	    # echo skipping
	    sbatch scripts/run_jupyter.sh 15_Gradient_Boosted_REASON_Classification_NoGeo.ipynb
    else
	    echo Must run Notebook 01_Analyze_Missing_and_Impute.ipynb first
    fi
fi






