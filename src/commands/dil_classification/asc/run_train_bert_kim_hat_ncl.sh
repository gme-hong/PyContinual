#!/bin/bash
#SBATCH -p gpu20
#SBATCH -t 10:00:00
#SBATCH -o slurm-%j.out
#SBATCH --gres gpu:1

for id in 1 2 3 4
do
    CUDA_VISIBLE_DEVICES=1 python run.py \
    --bert_model 'bert-base-uncased' \
    --experiment bert \
    --approach bert_kim_hat_ncl \
    --note random$id,last_id \
    --ntasks 19 \
    --nclasses 3 \
    --task asc \
    --scenario dil_classification \
    --idrandom $id \
    --output_dir './OutputBert' \
    --nepochs=1 \
    --lr=0.05 \
    --lr_min=1e-4 \
    --lr_factor=3 \
    --lr_patience=3 \
    --clipgrad=10000 \
    --ent_id
#    --model_path "./models/fp32/dil_classification/asc/bert_kim_hat_ent_$id" \
#    --save_model

done
#--nepochs 1
#    --train_batch_size 64 \
#nepochs=100,lr=0.05,lr_min=1e-4,lr_factor=3,lr_patience=3,clipgrad=10000
#    --eval_batch_size 128 \