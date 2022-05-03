# GitHub template project for Python projects

### How to create a project from a template on GitHub

1. Go to the repositories page
2. 👉 `New`
3. In `Repository template` section select `parfeniukink/python_default_configurations`
4. 👉 `Create`


</br>
</br>


### Install dependencies
---
#### Install dev-dependencies with poetry
⚠️   First of all you have to specify `name` in `pyproject.toml` file

```bash
poetry install
poetry shell
```

> NOTE: Poetry installation command will create a `poetry.lock` file.

> NOTE: Remove lines before the README template


</br>
</br>


### ⬇️  ⬇️  Project README file template ⬇️  ⬇️ 
# Project name

About this project

</br>
</br>

## Setup the environment


### Mandatory steps

#### Create environment configuration file based on `.env.example`
```bash
cp .env.example .env

# Complete next variables:
# Descriptions
```

#### Install [pre-commit hooks](https://pre-commit.com/#install)
```bash
pre-commit install
```


</br>
</br>

## Setup
### with Docker

🔗  [Install Docker](https://docs.docker.com/get-docker/)

```bash
# Run docker-compose services
docker-compose up

# Build the image
docker build --platform=linux/arm64 -t {image_name} ./compose/python

```


</br>

### with NO Docker

##### Install dependencies with Poetry & activate virtual environment
🔗  [Poetry official page](https://python-poetry.org)
```bash
# Install poetry
pip3 install -U poetry

# Install dependencies
poetry install
poetry shell
```

</br>


## Usage

### with Docker

```bash
# Run the container
docker run --name {container_name} --rm {image_name}
```

</br>

### with NO Docker

</br>

## Additional information
