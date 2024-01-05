#!/bin/bash

set -ex

date
pwd
ls -lh

mkdir -p ftlog

export OMP_NUM_THREADS=8

BS=${BS:-4800}

python ppo.py c=ibm_mp c.ddp_port=23333 \
    c.mini_batch_size=${BS} 'c.gpus=[0,1,2,3]' \
    c.time_budget='24:00:00' \
    c.k_epochs=20 c.lr_scheduler=linear c.num_eps_per_iter=64 c.max_eps_len=600 \
    2>&1 | tee ftlog/ibm_mp.log


sleep 10
