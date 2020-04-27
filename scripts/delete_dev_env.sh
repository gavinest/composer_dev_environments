#!/usr/bin/env bash

set -euo pipefail 

env_name="dev-root"
project="genuine-compass-199120"
location="us-central1   "

# echo "deleting cloud composer environment ${env_name}"
# gcloud composer environments delete $env_name \
#     --project=$project \
#     --location=us-central1 \
#     --quiet

echo "deleting other composer resources"
get_composer_bucket() {
    gcloud composer environments describe $env_name \
        --project=$project \
        --location=$location \
        --format="value(config.dagGcsPrefix.segment(2))"
}
bucket=$(get_composer_bucket)

gsutil -m rm -r gs://$bucket/