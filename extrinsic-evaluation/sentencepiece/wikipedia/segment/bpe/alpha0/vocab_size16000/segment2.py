import sentencepiece as spm
import argparse
        
def main():
	
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--in-file",
    )

    parser.add_argument(
        "--out-file",
    )

    parser.add_argument(
        "--model-file",
    )

    parser.add_argument(
        "--sp1-model-file",
    )


    args = parser.parse_args()
    print(args)
    sp = spm.SentencePieceProcessor(model_file=args.model_file)
    spm1 = spm.SentencePieceProcessor(model_file=args.sp1_model_file)

    with open(args.in_file, 'r') as inf:
        with open(args.out_file, 'w') as outf:
            i = 0
            for line in inf:
                if len(spm1.encode(line)) < 511:
                    outline = ' '.join([str(x) for x in sp.encode(line)])
                    outline = outline.replace(' 3 ', ' ') 
                    outf.write(outline)
                    outf.write('\n')

if __name__ == "__main__":
    main()

