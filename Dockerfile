FROM python:3.12-slim

WORKDIR /app

RUN pip3 install poetry

COPY pyproject.toml ./
COPY poetry.lock ./
RUN poetry install --without dev --no-root

COPY . .

ENTRYPOINT [ "poetry", "run", "python", "src/py_generic_boilerplate/main.py" ]
