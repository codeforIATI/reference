#!/bin/bash

./gen_rst.sh || exit $?
./gen_html.sh || exit $?

echo '<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' > docs/en/_build/dirhtml/sitemap.xml
find docs/en/_build/dirhtml | grep -v _static | grep index.html$ | sed 's|index.html$|</loc></url>|' | sed "s|docs/en/_build/dirhtml|<url><loc>http://`cat URL`|" >> docs/en/_build/dirhtml/sitemap.xml
echo '</urlset>' >> docs/en/_build/dirhtml/sitemap.xml

# sed -i 's/\.\.\//\//g' docs/en/_build/dirhtml/404/index.html
