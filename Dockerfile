FROM python:3.10-slim

WORKDIR /app

RUN apt update && \
    apt install -y curl && \
    curl -sSL https://install.python-poetry.org | env POETRY_HOME=/usr/local python3 -

COPY pyproject.toml ./
COPY poetry.lock ./
RUN poetry install

COPY src src

ENTRYPOINT [ "poetry", "run", "python", "src/main.py" ]
