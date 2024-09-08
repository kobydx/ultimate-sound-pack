# How do i set up a theme for a custom background(s)

This is an alpha feature, not in still, submissions from this is not allowed

For a theme that will have a custom backgrounds, There will be an way on doing this

Things you need to get:

[Tampermonkey](https://www.tampermonkey.net/)

A web service host (or cloud) that the cdn is public (if) or the service can allow you to see the image and it is in a directory

# Some (as is) Tutorials for some web hosting services

[Vercel with Github](#vercel-in-github)
[Vercel with Gitlab](#vercel-in-gitlab)
[Github pages](#github-pages)
[Neocities](#neocities)
[File Garden]()

When you need the backgrounds, you need to insert the image file name in this type of list

```js
       const images = [
    '1.png',
    '2.png',
];
```

After that here, remplaze the directory of where you have the files with your own (as well as the url of it)

```js
    let bgImageUrl = `/files/background/${selectedImage}`;
```

# Where is this loaded?

Body element, where {bgImageUrl} is the website path of your images directory reading the file names

```js
let bgImageUrl = `/files/background/${selectedImage}`;
    let bodyElement = document.body;
    
    bodyElement.style.backgroundImage = `url('${bgImageUrl}')`;
    bodyElement.style.backgroundSize = 'cover';
    bodyElement.style.backgroundRepeat = 'no-repeat';
    bodyElement.style.backgroundPosition = 'center';
```

# How do i modify the css for the background?

```js
    bodyElement.style.backgroundSize = 'cover';
    bodyElement.style.backgroundRepeat = 'no-repeat';
    bodyElement.style.backgroundPosition = 'center';
```

For a full js there it is
```js
// ==UserScript==
// @name         Background
// @version      0.1
// @match        *://*/* 
// @grant        none
// ==/UserScript==

       const images = [
    '1.png',
];

// Function to generate a random number between a given min and max, inclusive
function randomIntFromInterval(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}

// Apply the randomly selected background image to the body element
function applyRandomBackground() {
    let randIndex = randomIntFromInterval(0, images.length - 1);
    let selectedImage = images[randIndex];
    
    let bgImageUrl = `/files/background/${selectedImage}`;
    let bodyElement = document.body;
    
    bodyElement.style.backgroundImage = `url('${bgImageUrl}')`;
    bodyElement.style.backgroundSize = 'cover';
    bodyElement.style.backgroundRepeat = 'no-repeat';
    bodyElement.style.backgroundPosition = 'center';

}

// Call the function to apply the background when the page loads
applyRandomBackground();
```


## Vercel in Github

First, [Create a new repository](https://github.com/new) and name it whatever is your needs, make sure it is in private, if it is into an organization, you need to subscribe into their pro plan for deploying a repo inside your organization, If you need help with that [Visit Vercel's Pro Plan Doc](https://vercel.com/docs/accounts/plans/pro/trials)

![RepoOrg](https://files.catbox.moe/oh1ptd.png)

After the creation, upload your image files (i recommend making a folder while upolading, github supports upolading floders)

![Upolad file](https://files.catbox.moe/mwp7fr.png)

After, go into [Vercel](https://vercel.com) and sign in or register if you don't did so, after click in "Add New" --> "Project"

![New project](https://files.catbox.moe/4oupn2.png)


Select your repository, if optional change the name of your domain that will be in Vercel, Don't touch any of the settings just click on "Deploy"

![VercelSettings](https://files.catbox.moe/27fk4x.png)


If you receive an error of "404 NOT FOUND" in preview after deployment, you can safely ignore that. That's basically because this repository doesn't contain an `index.html` file. If necessary, you could also create an `index.html` file that just redirects to your main website.

![Oopsies](https://files.catbox.moe/4m4rfz.png)

In your deployed site, navigate inside of your image folder and then inside of some file - e.g. `images/myimage.png`, if it loads correctly Update bgImageUrl inside of your script to form Vercel site URL structure - without the filename.

```js
let bgImageUrl = `myimagesexample0001.vercel.app/images/${selectedImage}`;
```
Afterwards, add the file names within the const images; i recommend in `.png` and nothing else.

```js
       const images = [
    '1.png',
    '2.png',
];
```

## Vercel in Gitlab

First, [Go here to do a new repository](https://gitlab.com/projects/new) 

Select "Create blank project" And name it whatever is your needs, make sure it is in private and that "Initialize repository with a README" is turned off, if it is into an organization, you need to subscribe into vercel's pro plan for deploying a repo inside your organization, If you need help with that [Visit Vercel's Pro Plan Doc](https://vercel.com/docs/accounts/plans/pro/trials)

![New repo gitlab](https://files.catbox.moe/f1mhnv.png)

After the creation, click in "New file" after there drag your images folder into your repository, when it's done upolading click in "Source Control" in the left bar and click "Commit and push to 'main'"

![Push](https://files.catbox.moe/n79wf9.png)

if you see, "Success! Your changes have been committed." means that is up to go!

![Good](https://files.catbox.moe/w9b392.png)

After, go into [Vercel](https://vercel.com) and sign in or register if you don't did so, after click in "Add New" --> "Project"

![New project](https://files.catbox.moe/4oupn2.png)


Select your repository, if optional change the name of your domain that will be in Vercel, Don't touch any of the settings just click on "Deploy"

![VercelSettings](https://files.catbox.moe/27fk4x.png)


If you receive an error of "404 NOT FOUND" in preview after deployment, you can safely ignore that. That's basically because this repository doesn't contain an `index.html` file. If necessary, you could also create an `index.html` file that just redirects to your main website.

![Oopsies](https://files.catbox.moe/4m4rfz.png)

In your deployed site, navigate inside of your image folder and then inside of some file - e.g. `images/myimage.png`, if it loads correctly Update bgImageUrl inside of your script to form Vercel site URL structure - without the filename.

```js
let bgImageUrl = `myimagesexample0001.vercel.app/images/${selectedImage}`;
```
Afterwards, add the file names within the const images; i recommend in `.png` and nothing else.

```js
       const images = [
    '1.png',
    '2.png',
];
```

## Github pages

First, [Create a new repository](https://github.com/new) name it 'username.github.io' where 'username' is your GitHub Account Username, making the repository private needs an subscription, if you need help with that, visit [Github Pricing](https://github.com/pricing)

After the creation, upload your image files (i recommend making a folder while upolading, github supports upolading floders)

![Upolad file](https://files.catbox.moe/mwp7fr.png)

When it's done go into your settings, and click in "Pages" Under "Code and automation"

![GitPages](https://files.catbox.moe/oi37h6.png)

In "Build and deployment" Click "Source" and click in "Github Actions" after it is changed click "Create your own" name it 'main.yml' and paste this code, and save, then wait at least 10 minutes

```yaml
name: Image Repo

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]
  workflow_dispatch:

jobs:
  tutorial-job:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4
        name: Checkout Code

      - name: Display Information
        run: |
          echo "This is a repository containing images as part of the wiki tutorial."
          echo "No build or deployment steps are included."
          echo "The repository holds images by the user applied to their Tampermonkey extension, learn more aobut this in: ."
```

After 10 Minutes, go to your website navigate inside of your image folder and then inside of some file - e.g. `images/myimage.png`, if it loads correctly Update bgImageUrl inside of your script to form Vercel site URL structure - without the filename.

```js
let bgImageUrl = `myimagesexample0001.vercel.app/images/${selectedImage}`;
```
Afterwards, add the file names within the const images; i recommend in `.png` and nothing else.

```js
       const images = [
    '1.png',
    '2.png',
];
```

## Neocities

Go to your [Dashboard](https://neocities.org/dashboard) Upolad the images (from the floder), if it loads correctly, update bgImageUrl inside of your script to form Neocities site URL structure - without the filename.

```js
let bgImageUrl = `myimagesexample0001.neocities.org/images/${selectedImage}`;
```
Afterwards, add the file names within the const images; i recommend in `.png` and nothing else.

```js
       const images = [
    '1.png',
    '2.png',
];
```


## File Garden

Go [here](https://filegarden.com/login/?dest=%2F) Log in and click "Visit your garden"

![GardenGo](https://files.catbox.moe/njljmu.png)

Make a directory and upolad the files in it, make sure that the privacy is set into "Unlisted"


Update bgImageUrl inside of your script to form file garden's site URL structure with your unique hash - without the filename.

```js
let bgImageUrl = `file.garden/a978B5c4F2d1E3h6/test/${selectedImage}`;
```

Afterwards, add the file names within the const images; i recommend in `.png` and nothing else.

```js
       const images = [
    '1.png',
    '2.png',
];
```
