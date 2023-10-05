# GitHub template project for Python projects

### How to create a project from a template on GitHub

1. Go to the repositories page
2. 👉 `New`
3. In `Repository template` section select `parfeniukink/python_default_configurations`
4. 👉 `Create`


</br>
</br>


# CHANGE ME: The name of the repository

</br>

<p align="left">

<a href="https://github.com/parfeniukink/python_default_configurations/releases" target="_blank">
    <img src="https://img.shields.io/github/license/parfeniukink/python_default_configurations?color=green">
</a>

<a href="https://shields.io/" target="_blank">
    <img src="https://img.shields.io/badge/python_versions-3.10+-blue.svg">
</a>

</p>


</br>


<b><p align="left">✔️ About option 1</p>
<p align="left">✔️ About option 2</p>
<p align="left">✔️ About option N</p></b>


</br>

# 🔌 Application is powered by

**Design principles:**

- ✅ [The 12-Factor App](https://12factor.net)
- ✅ [Domain driven design](https://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software-ebook/dp/B00794TAUG)


**Core tools**

- ✅ [Python3.11](https://www.python.org/downloads/release/python-3115/)
- ✅ [pip-tools](https://pipenv.pypa.io)
- ✅ [Pydantic](https://pydantic-docs.helpmanual.io)

**Code quality tools**

- ✅ [flake8](https://github.com/pycqa/flake8)
- ✅ [black](https://github.com/psf/black)
- ✅ [isort](https://github.com/PyCQA/isort)
- ✅ [mypy](https://github.com/python/mypy)
- ✅ [pytest](https://github.com/pytest-dev/pytest)

**Infrastructure**

- ✅ [Docker](https://docs.docker.com/get-docker/)
- ✅ [PostgeSQL 13](https://www.postgresql.org/docs/13/release-13-3.html)
- ✅ [Redis](https://redis.io)

## ✋ Mandatory steps

### 1. Clone the project 🌐

```bash
git clone https://github.com/parfeniukink/CHANGE_ME.git
```

### 2. Setup environment variables ⚙️

👉 Project is configured via environment variables.
You have to export them into your session from which you are running the application locally of via Docker.

👉 All default variables configured for making easy to run application via Docker in a few clicks.

> 💡 All of them you can find in `.env.default`

#### 2.1 Description 📜

| Key | Default value | Description |
| --- | ------------- | ----------- |
| `PYTHONPATH` | `src/` | [Documentation](https://docs.python.org/3.10/using/cmdline.html#envvar-PYTHONPATH) |
| `PIPENV_EXTRA_ARGS` | "--dev" | Additional pipenv arguments passing configuration |
| `REDIS_URL` | `redis://redis` | Redis URL that should match pattern: `redis_protocol://username:password@host:port/db_index` |
| `POSTGRES_HOST` | `postgres` | The database host |
| `POSTGRES_PORT` | `5432` | The database port |
| `POSTGRES_USER` | `postgres` | The database username |
| `POSTGRES_PASSWORD` | `postgres` | The database user's password |
| `POSTGRES_DB` | `CHANGE_ME` | The database database name |

##### ✋ Mandatory:

#### 2.2 Create `.env` file for future needs

It is hightly recommended to create `.env` file as far as it is needed for setting up the project with Local and Docker approaches.

```bash
cp .env.default .env
```

## 👨‍🦯 <span>Local development</span>

### 1. Decide how would you run storages 🤔

#### 1.1 Setup locally

✅ [🐧 Linux](https://redis.io/docs/getting-started/installation/install-redis-on-linux/)

✅ [ MacOs](https://redis.io/docs/getting-started/installation/install-redis-on-mac-os/)



### 🐳 With Docker

🔗  [Docker installation](https://docs.docker.com/get-docker/)

```bash
# Run docker-compose services as deaemon
docker-compose build
docker-compose up -d
```
> Note: It will create 2 containers: **family_budget_bot_app** and **family_budget_bot_postgres**

> Note: database volume is static for the app. It means, that after removing any container your data will not be removed.


### 🐭 With NO Docker

#### Install dependencies with Pipenv & activate virtual environment
🔗  [Pipenv official page](https://pipenv.pypa.io)

```bash
# Install poetry
pip3 install -U pipenv

# Install dependencies
pipenv sync --dev

# Run the application
CHANGEME...
```


## 🐘 Additional information
