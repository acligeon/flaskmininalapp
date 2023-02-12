# Dockerfile for python web app
FROM python:3.10-alpine
LABEL org.label-schema.version="V1"
ENV NODE_ENV="development"
ENV PORT_ENV=5000
ARG WD_PATH=/usr/src/app

WORKDIR ${WD_PATH}
COPY requirements.txt ./
COPY main.py ./
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "-m", "--app", "main.py", "run", "--host=0.0.0.0", "--port=${PORT_ENV}" ]