FROM --platform=linux/x86_64 python:3.11-slim

# Build arguments
ARG PIPENV_EXTRA_ARGS


# Environment variables
ENV PYTHONUNBUFFERED=1

WORKDIR /app/

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


# Install Pyhton dependencies
RUN pip install --upgrade pip pipenv setuptools
COPY requirements.txt ./
RUN pip install -r requiements.txt


# Copy infrustructure scripts
COPY --chown=code:code ./compose/changeme/entrypoint /entrypoint
RUN sed -i 's/\r$//g' /entrypoint && chmod +x /entrypoint

COPY --chown=code:code ./compose/changeme/start /start
RUN sed -i 's/\r$//g' /start && chmod +x /start


# Copy project stuff
COPY ./ ./


# Select another user
USER code
