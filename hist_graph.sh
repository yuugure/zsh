#!/bin/sh
cat "$@" | awk '!max{max=$2;}{f=50/max;if(f>1)f=1;i=$2*f;r="";while(i-->0)r=r"#";printf "%s %s\n",$0,r;}'
exit 0
