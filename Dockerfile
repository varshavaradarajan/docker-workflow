FROM python:alpine3.7

COPY index.html .

EXPOSE 8080

ENTRYPOINT python -m http.server 8080
