#!/bin/bash

python ../sentencepiece/wikipedia/segment/unigram/alpha0/vocab_size16000/segment.py --in-file ../datasets/wikipedia/raw/train.raw \
    --out-file ../datasets/wikipedia/unigram/alpha0/vocab_size16000/spm3/train.spe \
    --model-file ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm3_unigram_16000.model \
    --sp1-model-file ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm1_unigram_16000.model \
    --sp3-model-file ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm3_unigram_16000.model
    

python ../sentencepiece/wikipedia/segment/unigram/alpha0/vocab_size16000/segment.py --in-file ../datasets/wikipedia/raw/val.raw \
    --out-file ../datasets/wikipedia/unigram/alpha0/vocab_size16000/spm3/val.spe \
    --model-file ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm3_unigram_16000.model \
    --sp1-model-file ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm1_unigram_16000.model \
    --sp3-model-file ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm3_unigram_16000.model


python ../sentencepiece/wikipedia/segment/unigram/alpha0/vocab_size16000/segment.py --in-file ../datasets/wikipedia/raw/test.raw \
    --out-file ../datasets/wikipedia/unigram/alpha0/vocab_size16000/spm3/test.spe \
    --model-file ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm3_unigram_16000.model \
    --sp1-model-file ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm1_unigram_16000.model \
    --sp3-model-file ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm3_unigram_16000.model


