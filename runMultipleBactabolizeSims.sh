for file in ./models_xml/*.xml; do base=${file##*/}; bactabolize fba --model_fp "$file" --fba_spec_name lb --output_fp "${base%.*}_bactabolise.tsv"; done
