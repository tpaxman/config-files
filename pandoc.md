# Pandoc

- ATX style headers (\#, \#\#, etc): `pandoc --atx-headers -o try.md try.html`

- Converting from HTML to markdown without all the CSS stuff: [src](https://superuser.com/questions/1261472/make-pandoc-ignore-css-style-class) `pandoc -f html -t markdown_github-raw_html reduced.html -o res.md`

- Convert html directly from URL [src](https://pandoc.org/MANUAL.html): `pandoc -f html -t markdown_github-raw_html https://www.fsf.org`

