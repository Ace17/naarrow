#!/bin/bash
set -euo pipefail
./check
rsync \
  --compress \
  --delete-excluded \
  --exclude "*.dep" \
  --exclude "*.bc" \
  --exclude "*.o" \
  --exclude "*.deps" \
  -vr bin/asmjs/* alaiwans@code.alaiwan.org:public_html/naarrow
