#!/bin/bash

fairseq-preprocess \
    --only-source \
    --srcdict ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/spm3_fairseq.dict \
    --trainpref ../datasets/wikipedia/bpe/alpha0/vocab_size16000/spm3/train.spe \
    --validpref ../datasets/wikipedia/bpe/alpha0/vocab_size16000/spm3/val.spe \
    --testpref ../datasets/wikipedia/bpe/alpha0/vocab_size16000/spm3/test.spe \
    --destdir ../data-bins/wikipedia/bpe/alpha0/vocab_size16000/spm3/ \
    --workers 30 

