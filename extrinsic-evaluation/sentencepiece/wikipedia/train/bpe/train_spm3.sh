#!/bin/bash
#$ -l rmem=60G
#$ -M egow-smith1@sheffield.ac.uk
#$ -m bea

module load apps/python/conda

python train_spm3_bpe_16000.py
