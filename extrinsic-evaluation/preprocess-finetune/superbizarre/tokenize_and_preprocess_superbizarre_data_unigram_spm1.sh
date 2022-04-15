#!/bin/bash

INPUT_COLUMNS=( 3 )
TEST_INPUT_COLUMNS=( 3 )
LABEL_COLUMN=2
INPUT_COUNT=1

for TASK in arxiv reddit
do
  TASK_DATA_FOLDER="../../datasets/superbizarre/data/$TASK/csv/"
  SPLITS="train dev test"
  # Strip out header and filter lines that don't have expected number of fields.
  rm -rf "$TASK_DATA_FOLDER/processed_spm1_unigram"
  mkdir -p "$TASK_DATA_FOLDER/processed_spm1_unigram"

  # Split into input0, input1 and label
  for SPLIT in $SPLITS
  do
    cp "$TASK_DATA_FOLDER/$SPLIT.tsv" "$TASK_DATA_FOLDER/processed_spm1_unigram/$SPLIT.tsv";
    for INPUT_TYPE in $(seq 0 $((INPUT_COUNT-1)))
    do
      if [[ "$SPLIT" != test* ]]
      then
        COLUMN_NUMBER=${INPUT_COLUMNS[$INPUT_TYPE]}
      else
        COLUMN_NUMBER=${TEST_INPUT_COLUMNS[$INPUT_TYPE]}
      fi
      cut -f"$COLUMN_NUMBER" "$TASK_DATA_FOLDER/processed_spm1_unigram/$SPLIT.tsv" > "$TASK_DATA_FOLDER/processed_spm1_unigram/$SPLIT.raw.input$INPUT_TYPE";
    done

    cut -f"$LABEL_COLUMN" "$TASK_DATA_FOLDER/processed_spm1_unigram/$SPLIT.tsv" > "$TASK_DATA_FOLDER/processed_spm1_unigram/$SPLIT.label";

    # sp encode.
    for INPUT_TYPE in $(seq 0 $((INPUT_COUNT-1)))
    do
    LANG="input$INPUT_TYPE"
    echo "sp encoding $SPLIT/$LANG"
    python ../../sentencepiece/wikipedia/segment/unigram/alpha0/vocab_size16000/segment.py \
    --model-file ../../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/wikipedia_spm1_unigram_16000.model \
    --in-file "$TASK_DATA_FOLDER/processed_spm1_unigram/$SPLIT.raw.$LANG" \
    --out-file "$TASK_DATA_FOLDER/processed_spm1_unigram/$SPLIT.$LANG" ;
    done
  done

  # Remove output directory.
  rm -rf "../../data-bins/superbizarre/unigram/alpha0/vocab_size16000/spm1/$TASK-bin"

  DEVPREF="$TASK_DATA_FOLDER/processed_spm1_unigram/dev.LANG"
  TESTPREF="$TASK_DATA_FOLDER/processed_spm1_unigram/test.LANG"

  # Run fairseq preprocessing:
  for INPUT_TYPE in $(seq 0 $((INPUT_COUNT-1)))
  do
    LANG="input$INPUT_TYPE"
    fairseq-preprocess \
      --only-source \
      --srcdict ../../sentencepiece/wikipedia/models/unigram/alpha0/vocab_size16000/spm1_fairseq.dict \
      --trainpref "$TASK_DATA_FOLDER/processed_spm1_unigram/train.$LANG" \
      --validpref "${DEVPREF//LANG/$LANG}" \
      --testpref "${TESTPREF//LANG/$LANG}" \
      --destdir "../../data-bins/superbizarre/unigram/alpha0/vocab_size16000/spm1/$TASK-bin/$LANG" \
      --workers 60 ;
  done
  fairseq-preprocess \
    --only-source \
    --trainpref "$TASK_DATA_FOLDER/processed_spm1_unigram/train.label" \
    --validpref "${DEVPREF//LANG/label}" \
    --testpref "${TESTPREF//LANG/label}" \
    --destdir "../../data-bins/superbizarre/unigram/alpha0/vocab_size16000/spm1/$TASK-bin/label" \
    --workers 60;
done
