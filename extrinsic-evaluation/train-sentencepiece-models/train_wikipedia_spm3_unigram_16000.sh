#!/bin/bash

python ../sentencepiece/wikipedia/train/unigram/train_model3.py

mv wikipedia_spm3_unigram_16000.model ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/
mv wikipedia_spm3_unigram_16000.vocab ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/
