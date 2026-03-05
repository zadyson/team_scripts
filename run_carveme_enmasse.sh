for file in *.faa; do carve $file --universe gramneg --gapfill LB --output ${file%.*}.xml; done
