#!/bin/bash

PEAK_LR=5e-4        
TOKENS_PER_SAMPLE=512  
MAX_POSITIONS=512     
MAX_SENTENCES=16       
UPDATE_FREQ=16          

DATA_DIR=../data-bins/wikipedia/unigram/alpha0/vocab_size16000/spm3/

fairseq-train $DATA_DIR \
    --fp16 \
    --task masked_lm --criterion masked_lm \
    --arch roberta_base --sample-break-mode complete --tokens-per-sample $TOKENS_PER_SAMPLE \
    --optimizer adam --adam-betas '(0.9,0.98)' --adam-eps 1e-6 --clip-norm 0.0 \
    --lr-scheduler fixed --lr $PEAK_LR \
    --warmup-updates 10000 \
    --dropout 0.1 --attention-dropout 0.1 --weight-decay 0.01 \
    --batch-size $MAX_SENTENCES --update-freq $UPDATE_FREQ \
    --log-format json --log-interval 10 \
    --skip-invalid-size-inputs-valid-test \
    --save-interval-updates 2000 \
    --save-interval 1 \
    --max-epoch 30 \
    --save-dir ../models/wikipedia/unigram/alpha0/vocab_size16000/spm3/checkpoints


                                                                  
