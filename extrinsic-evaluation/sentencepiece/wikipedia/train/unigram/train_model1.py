import sentencepiece as spm
spm.SentencePieceTrainer.train(input='../../datasets/wikipedia/raw/train_spm.raw', model_prefix='wikipedia-spm1-unigram-16000', vocab_size=16000, user_defined_symbols=['▁'], add_dummy_prefix=False, train_extremely_large_corpus=True)
