FROM python:3.9.18-slim-bullseye

EXPOSE  8000

WORKDIR /app

COPY poetry.lock pyproject.toml ./

ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

RUN python -m pip install --no-cache-dir poetry==1.7.1 \
    && poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi \
    && rm -rf $(poetry config cache-dir)/{cache,artifacts}

# COPY . /app

COPY --chown=worker:worker . /app

RUN useradd -rms /bin/bash worker && chown -R worker:worker /app && chmod 700 /app

USER worker
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# ENTRYPOINT [ "sh", "./gunicorn.sh" ] Собирается , но при обращении падает! 

