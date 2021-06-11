#!/bin/bash
set -o nounset

# Remove docs (the output directory), and recreate
rm -rf docs
mkdir docs

# Generate csvs etc. from codelists
cd IATI-Codelists || exit 1
./gen.sh || exit 1
cd .. || exit 1


# Generate documentation from the Schema and Codelists etc
python gen.py || exit 1

# Copy rulesets SPEC
cp IATI-Rulesets/SPEC.rst docs/en/rulesets/ruleset-spec.rst

cd docs || exit 1

cp ../combined_sitemap.rst en/sitemap.rst
mv en/reference.rst en/index.rst

cp ../conf.py en/

cd .. || exit 1
