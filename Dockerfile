FROM python:3.10-slim

RUN set -e

COPY ./requirements.txt /code/requirements.txt

ARG PROXY
RUN if [ -z "$PROXY" ] ; then \
        echo no PROXY; \
        apt-get update && apt-get upgrade -y && pip install --upgrade pip && apt-get autoremove && rm -rf /var/lib/apt/lists/*; \
        pip install --no-cache-dir --upgrade -r /code/requirements.txt; \
    else \
        echo "$PROXY"; \
        echo  "Acquire::http::Proxy \"${PROXY}\";" >> /etc/apt/apt.conf; \
        apt-get update && apt-get upgrade -y && pip install --proxy "$PROXY" --upgrade pip && apt-get autoremove && rm -rf /var/lib/apt/lists/*; \
        pip install --no-cache-dir --upgrade --proxy "$PROXY" -r /code/requirements.txt; \
    fi

COPY ./app /code/app
WORKDIR /code/app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]
