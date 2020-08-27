#!/bin/bash

if
[ $# -ne 3 ]; then
echo "Usage: ${0} <dirname> <dirname> <string>"
exit 1
fi

if 
[ ! -d "${1}" ]; then
echo "First argument must be a directory" 
exit 2
fi

if 
[ ! -d "${2}" ]; then
echo "Second argument must be a directory" 
exit 3
fi

if 
[ ! -z $(ls -A "${2}") ]; then
echo "Second argument must be an empty directory" 
exit 4
fi

if 
[ !  $(id -u) -eq 0 ]; then
echo "Not executed as root" 
exit 0
fi

SRC="${1}"
DST="${2}"
ABC="${3}"

while read FILE; do
FILE_IN_DST=$(echo "${FILE}" | sed -E "s%${SRC}\/%${DST}\/%")
mkdir -p $(dirname "${FILE_IN_DST}")
mv -- "${FILE}" "${FILE_IN_DST}"
done < <(find "${SRC}" -type f -name "*${ABC}*" 2> /dev/null)
