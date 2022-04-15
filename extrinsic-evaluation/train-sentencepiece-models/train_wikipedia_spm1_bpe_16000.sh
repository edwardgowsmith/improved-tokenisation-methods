#!/bin/bash

python ../sentencepiece/wikipedia/train/bpe/train_spm1_bpe_16000.py

mv wikipedia_spm1_bpe_16000.model ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/
mv wikipedia_spm1_bpe_16000.vocab ../sentencepiece/wikipedia/models/bpe/alpha0/vocab_size16000/
