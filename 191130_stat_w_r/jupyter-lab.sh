#!/usr/bin/env bash

while :
do
        PORT="`shuf -i 8888-9999 -n 1`"
        netstat -plnt | grep -q ":$PORT " || break
done

while getopts 'p:' opt
    do
        case $opt in
            p) PORT=$OPTARG;;
        esac
done

docker run \
    -e "NB_UID=$UID" --user root \
    -e "GRANT_SUDO=yes" \
    -e BIOINFO_PROD_DB \
    -e DATA_DIR \
    --name stat_w_r_$(hostname)_$(id -u) \
    -w $PWD \
    -v $PWD:$PWD \
    -p $PORT:$PORT  -d --rm \
    -v $HOME/.aws:/home/jovyan/.aws \
    agbiome/stat_w_r start.sh jupyter lab --allow-root --port $PORT
