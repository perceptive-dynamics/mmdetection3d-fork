#!/usr/bin/env bash

CONFIG=$1
CHECKPOINT=$2
BATCH_SIZE=32
NUM_WORKERS=16
GPUS=$3
NNODES=${NNODES:-1}
NODE_RANK=${NODE_RANK:-0}
PORT=${PORT:-29500}
MASTER_ADDR=${MASTER_ADDR:-"127.0.0.1"}

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
python -m torch.distributed.launch \
    --nnodes=$NNODES \
    --node_rank=$NODE_RANK \
    --master_addr=$MASTER_ADDR \
    --nproc_per_node=$GPUS \
    --master_port=$PORT \
    $(dirname "$0")/test.py\
    $CONFIG \
    $CHECKPOINT \
    --cfg-options \
    test_dataloader.batch_size=$BATCH_SIZE \
    test_dataloader.num_workers=$NUM_WORKERS \
    val_dataloader.batch_size=$BATCH_SIZE \
    val_dataloader.num_workers=$NUM_WORKERS \
    --launcher pytorch \
    ${@:4}
