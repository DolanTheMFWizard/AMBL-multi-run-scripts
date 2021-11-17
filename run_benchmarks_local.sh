#!/bin/bash

# Install code remotely
set -e

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Executing benchmarks..."

# AWS_ARGS=--extra_args "-m aws -p 1500"
DEFAULT_ARGS="--git_user DolanTheMFWizard --workspace benchmark --nohup"

BENCHMARK=test #classification_AMLB
BRANCH="nll"
CONSTRAINT=1h8c

frameworks_array=( 
    'Conflation'
    'Conflation_dirichlet'
    'Conflation_temp'
    'Conflation_matrix'
    'Conflation_vector'
    'Conflation_fix_dir'
)

for framework in "${frameworks_array[@]}"
do
    FRAMEWORK="${framework}:latest"
    echo "${FRAMEWORK} running"
    CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
    $MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS # --extra_args "-m aws -p 5000"

    #sleep 11000
done

echo "All benchmarks executed."
