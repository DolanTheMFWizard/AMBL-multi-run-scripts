#!/bin/bash

# Install code remotely
set -e

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Executing benchmarks..."

# AWS_ARGS=--extra_args 
DEFAULT_ARGS="--git_user DolanTheMFWizard --workspace benchmark --nohup"

BENCHMARK=ag
BRANCH="acc"
CONSTRAINT=4h8c

frameworks_array=( 
"AG_Ration_large_test_SS"
"AG_Ration_large_test_transductive"
"AG_best_Ration_large_test_SS"
"AG_best_Ration_large_test_transductive" )


for framework in "${frameworks_array[@]}"
do
    echo "Running ${framework}"
    FRAMEWORK="${framework}:latest"
    CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
    $MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS "-m aws -p 5000"

    sleep 21600
done

split_frameworks_array=(
    "aux_SS" 
    "aux_transductive" 
    "aux_best_SS" 
    "aux_best_transductive"
)

CONSTRAINT=24h8c
for framework in "${split_frameworks_array[@]}"
do
    echo "Running ${framework}"
    FRAMEWORK="${framework}:latest"
    CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
    $MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS "-m aws -p 5000"

    sleep 30000
done

echo "All benchmarks executed."
