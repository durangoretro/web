# Durango Retro Web Page

This is the Web Page for Durango Retro. Is Built with [MkDocs](https://www.mkdocs.org/).

## Run this web in local:

To Run this web in Local you need to install Mkdocs first. Mkdocs is a Python Package so you need to install Python and Pip first (python 3.7 or later).

```bash
pip install mkdocs mkdocs-material
```

later, you can run the web using the next command:

```bash
mkdocs serve
```

Now you can open your browser and see the url [http://localhost:8000](http://localhost:8000)

### Pipenv Support

You can use Pipenv to run this web:

First, install pipenv:

```bash
pip install pipenv
```

after install pipenv, install the dependencies:

```bash
pipenv install
```

Later, run mkdocs using pipenv:

```bash
pipenv run mkdocs serve
```

### Generate and Upload to GH-Pages

To Generate and upload to github Pages only you need to do is:

1. Checkout last version of ```gh-pages``` branch.
2. return to master branch
3. Run next command

```bash
pipenv run mkdocs gh-deploy
```
