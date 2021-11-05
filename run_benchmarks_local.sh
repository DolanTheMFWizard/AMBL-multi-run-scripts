#!/bin/bash

# Install code remotely
set -e

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Executing benchmarks..."

# AWS_ARGS=--extra_args 
DEFAULT_ARGS="--git_user DolanTheMFWizard --workspace benchmark --nohup"

BENCHMARK=test
BRANCH="acc"
CONSTRAINT=4h8c

frameworks_array = ("AG_Ration" "PL_Ration" 
                    "AG_Ration_large_test_SS" "PL_Ration_large_test_SS" 
                    "AG_Ration_large_test_transductive" "PL_Ration_large_test_transductive"
                    "AG_best_Ration_large_test_SS" "PL_best_Ration_large_test_SS"
                    "AG_best_Ration_large_test_transductive" "PL_best_Ration_large_test_transductive"
                    "PL_Ration_split_transductive"
                    "PL_Ration_split_SS"
                    "PL_best_Ration_split_transductive"
                    "PL_best_Ration_split_SS"
                    )


for framework in frameworks_array
do
    FRAMEWORK="${framework}:latest"
    CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
    $MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args 

    sleep 1800
done

echo "All benchmarks executed."
