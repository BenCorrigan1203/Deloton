FROM python:3.10
WORKDIR /app

ADD requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]