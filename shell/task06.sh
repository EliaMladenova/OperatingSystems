a) find . -maxdepth 2 2>/dev/null -szie 0 -exec -rm -i {}\;

b) gfind ~ -maxdepth 2 2>/dev/null -printf"%s%p\n" | sort -rm -t ' ' | head -5 | cut -d' ' -f2- | xargs -I {} rm -i {}
