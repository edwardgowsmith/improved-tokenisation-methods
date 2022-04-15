#!/bin/bash

cut -f1 ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm3_unigram_16000.vocab | awk '{print NR-1 " " 100}' | tail -n +4 > ../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/spm3_fairseq.dict
