#!/bin/bash






seed=$1
WARMUP_UPDATES=216    # Warmup the learning rate over this many updates
PEAK_LR=2e-05          # Peak learning rate, adjust as needed
MAX_POSITIONS=512       # Num. positional embeddings (usually same as above)
MAX_SENTENCES=32        # Number of sequences per batch (batch size)
UPDATE_FREQ=1          # Increase the batch size 16x

DATA_DIR=../../data-bins/glue/bpe/alpha0/vocab_size16000/spm3/STS-B-bin/

fairseq-train $DATA_DIR \
    --fp16 \
    --restore-file ../../models/wikipedia/bpe/alpha0/vocab_size16000/spm3/checkpoints/checkpoint30.pt \
    --reset-optimizer --reset-dataloader --reset-meters \
    --seed $seed \
    --init-token 0 --separator-token 2 \
    --task sentence_prediction --criterion sentence_prediction --regression-target \
    --arch roberta_base --num-classes 1 --max-positions $MAX_POSITIONS  \
    --optimizer adam --adam-betas '(0.9,0.98)' --adam-eps 1e-6 --clip-norm 0.0 \
    --lr-scheduler polynomial_decay --lr $PEAK_LR --warmup-updates $WARMUP_UPDATES --total-num-update 3600 \
    --dropout 0.1 --attention-dropout 0.1 --weight-decay 0.1 \
    --batch-size $MAX_SENTENCES --update-freq $UPDATE_FREQ \
    --log-format json --log-interval 1 \
    --skip-invalid-size-inputs-valid-test \
    --no-epoch-checkpoints \
    --max-epoch 20 \
    --save-dir ../../models/wikipedia/bpe/alpha0/vocab_size16000/spm3/finetune-sts/seed_$seed/checkpoints_fixed_epoch/ 


