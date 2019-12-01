FROM jupyter/datascience-notebook:610bb8b938db

USER root
RUN addgroup -gid 562045362 share_minhash \
    && usermod -aG share_minhash $NB_USER \
    && addgroup -gid 562040385 share_transfer_prod \
    && usermod -aG share_transfer_prod $NB_USER
USER $NB_USER

RUN pip install psycopg2-binary

RUN pip install --ignore-installed pyathena==1.2.2 \
    && pip install --ignore-installed awscli==1.16.128
