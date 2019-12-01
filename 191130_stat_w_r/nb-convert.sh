#!/usr/bin/env bash

./docker-run.sh \
  jupyter nbconvert \
  --ExecutePreprocessor.timeout=-1 \
  --to notebook \
  --execute ${PWD}/$1 \
  --output $(basename $1)
