#!/bin/bash

# Install code remotely
set -e

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Executing benchmarks..."

# AWS_ARGS=--extra_args "-m aws -p 1500"
DEFAULT_ARGS="--git_user DolanTheMFWizard --workspace benchmark --nohup"

BENCHMARK=classification_AMLB
BRANCH="nll"
CONSTRAINT=4h8c

frameworks_array=( 
#    'AG_VS'
#    'Vector_Scaling'
#    'AG_best_VS'
#    'Vector_Scaling_best'
    'Dirichlet_Cal'
    'Dirichlet_Cal_best'
)

for framework in "${frameworks_array[@]}"
do
    FRAMEWORK="${framework}:latest"
    echo "${FRAMEWORK} running"
    CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
    $MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 5000"

    sleep 18000
done

echo "All benchmarks executed."
