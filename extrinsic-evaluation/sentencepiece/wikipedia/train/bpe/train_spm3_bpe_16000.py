import sentencepiece as spm
spm.SentencePieceTrainer.train(input='../../datasets/wikipedia/raw/train_spm.raw', model_prefix='wikipedia_spm3_bpe_16000', vocab_size=16000, train_extremely_large_corpus=True, model_type='bpe')
