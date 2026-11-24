
# Adapted from docker-uv-renv by Daniel Chen (MIT License)
# https://github.com/chendaniely/docker-uv-renv

# Start from Ubuntu Linux. It has no Python: uv installs it.
FROM ubuntu:24.04

# Copy the uv program into the image
COPY --from=ghcr.io/astral-sh/uv:0.13.7 /uv /uvx /usr/local/bin/

# Work in the /workspace folder inside the image
WORKDIR /workspace

# Put the packages in /opt/venv
ENV UV_PROJECT_ENVIRONMENT=/opt/venv

# Copy the files that list your packages
COPY pyproject.toml uv.lock .python-version ./

# Install Python and the exact packages in uv.lock
RUN uv sync --locked
