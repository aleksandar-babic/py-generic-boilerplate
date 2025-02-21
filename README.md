# Python Generic Boilerplate

### Initialize local environment

Requirements:

- Python 3.12+
- Poetry

#### Setup

```shell
poetry install --with dev
poetry shell
pre-commit install
```

## Static analysis

Static analysis utilizes following external tools

- `ruff`
- `bandit`
- `mypy`

To run the static analysis manually execute the following commands:

```shell
# Run ruff with auto-fix
ruff check --fix
# Run ruff with auto-format
ruff format
# Run bandit
bandit -c pyproject.toml -r .
# Run mypy
mypy .
```

> Ruff will run automatically on save in VSCode.

Alternatively, run `pre-commit run -a` to run all the checks at once.

## Unit tests

Unit tests utilize following external tools

- `pytest`
- `responses`

In order to execute the unit tests run `pytest --cov=src tests`.

## Running in Docker

```shell
cp .env.example .env
vim .env # Change all required values
docker build -t py-generic-boilerplate .
docker run --rm --env-file .env py-generic-boilerplate
```

## GitHub Actions

#### Test (on PR event)

PR workflow is located at [.github/workflows/pr.yaml](.github/workflows/pr.yaml) and does the following:

1. Installs Python
2. Install dependencies
3. Runs pre-commit
4. Runs unit tests
