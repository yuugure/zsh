#!/bin/sh
cat "$@" | sort | uniq -c | sort -k1nr | awk '{printf "%16s %4d\n",$2,$1;}'
exit 0
