#!/usr/bin/env bash

make -Bnd all | make2graph -b | dot -T png -o DAG.png
