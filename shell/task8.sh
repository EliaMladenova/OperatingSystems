ls -l | tail -n +2 | tr -s ' ' | sort -t ' ' -k 2 -rn | head -n 5 | cut -d ' ' -f9-
