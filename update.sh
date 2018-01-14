#!/bin/bash
set -euo pipefail

readonly NAME="naarrow"

readonly tmpDir=/tmp/deliver-$NAME-$$
trap "rm -rf $tmpDir" EXIT
mkdir -p $tmpDir

make clean
./check

#------------------------------------------------------------------------------
# create game directory
#------------------------------------------------------------------------------
readonly gameDir=$tmpDir/$NAME
mkdir -p $gameDir

rsync \
  --compress \
  --delete-excluded \
  --exclude "*.dep" \
  --exclude "*.bc" \
  --exclude "*.o" \
  --exclude "*.deps" \
  -vr bin/asmjs/* $gameDir
cp index.html $gameDir/index.html

#------------------------------------------------------------------------------
# archive it
#------------------------------------------------------------------------------
pushd $tmpDir
zip $NAME.zip -r $NAME
popd

mv $tmpDir/$NAME.zip .

#------------------------------------------------------------------------------
# upload it to code.alaiwan.org
#------------------------------------------------------------------------------
rsync \
  --compress \
  --delete \
  -vr $gameDir/* alaiwans@code.alaiwan.org:public_html/games/$NAME

