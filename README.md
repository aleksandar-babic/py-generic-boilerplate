# Python Generic Boilerplate

### Initialize local environment

Requirements:

- Python 3.10+
- Poetry (`curl -sSL https://install.python-poetry.org | python3 -`)
- Make

#### Setup

```shell
poetry install
poetry shell
make init
```

## Static analysis

Static analysis utilizes following external tools

- `black`
- `isort`
- `flake8`
- `bandit`
- `safety`
- `mypy`

In order to run all of them together simply run `make static`.

## Unit tests

Unit tests utilize following external tools

- `assertpy`
- `pytest`
- `pytest-cov`
- `responses`

In order to execute the unit tests run `make test` or to create a code coverage report run `make test_report`.

## Running in Docker

```shell
cp .env.example .env
vim .env # Change all required values
docker build -t py-generic-boilerplate .
docker run --rm --env-file .env py-generic-boilerplate
```

## GitHub Actions

#### Docker image build & push Workflow (on push event)

Push workflow is located at [.github/workflows/push.yaml](.github/workflows/push.yaml) and does the following:

1. Installs Python
2. Install dependencies
3. Runs pre-commit
4. Runs unit tests
5. Builds the `Dockerfile`
6. Pushes the image to the GCR registry with `latest` tag
7. Pushes the image to the GCR registry with `<COMMIT_SHA>` tag

The workflow requires 2 secrets to be present:

1. `GCLOUD_PROJECT_ID` - GCP project ID
2. `GCLOUD_SERVICE_KEY` - Base64 encoded service account JSON (`python3 -m base64 -e < sa.json`)

> In order to successfully run the workflow, provided SA must have write access to GCR.

#### Test (on PR event)

PR workflow is located at [.github/workflows/pr.yaml](.github/workflows/pr.yaml) and does the following:

1. Installs Python
2. Install dependencies
3. Runs pre-commit
4. Runs unit tests
