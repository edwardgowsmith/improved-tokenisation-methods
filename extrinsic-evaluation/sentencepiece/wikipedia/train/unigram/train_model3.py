import sentencepiece as spm
spm.SentencePieceTrainer.train(input='../../datasets/wikipedia/raw/train_spm.raw', model_prefix='wikipedia_spm3_unigram_16000', vocab_size=16000, shuffle_input_sentence=True, train_extremely_large_corpus=True)
