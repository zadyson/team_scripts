for dir in *_pharokka_annotation; do base=${dir%_pharokka_annotation}; cp "$dir/pharokka.gbk" "${base}.gbk"; done
