# Obtained from: https://github.com/lhoyer/DAFormer
# Modifications: Add HR, LR, and attention visualization
# ---------------------------------------------------------------
# Copyright (c) 2021-2022 ETH Zurich, Lukas Hoyer. All rights reserved.
# Licensed under the Apache License, Version 2.0
# ---------------------------------------------------------------

#!/bin/bash
# CUDA_VISIBLE_DEVICES=7  bash test.sh /home/yguo/Documents/other/ocsm-mic/seg/work_dirs/local-basic/230910_2045_sample_all_human_cycle_20_class_gtavHR2csHR_mic_hrda_s2_fd3a0 iter_16000
TEST_ROOT=$1
ITERATION=$2

CONFIG_FILE="${TEST_ROOT}/*${TEST_ROOT: -1}.py"  # or .json for old configs
CHECKPOINT_FILE="${TEST_ROOT}/${ITERATION}.pth"
SHOW_DIR="${TEST_ROOT}/preds"
echo 'Config File:' $CONFIG_FILE
echo 'Checkpoint File:' $CHECKPOINT_FILE
echo 'Predictions Output Directory:' $SHOW_DIR
python -m tools.test --config ${CONFIG_FILE} --checkpoint ${CHECKPOINT_FILE} --eval mIoU --show-dir ${SHOW_DIR} --opacity 1

# Uncomment the following lines to visualize the LR predictions,
# HR predictions, or scale attentions of HRDA:
#python -m tools.test ${CONFIG_FILE} ${CHECKPOINT_FILE} --show-dir ${SHOW_DIR}_LR --opacity 1 --hrda-out LR
#python -m tools.test ${CONFIG_FILE} ${CHECKPOINT_FILE} --show-dir ${SHOW_DIR}_HR --opacity 1 --hrda-out HR
#python -m tools.test ${CONFIG_FILE} ${CHECKPOINT_FILE} --show-dir ${SHOW_DIR}_ATT --opacity 1 --hrda-out ATT
