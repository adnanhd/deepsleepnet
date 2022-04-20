#!/bin/bash

data=$1
gan=$2
nfolds=$3
start=$4
end=$5
gpu=$6

if [[ -n "$data" ]] && [[ -n "$start" ]] && [[ -n "$end" ]] && [[ -n "$gpu" ]]; then
    for i in $(eval echo {$start..$end})
    do
       CUDA_VISIBLE_DEVICES=$gpu python dream-gan/main_dream.py \
               --data_dir=$data --gan_dir=$gan \
               --n_folds=$nfolds --fold_idx=$i \
               --checkpoint_dir="output/gan$i"
    done
else
    echo "argument error"
fi
