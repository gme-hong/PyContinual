#!/bin/bash
#SBATCH -p gpu20
#SBATCH -t 10:00:00
#SBATCH -o til_asc_kim_derpp_4-%j.out
#SBATCH --gres gpu:1

for id in 0
do
    python  run.py \
    --note random$id,20tasks \
    --ntasks 20 \
    --task cifar10 \
    --scenario til_classification \
    --idrandom $id \
    --approach cnn_ewc_ncl \
    --eval_batch_size 128 \
    --train_batch_size 128 \
    --model_path "./models/fp32/til_classification/cifar10/cnn_ewc_20_$id" \
    --save_model
    --lamb=50
done
#--nepochs 1


#nepochs=100,lr=0.05,lr_min=1e-4,lr_factor=3,lr_patience=3,clipgrad=10000,lamb=5000