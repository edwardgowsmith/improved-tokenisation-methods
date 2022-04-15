#!/bin/bash

python ../sentencepiece/wikipedia/segment/unigram/alpha0/vocab_size16000/segment2.py --in-file ../datasets/wikipedia/raw/train.raw \
    --out-file ../datasets/wikipedia/bpe/alpha0/vocab_size16000/spm2/train.spe \
    --model-file ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/wikipedia_spm1_bpe_16000.model \
    --sp1-model-file ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/wikipedia_spm1_bpe_16000.model \
    --sp3-model-file ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/wikipedia_spm3_bpe_16000.model
    

python ../sentencepiece/wikipedia/segment/unigram/alpha0/vocab_size16000/segment2.py --in-file ../datasets/wikipedia/raw/val.raw \
    --out-file ../datasets/wikipedia/bpe/alpha0/vocab_size16000/spm2/val.spe \
    --model-file ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/wikipedia_spm1_bpe_16000.model \
    --sp1-model-file ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/wikipedia_spm1_bpe_16000.model \
    --sp3-model-file ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/wikipedia_spm3_bpe_16000.model


python ../sentencepiece/wikipedia/segment/unigram/alpha0/vocab_size16000/segment2.py --in-file ../datasets/wikipedia/raw/test.raw \
    --out-file ../datasets/wikipedia/bpe/alpha0/vocab_size16000/spm2/test.spe \
    --model-file ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/wikipedia_spm1_bpe_16000.model \
    --sp1-model-file ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/wikipedia_spm1_bpe_16000.model \
    --sp3-model-file ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/wikipedia_spm3_bpe_16000.model


