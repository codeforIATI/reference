#!/bin/bash
set -o nounset

# Remove docs (the output directory), and recreate
rm -r docs/*

# Generate csvs etc. from codelists
cd IATI-Codelists || exit 1
./gen.sh || exit 1
cd .. || exit 1


# Generate documentation from the Schema and Codelists etc
python gen.py || exit 1

# Copy rulesets SPEC
cp IATI-Rulesets/SPEC.rst docs/en/rulesets/ruleset-spec.rst

cd docs || exit 1

mkdir en/developer
cp -n ../IATI-Developer-Documentation/*.rst en/developer
cp -rn ../IATI-Developer-Documentation/*/ en/developer
mkdir en/guidance
cp -n ../IATI-Guidance/en/*.rst en/guidance
cp -rn ../IATI-Guidance/en/*/ en/guidance
mv en/guidance/404.rst en/
mv en/guidance/upgrades* en/
mv en/guidance/introduction* en/
mv en/guidance/key-considerations* en/
mv en/guidance/license* en/
cp ../combined_sitemap.rst en/sitemap.rst

cp ../conf.py en/

cd .. || exit 1
