FROM python:3.7.11-slim-buster

WORKDIR /opt

COPY . . 

RUN pip install virtualenv \
  && virtualenv venv

RUN . /opt/venv/bin/activate

RUN pip install -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]