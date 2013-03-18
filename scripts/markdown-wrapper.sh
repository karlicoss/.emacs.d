#!/bin/bash
tmpfile=`mktemp`

while read -r l
do
    echo "$l" >> $tmpfile
done

pandoc -s -f markdown --mathjax -t html $tmpfile
