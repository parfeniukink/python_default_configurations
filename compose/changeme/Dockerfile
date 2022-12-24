FROM --platform=linux/x86_64 python:3.10-slim

# Build arguments
ARG PIPENV_EXTRA_ARGS


# Environment variables
ENV PYTHONUNBUFFERED=1

WORKDIR /app/

COPY poetry.lock pyproject.toml ./

RUN apt-get update \
    # dependencies for building Python packages && cleaning up unused files
    && apt-get install -y build-essential \
    libcurl4-openssl-dev libssl-dev \
    && rm -rf /var/lib/apt/lists/*


# Add local non-root user to avoid issue with files
# created inside a container being owned by root.
ARG USERNAME=code
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s /bin/bash


# Python dependencies
RUN pip install --upgrade pip pipenv setuptools

COPY Pipfile Pipfile.lock ./
RUN pipenv sync --system ${PIPENV_EXTRA_ARGS}


# Copy infrustructure scripts
COPY --chown=code:code ./compose/CHANGE_ME/entrypoint /changeme-entrypoint
RUN sed -i 's/\r$//g' /changeme-entrypoint && chmod +x /changeme-entrypoint


# Copy project stuff
COPY ./ ./


# Select another user
USER code
