#!/bin/bash

fairseq-preprocess \
    --only-source \
    --srcdict ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/spm1_fairseq.dict \
    --trainpref ../datasets/wikipedia/bpe/alpha0/vocab_size16000/spm2/train.spe \
    --validpref ../datasets/wikipedia/bpe/alpha0/vocab_size16000/spm2/val.spe \
    --testpref ../datasets/wikipedia/bpe/alpha0/vocab_size16000/spm2/test.spe \
    --destdir ../data-bins/wikipedia/bpe/alpha0/vocab_size16000/spm2/ \
    --workers 30 

