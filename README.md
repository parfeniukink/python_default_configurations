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
- ✅ [pip-tools](https://pypi.org/project/pip-tools/)
- ✅ [Pydantic](https://pydantic-docs.helpmanual.io)

**Code quality tools**

- ✅ [ruff](https://docs.astral.sh/ruff/)
- ✅ [black](https://github.com/psf/black)
- ✅ [isort](https://github.com/PyCQA/isort)
- ✅ [mypy](https://github.com/python/mypy)
- ✅ [pytest](https://github.com/pytest-dev/pytest)

**Infrastructure**

- ✅ [Docker](https://docs.docker.com/get-docker/)
- ✅ [PostgeSQL 16](https://www.postgresql.org/about/news/postgresql-16-released-2715/)
- ✅ [Redis](https://redis.com/blog/redis-7-generally-available/)



## 🚧 Mandatory steps

### 1. Clone the project 🌐

```bash
git clone https://github.com/parfeniukink/CHANGEME.git
```


### 2. Setup environment variables ⚙️

```bash
cp .env.default .env
```

👉 Project is configured via environment variables.
You have to export them into your session from which you are running the application locally of via Docker.

👉 All default variables configured for making easy to run application via Docker in a few clicks.

> 💡 All of them you can find in `.env.default`


## ✖️ 🐳 Without docker

### 🔧 Setup the environment
👉 For running the application locally without a tool like Docker you would need to install all dependencies by yourself.

👉 First of all you have to install Python3.11 and SQLite3 on your machine since they are main infrastructure components.

Then you have to install Python dependencies that are used for running the application. For doing this we just use build-in tools and `pip-tools`.

```bash
# create the environment
virtualenv --python python3.11 venv && source venv/bin/activate

# install pip-tools
pip install pip-tools
```


Once you have `pip-tools` installed within the virtual environment let's have a look how to interact with it:
```bash
# activate the virtual environment
# unix
. ./venv/bin/activate

# windows ()
.\venv\Scripts\activate


# pin versions according to the `*.in` file
pip-compile requirements.in -o requirements.txt
pip-compile requirements.dev.in -o requirements.dev.txt

# install dependencies
pip-sync requirements.txt
pip-sync requirements.dev.txt
```



**How to install new dependency?**

```bash
"requests>=2.31" >> requirements.in
pip-compile requirements.in  # generates the requirements.txt
pip-sync  # alias to pip install -r requirements.txt
```

**Is there a good place with `pip-tools` commands?**

Yes, you can go the the `Makefile` and take a look most common used commands.
Basically, everything you have to do if you'd like to add the dependency you can reduce it to next:

```bash
"requests>=2.31" >> requirements.in
make deps.update
```


**How should I run storages?**

There are 2 ways to run your storages:
* within docker containers
* self-hosted on your operating system

For the simplisity the example with docker run will be represented.
Also, if you do not hesitate to run everything locally and you know how to manage it, obviously you don't have to read this out 😈

Make sure that you have `ports` parameter defined to expose the post on your host operating system in order to be able to connect to the service from the locally running application.

```bash
docker-compose up -d postgres redis
```


*TODO: Add the guide "how to run the application"*


### 🐳 With Docker

🔗  [Docker installation](https://docs.docker.com/get-docker/)

If you'd like to run everything within separate docker containers do next:

```bash
# Run docker-compose services as deaemon
docker-compose up -d
```

👉 database volume is static for the app. It means, that after removing any container your data will not be removed.

👉 If you'd like to debug the python code within the container you can go with any debug tool you want to, but make sure that you have `stdin_open=true` and `tty=true`

```yaml
services:
      app: &app
        stdin_open: true
        tty: true
        ...
```




## 🐘 Additional information
