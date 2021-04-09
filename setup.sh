rm -rf IATI-Developer-Documentation
rm -rf IATI-Guidance
rm -rf IATI-Codelists
rm -rf IATI-Extra-Documentation
rm -rf IATI-Rulesets
rm -rf IATI-Schemas

git clone https://github.com/IATI/IATI-Developer-Documentation.git

git clone https://github.com/IATI/IATI-Guidance.git
cd IATI-Guidance
# reset to an old version
git reset --hard c79fd1e3
cd ..

git clone --branch version-2.03 https://github.com/IATI/IATI-Codelists.git

git clone --branch version-2.03 https://github.com/IATI/IATI-Extra-Documentation.git
cd IATI-Extra-Documentation
# reset to an old version that has working ToCs
git reset --hard 84bcc7bd
cd ..

git clone --branch version-2.03 https://github.com/IATI/IATI-Rulesets.git
git clone --branch version-2.03 https://github.com/IATI/IATI-Schemas.git

# use a fork that has working sidebar dropdown images
git clone --branch rel-path-to-assets https://github.com/andylolz/IATI-Websites.git

cd IATI-Extra-Documentation/en
ln -s ../../IATI-Websites/iatistandard/_templates/ ./
ln -s ../../IATI-Websites/iatistandard/_static/ ./
cd ../..
ln -s IATI-Rulesets/iatirulesets ./
mkdir docs
