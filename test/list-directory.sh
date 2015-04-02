#!/bin/bash
for d in *; do echo $d; done | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | jq .
exit 0
