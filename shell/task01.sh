echo 'Броят на търсените редове е' $(grep '[02468]' philip-j-fry.txt | grep -v '[a-v]' | wc -l)
