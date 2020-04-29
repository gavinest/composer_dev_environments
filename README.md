# composer_dev_environments

### Build the image
```
docker build -t gcp_test .
```

### Run the image with the service_account auth mounted 
```
docker run -ti -v $(pwd)/mygcloud:/root/.config/gcloud -v $(pwd):/tmp/certs gcp_test:latest
```

The solution for authorizing gcloud in a docker container was inspired by [this](https://github.com/GoogleCloudPlatform/cloud-sdk-docker/issues/152#event-1933393673) git issue.

### TODOs: 
- execute docker container from registry in ci/cd
- name the env after the branch. $CI_COMMIT_BRANCH https://docs.gitlab.com/ee/ci/variables/predefined_variables.html
- add $ tracking to the envs
