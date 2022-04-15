import os
import urllib.request
data_dir = "../../datasets/glue/"
path_to_data="../../datasets/glue/MRPC/"

print("Processing MRPC...")
mrpc_dir = os.path.join(data_dir, "MRPC")
if not os.path.isdir(mrpc_dir):
	os.mkdir(mrpc_dir)
if path_to_data:
	mrpc_train_file = os.path.join(path_to_data, "msr_paraphrase_train.txt")
	mrpc_test_file = os.path.join(path_to_data, "msr_paraphrase_test.txt")
else:
	print("Local MRPC data not specified, downloading data from %s" % MRPC_TRAIN)
	mrpc_train_file = os.path.join(mrpc_dir, "msr_paraphrase_train.txt")
	mrpc_test_file = os.path.join(mrpc_dir, "msr_paraphrase_test.txt")
assert os.path.isfile(mrpc_train_file), "Train data not found at %s" % mrpc_train_file
assert os.path.isfile(mrpc_test_file), "Test data not found at %s" % mrpc_test_file
urllib.request.urlretrieve('https://firebasestorage.googleapis.com/v0/b/mtl-sentence-representations.appspot.com/o/data%2Fmrpc_dev_ids.tsv?alt=media&token=ec5c0836-31d5-48f4-b431-7480817f1adc', os.path.join(mrpc_dir, "dev_ids.tsv"))

dev_ids = []
with open(os.path.join(mrpc_dir, "dev_ids.tsv"), encoding="utf8") as ids_fh:
	for row in ids_fh:
		dev_ids.append(row.strip().split('\t'))

with open(mrpc_train_file, encoding="utf8") as data_fh, \
	open(os.path.join(mrpc_dir, "train.tsv"), 'w', encoding="utf8") as train_fh, \
	open(os.path.join(mrpc_dir, "dev.tsv"), 'w', encoding="utf8") as dev_fh:
	header = data_fh.readline()
	train_fh.write(header)
	dev_fh.write(header)
	for row in data_fh:
		label, id1, id2, s1, s2 = row.strip().split('\t')
		if [id1, id2] in dev_ids:
			dev_fh.write("%s\t%s\t%s\t%s\t%s\n" % (label, id1, id2, s1, s2))
		else:
			train_fh.write("%s\t%s\t%s\t%s\t%s\n" % (label, id1, id2, s1, s2))

with open(mrpc_test_file, encoding="utf8") as data_fh, \
	open(os.path.join(mrpc_dir, "test.tsv"), 'w', encoding="utf8") as test_fh:
	header = data_fh.readline()
	test_fh.write("index\t#1 ID\t#2 ID\t#1 String\t#2 String\n")
	for idx, row in enumerate(data_fh):
		label, id1, id2, s1, s2 = row.strip().split('\t')
		test_fh.write("%d\t%s\t%s\t%s\t%s\n" % (idx, id1, id2, s1, s2))
print("\tCompleted!")
