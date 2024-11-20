#
FROM python:3.10

#
USER root
WORKDIR /code

#
COPY ./requirements.txt /code/requirements.txt

#
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

#
COPY ./app /code/app

#
RUN useradd -ms /bin/bash 1000

WORKDIR /code

ENTRYPOINT ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
# ENTRYPOINT ["sh", "-c", "sleep 600"]
USER 1000
