FROM google/cloud-sdk:latest

WORKDIR /usr/src/app

COPY mygcloud /root/.config/gcloud
COPY dags ./dags
COPY scripts ./scripts
COPY requirements.txt ./

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
