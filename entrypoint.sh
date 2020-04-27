#!/bin/bash
set -e

# auth to gcp
gcloud auth activate-service-account --key-file=/tmp/certs/svc_account.json
exec "$@"

# run deploy
# ./scripts/create_dev_env.sh
./scripts/delete_dev_env.sh