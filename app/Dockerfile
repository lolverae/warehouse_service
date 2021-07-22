FROM python:3.7.11-slim-buster

WORKDIR /opt

COPY requirements.txt main.py productProviders.py .

RUN pip install virtualenv \
  && virtualenv venv

RUN . /opt/venv/bin/activate

RUN pip install -r requirements.txt

