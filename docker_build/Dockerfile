FROM cgr.dev/chainguard/python:3.8.5-slim

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python", "app.py"]
