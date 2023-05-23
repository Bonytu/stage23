#!/bin/bash
# Copyright (c) Microsoft Corporation.
# SPDX-License-Identifier: Apache-2.0

# DeepSpeed Team
# OUTPUT=$1
# ZERO_STAGE=$2
# if [ "$OUTPUT" == "" ]; then
#     OUTPUT=./output
# fi
# if [ "$ZERO_STAGE" == "" ]; then
#     ZERO_STAGE=0
# fi
# mkdir -p $OUTPUT

# deepspeed --num_gpus 1 main.py --model_name_or_path facebook/opt-350m \
#    --num_padding_at_beginning 1 --weight_decay 0.1 --disable_dropout --gradient_accumulation_steps 4 --zero_stage $ZERO_STAGE \
#    --deepspeed --output_dir $OUTPUT &> $OUTPUT/training.log

OUTPUT=/home/xinzhang3/stage23/output/codegen-350M-mono-ins
MODEL_NAME=/home/xinzhang3/stage23/models/codegen-350M-mono-ins
LORA_MODULE_NAME=h.
ZERO_STAGE=0
# if [ "$OUTPUT" == "" ]; then
#     OUTPUT=./output
# fi
# if [ "$ZERO_STAGE" == "" ]; then
#     ZERO_STAGE=0
# fi
mkdir -p $OUTPUT

deepspeed --num_gpus 1 main.py --model_name_or_path $MODEL_NAME --learning_rate 1e-4 \
   --lora_dim 128 --lora_module_name $LORA_MODULE_NAME --num_train_epochs 20 \
   --num_padding_at_beginning 1 --weight_decay 0.1 --disable_dropout --gradient_accumulation_steps 4 --zero_stage $ZERO_STAGE \
   --deepspeed --output_dir $OUTPUT &> $OUTPUT/training.log
