#!/usr/bin/env bash
cd data/
curl "https://download.microsoft.com/download/8/7/0/8700516A-AB3D-4850-B4BB-805C515AECE1/FB15K-237.2.zip" -o "fb15k-237.zip"
unzip "fb15k-237.zip"
rm "fb15k-237.zip"
mv "Release" "fb15k-237"
rm "fb15k-237/text_cvsc.txt" "fb15k-237/text_emnlp.txt"
cd fb15k-237/
awk 'BEGIN{FS=OFS="\t"} {print $1,$3}' "train.txt" > "output.txt"
cat "output.txt" | col -b > "output_clean.txt"
awk '{ for(i=1;i<=NF;i++){ print $i}}' "output_clean.txt" > "output_merged.txt"
sort -u "output_merged.txt" > "entities.txt"
awk '{ print $0"\t"NR }' "entities.txt" > "entity2id.txt"
rm "output.txt" "output_clean.txt" "output_merged.txt" "entities.txt"
awk 'BEGIN{FS=OFS="\t"} {print $2}' "train.txt" > "output.txt"
sort -u  "output.txt" > "relations.txt"
awk '{ print $0"\t"NR }' "relations.txt" > "relation2id.txt"
rm "output.txt" "relations.txt"

cd ..
curl "https://everest.hds.utc.fr/lib/exe/fetch.php?media=en:wordnet-mlj12.tar.gz" -o "wn18.tar"
tar -xf "wn18.tar"
rm "wn18.tar"
mv "wordnet-mlj12" "wn18"
cd wn18/
mv "wordnet-mlj12-train.txt" "train.txt"
mv "wordnet-mlj12-test.txt" "test.txt"
mv "wordnet-mlj12-valid.txt" "valid.txt"
mv "wordnet-mlj12-definitions.txt" "definitions.txt"
awk 'BEGIN{FS=OFS="\t"} {print $1,$3}' "train.txt" > "output.txt"
cat "output.txt" | col -b > "output_clean.txt"
awk '{ for(i=1;i<=NF;i++){ print $i}}' "output_clean.txt" > "output_merged.txt"
sort -u "output_merged.txt" > "entities.txt"
awk '{ print $0"\t"NR }' "entities.txt" > "entity2id.txt"
rm "output.txt" "output_clean.txt" "output_merged.txt" "entities.txt"
awk 'BEGIN{FS=OFS="\t"} {print $2}' "train.txt" > "output.txt"
sort -u  "output.txt" > "relations.txt"
awk '{ print $0"\t"NR }' "relations.txt" > "relation2id.txt"
rm "output.txt" "relations.txt"
