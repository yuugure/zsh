cat testdata | awk '{ if ($1>=0 && $1<2500) result=1; else if ($1>=2500 && $1<5000) result=2; print result }' | sort | uniq -c
