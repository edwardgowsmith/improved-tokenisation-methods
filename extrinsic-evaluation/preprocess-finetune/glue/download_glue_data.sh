#!/bin/bash

wget https://dl.fbaipublicfiles.com/glue/data/CoLA.zip -P ../../datasets/glue/
unzip ../../datasets/glue/CoLA.zip -d ../../datasets/glue/

wget https://dl.fbaipublicfiles.com/glue/data/SST-2.zip -P ../../datasets/glue/
unzip ../../datasets/glue/SST-2.zip -d ../../datasets/glue/

wget https://dl.fbaipublicfiles.com/glue/data/STS-B.zip -P ../../datasets/glue/
unzip ../../datasets/glue/STS-B.zip -d ../../datasets/glue/

wget https://dl.fbaipublicfiles.com/glue/data/QQP-clean.zip -P ../../datasets/glue/
unzip ../../datasets/glue/QQP-clean.zip -d ../../datasets/glue/
mv ../../datasets/glue/QQP-clean ../../datasets/glue/QQP 

wget https://dl.fbaipublicfiles.com/glue/data/QNLIv2.zip -P ../../datasets/glue/
unzip ../../datasets/glue/QNLIv2.zip -d ../../datasets/glue/ 
mv ../../datasets/glue/QNLIv2 ../../datasets/glue/QNLI

wget https://dl.fbaipublicfiles.com/glue/data/RTE.zip -P ../../datasets/glue/
unzip ../../datasets/glue/RTE.zip -d ../../datasets/glue/ 

mkdir ../../datasets/glue/MRPC
wget https://dl.fbaipublicfiles.com/senteval/senteval_data/msr_paraphrase_train.txt -P ../../datasets/glue/MRPC
wget https://dl.fbaipublicfiles.com/senteval/senteval_data/msr_paraphrase_test.txt -P ../../datasets/glue/MRPC

python format_mrpc_data.py

wget https://dl.fbaipublicfiles.com/glue/data/MNLI.zip -P ../../datasets/glue
unzip ../../datasets/glue/MNLI.zip -d ../../datasets/glue
                              