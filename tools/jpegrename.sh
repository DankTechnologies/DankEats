#!/bin/bash
n=10; ls *.jpg | sort -V | while read -r file; do mv -n "$file" "$(printf "%03d.jpg" $n)"; n=$((n+10)); done
