#!/bin/bash

#Download wikipedia dump
wget -P ../datasets/wikipedia/ https://dumps.wikimedia.org/enwiki/20210901/enwiki-20210901-pages-articles-multistream.xml.bz2

#Process with WikiExtractor
python -m wikiextractor.WikiExtractor ../datasets/wikipedia/enwiki-20210901-pages-articles-multistream.xml.bz2 -o - \
| grep -v "^<doc id=" \
| grep -v "</doc>\$" \
> ../datasets/wikipedia/wikiextractor-out.txt

#Split text to one sentence per line
python text_to_sentences.py ../datasets/wikipedia/wikiextractor-out.txt

#Split into train, val and test data
tail -n -200000 wikiextractor-out_preprocessed.txt > ../datasets/wikipedia/raw/test.raw
tail -n -400000 wikiextractor-out_preprocessed.txt | head -200000 > ../datasets/wikipedia/raw/val.raw
head -n -400000 wikiextractor-out_preprocessed.txt > ../datasets/wikipedia/raw/train.raw

#Get spm train data, removing blank lines, shuffling, then taking first 1 million lines
cat ../datasets/wikipedia/raw/train.raw | sed "/^\s*\$/d" | shuf | head -1000000 > ../datasets/wikipedia/raw/train_spm.raw 

