#!/bin/bash

rm -rf IATI-Codelists
rm -rf IATI-Extra-Documentation
rm -rf IATI-Rulesets
rm -rf IATI-Schemas
rm -rf docs
unlink iatirulesets

git clone --branch version-2.03 https://github.com/IATI/IATI-Codelists.git
cd IATI-Codelists
git clone https://github.com/codeforIATI/IATI-Codelists-NonEmbedded.git
cd ..

git clone --branch version-2.03 https://github.com/codeforIATI/IATI-Extra-Documentation.git
cd IATI-Extra-Documentation
# reset to an old version that has working ToCs
git reset --hard 84bcc7bd
cd ..

git clone --branch version-2.03 https://github.com/IATI/IATI-Rulesets.git
git clone --branch version-2.03 https://github.com/IATI/IATI-Schemas.git

cd IATI-Extra-Documentation/en
ln -s ../../theme/iatistandard/_templates/ ./
ln -s ../../theme/iatistandard/_static/ ./
cd ../..
ln -s IATI-Rulesets/iatirulesets ./
mkdir docs
