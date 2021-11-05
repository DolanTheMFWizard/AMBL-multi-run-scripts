#!/bin/bash

# Install code remotely
set -e

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Executing benchmarks..."

# AWS_ARGS=--extra_args 
DEFAULT_ARGS="--git_user DolanTheMFWizard --workspace benchmark --nohup"

BENCHMARK=test
BRANCH="master"
CONSTRAINT=4h8c

frameworks_array=( "AG_Mix-Up-Cate" "Mix-Up-Cate" 
                   "AG_Mix-Up-Cate_best" "Mix-Up-Cate_best" )


for framework in frameworks_array
do
    FRAMEWORK="${framework}:latest"
    CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
    $MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args 

    sleep 1800
done

echo "All benchmarks executed."
