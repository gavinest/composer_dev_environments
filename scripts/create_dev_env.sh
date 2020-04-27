#!/usr/bin/env bash

set -euo pipefail

user="$(whoami)"
env="dev"

# composer settings
project="genuine-compass-199120"
env_name="dev-${user}"
location="us-central1"
zone="us-central1-f"
composer_home="/home/airflow/gcs"


echo "creating composer environment $env_name:

    name: ${env_name}

Settle in. This is going to take a while...
"
# gcloud composer environments create $env_name \
#     --project $project \
#     --location $location \
#     --zone us-central1-f \
#     --disk-size 20 \
#     --machine-type n1-standard-1 \
#     --python-version 3 \
#     --node-count 3 \
#     --image-version composer-latest-airflow-1.10.6

echo "syncing files to composer environment ${env_name}"
gcloud composer environments storage dags import \
    --source=./dags/ \
    --project=$project \
    --environment=$env_name \
    --location=$location

# echo "installing environment dependencies from requirements.txt"
# gcloud composer environments update $env_name \
#     --project=$project \
#     --location=$location \
#     --update-pypi-packages-from-file=./requirements.txt

echo "importing variables from file dags/variables/variables-$env.json"
gcloud composer environments run $env_name \
    --project=$project \
    --location=$location \
    variables -- --import $composer_home/dags/dags/variables/variables-$env.json
