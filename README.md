# Improving Tokenisation by Alternative Treatment of Spaces
This repo contains the code required to reproduce the expriments from the paper [Improving Tokenisation by Alternative Treatment of Spaces](https://arxiv.org/pdf/2204.04058.pdf).

Requirements: Python 3.8, Pytorch 1.6, Fairseq v0.10.2, WikiExtractor, BlingFire

The model names here correspond to those in the paper as:
* spm1: prime 
* spm2: prime no spaces
* spm3: default

To run the intrinsic evaluation, step through the Jupyter Notebook run_intrinsic_evaluation.ipynb in the intrinsic-evaluation/ directory. 

To run the extrinsic evaluation, do the following steps with the scripts in the extrinsic-evaluation/ directory
1. Run get-wiki-data.sh to download Wikipedia dump, process with WikiExtractor, split into sentences with BlingFire, then split into train, val and test data and get training data for SentencePiece
2. Train SentencePiece models with scripts in train-sentencepiece-models/ 
3. Tokenise training data with scripts in tokenize-data/
4. Creat fairseq dict files (required for preprocessing) with scripts in create-fairseq-dict-files/
5. Preprocess the pretraining data with scripts in preprocess-pretrain/
6. Run pretraining with scripts in fairseq-pretrain/. Note that the learning rates were lowered from 5e-4 to 1e-4 after the following epochs due to an increase in validation loss:
    1. bpe_spm1: 5
    2. bpe_spm2: 16
    3. bpe_spm3: 16
    4. unigram_spm1: 7
    5. unigram_spm2: 11
    6. unigram_spm3: 12
8. Download and preprocess the finetuning data with scripts in preprocess-finetune/
9. Run finetuning with scripts in fairseq-finetune/ and fairseq-finetune-same_epoch/ for fixed updates and fixed epochs, respectively

The pretrained Fairseq models are also available [here](https://drive.google.com/drive/folders/1m9Y3Rm7-o6Uhmd690jLKdOgfVPK_9_Du?usp=sharing). These can be extracted into the models/fairseq/ directory, skipping steps 3, 5, and 6 above. 
