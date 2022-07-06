# HTML/CSS

## Tag reference

https://www.yourhtmlsource.com/myfirstsite/tagreference.html

## Hosting Google Fonts

https://google-webfonts-helper.herokuapp.com/fonts

### Tutorial

**download fonts:**

    mkdir fonts
    curl -o ./fonts/fontfiles.zip "https://google-webfonts-helper.herokuapp.com/api/fonts/roboto-mono?download=zip&subsets=latin,latin-ext&variants=regular,700italic&formats=woff,woff2,ttf"
    unzip ./fonts/fontfiles.zip -d ./fonts

**style.css:**

    @font-face {
      font-family: 'Roboto Mono', monospace;
      src: url(fonts/roboto-mono-v12-latin-regular.woff2) format('woff2'),
           url(fonts/roboto-mono-v12-latin-regular.woff) format('woff'),
           url(fonts/roboto-mono-v12-latin-regular.ttf) format('truetype');
    }

    @font-face {
      font-family: 'Roboto Mono', monospace;
      src: url(fonts/roboto-mono-v12-latin-700italic.woff2) format('woff2'),
           url(fonts/roboto-mono-v12-latin-700italic.woff) format('woff'),
           url(fonts/roboto-mono-v12-latin-700italic.ttf) format('truetype');
      font-weight: 700;
      font-style: italic;
    }

    h1, p {
      font-family: 'Roboto Mono', monospace;
    }

    h1 {
      font-family: 'Roboto Mono', monospace;
      font-weight: 700;
      font-style: italic;
    }

**index.html:**

    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>CSS @font-face</title>
      <link rel="stylesheet" href="style.css">
    </head>
    <body>
      <h1> Roboto Mono font, 700italic </h1>
      <p> Roboto Mono font, regular </p>
    </body>
    </html>

[source](https://www.digitalocean.com/community/tutorials/css-font-face)

