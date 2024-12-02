#!/usr/bin/env bash

CONFIG=$1
GPUS=$2
NNODES=${NNODES:-1}
NODE_RANK=${NODE_RANK:-0}
PORT=${PORT:-29500}
MASTER_ADDR=${MASTER_ADDR:-"127.0.0.1"}
TRAIN_EPOCHS=3
VAL_INTERVAL=1

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
python -m torch.distributed.launch \
    --nnodes=$NNODES \
    --node_rank=$NODE_RANK \
    --master_addr=$MASTER_ADDR \
    --nproc_per_node=$GPUS \
    --master_port=$PORT \
    $(dirname "$0")/train.py \
    $CONFIG \
    --cfg-options \
    train_cfg.max_epochs=$TRAIN_EPOCHS \
    train_cfg.val_interval=$VAL_INTERVAL \
    auto_scale_lr.base_batch_size=4 \
    auto_scale_lr.enable=true \
    --resume \
    --launcher pytorch ${@:3}


# load_from=/home/ubuntu/autobot/pretrained/hv_pointpillars_regnet-400mf_fpn_sbn-all_2x8_2x_lyft-3d_20210521_115618-823dcf18.pth \