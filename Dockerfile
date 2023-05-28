FROM python:3.10

COPY ./pyproject.toml /

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sSL https://install.python-poetry.org/ | POETRY_HOME=/tools/poetry python3 - && \
    /tools/poetry/bin/poetry config virtualenvs.create false && \
    /tools/poetry/bin/poetry install --no-interaction

COPY ./project /project/

WORKDIR /

CMD ["python3", "application.py"]