#!/bin/bash
git clone https://github.com/valentinhofmann/superbizarre.git ../../datasets/superbizarre/

awk -F, '{print 0, $3, $1}' OFS='\t' ../../datasets/superbizarre/data/arxiv/csv/arxiv_train.csv | tail -n +2 > ../../datasets/superbizarre/data/arxiv/csv/train.tsv

awk -F, '{print 0, $3, $1}' OFS='\t' ../../datasets/superbizarre/data/arxiv/csv/arxiv_dev.csv | tail -n +2 > ../../datasets/superbizarre/data/arxiv/csv/dev.tsv

awk -F, '{print 0, $3, $1}' OFS='\t' ../../datasets/superbizarre/data/arxiv/csv/arxiv_test.csv | tail -n +2 > ../../datasets/superbizarre/data/arxiv/csv/test.tsv

awk -F, '{print 0, $3, $1}' OFS='\t' ../../datasets/superbizarre/data/reddit/csv/reddit_train.csv | tail -n +2 > ../../datasets/superbizarre/data/reddit/csv/train.tsv

awk -F, '{print 0, $3, $1}' OFS='\t' ../../datasets/superbizarre/data/reddit/csv/reddit_dev.csv | tail -n +2 > ../../datasets/superbizarre/data/reddit/csv/dev.tsv

awk -F, '{print 0, $3, $1}' OFS='\t' ../../datasets/superbizarre/data/reddit/csv/reddit_test.csv | tail -n +2 > ../../datasets/superbizarre/data/reddit/csv/test.tsv
