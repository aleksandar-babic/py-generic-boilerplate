FROM python:3.10-slim

WORKDIR /app

RUN pip3 install pipenv

COPY Pipfile* ./
RUN pipenv install --dev

COPY src src

ENTRYPOINT [ "pipenv", "run", "python", "src/main.py" ]
