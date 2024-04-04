SRC_DIR := src
TEST_DIR := tests
DATE := $(shell date +%s000)

all: static test

.PHONY: init
init:
	pre-commit install

.PHONY: pre_commit
pre_commit:
	pre-commit run --all-files

.PHONY: fmt
fmt:
	black $(SRC_DIR) $(TEST_DIR)
	isort $(SRC_DIR) $(TEST_DIR)

.PHONY: fmt_check
fmt_check:
	black --check $(SRC_DIR) $(TEST_DIR)
	isort --check $(SRC_DIR) $(TEST_DIR)

.PHONY: lint
lint:
	flake8 $(SRC_DIR) $(TEST_DIR)

.PHONY: security
security:
	bandit -r $(SRC_DIR)
	safety scan

.PHONY: type
type:
	mypy src

.PHONY: static
static: fmt_check lint security type

.PHONY: test
test:
	pytest \
		--cov=$(SRC_DIR) $(TEST_DIR)

.PHONY: test_report
test_report:
	pytest \
		--junitxml=reports/pytest.xml \
		--cov-report term \
		--cov-report xml:reports/coverage.xml \
		--cov=$(SRC_DIR) $(TEST_DIR)
