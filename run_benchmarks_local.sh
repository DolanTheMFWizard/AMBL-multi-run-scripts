#!/bin/bash

# Install code remotely
set -e

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Executing benchmarks..."

# AWS_ARGS=--extra_args "-m aws -p 1500"
DEFAULT_ARGS="--git_user DolanTheMFWizard --workspace benchmark --nohup"

BENCHMARK=ag
BRANCH="acc"
CONSTRAINT=4h8c

FRAMEWORK="AG_Ration:latest"
CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"

sleep 3600


FRAMEWORK="AG_Ration_large_test_SS:latest"
CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"

sleep 3600

FRAMEWORK="PL_Ration_large_test_SS:latest"
CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"

sleep 3600

FRAMEWORK="AG_Ration_large_test_transductive:latest"
CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"

sleep 3600

FRAMEWORK="AG_Ration_best:latest"
CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"

sleep 3600

FRAMEWORK="PL_Ration_best:latest"
CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"

sleep 3600

#
#FRAMEWORK="AutoGluon:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="AutoGluon_prune:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#CONSTRAINT=4h8c
#
#FRAMEWORK="AutoGluon_bestquality:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="AutoGluon_bestquality_prune:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="AutoGluon:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="AutoGluon_prune:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600

#FRAMEWORK="AutoGluon_hq:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600

#FRAMEWORK="AutoGluon_gq:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="AutoGluon:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#CONSTRAINT=4h8c
#
#FRAMEWORK="AutoGluon_bestquality:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="AutoGluon_hq:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="AutoGluon_gq:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="AutoGluon:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600


#FRAMEWORK="AutoGluon_bestquality:latest"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 10800

#FRAMEWORK="AutoGluon"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 10800
#
#FRAMEWORK="AutoGluon_bestquality"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="mljarsupervised"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 10800
#
#FRAMEWORK="mljarsupervised_compete"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
##
#FRAMEWORK="lightautoml"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
##
#FRAMEWORK="H2OAutoML"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
##
#FRAMEWORK="autosklearn2"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
##
#FRAMEWORK="flaml"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
###
#FRAMEWORK="TPOT"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="autoxgboost"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600
#
#FRAMEWORK="MLNet"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 3600


#
#FRAMEWORK="MLPlanWEKA"
#CUSTOM_ARGS="--framework $FRAMEWORK --benchmark $BENCHMARK --constraint $CONSTRAINT"
#$MYDIR/run_benchmark_local.sh --branch $BRANCH $CUSTOM_ARGS $DEFAULT_ARGS --extra_args "-m aws -p 1500"
#
#sleep 10800

echo "All benchmarks executed."
