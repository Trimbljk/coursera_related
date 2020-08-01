#!/usr/bin/env bash

echo ${DATA_DIR}

docker run  \
    -e "DATA_DIR=${DATA_DIR}" \
    -e BIOINFO_PROD_DB \
    -w ${PWD} \
    -v ${PWD}:${PWD} \
    -v $HOME/.aws:/home/jovyan/.aws \
    --user root -e "NB_UID=${UID}" \
    agbiome/stat_w_r \
    start.sh $@
