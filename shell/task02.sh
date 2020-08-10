nl -n rn -s'.' books.txt | awk '{$2=$3=$4=""}$1' | tr -s ' ' | sort -t' ' -k2
