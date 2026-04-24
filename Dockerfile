FROM python:3.12-slim

WORKDIR /app

RUN pip install mlflow huggingface_hub fastapi httpx prometheus-client

COPY . .

RUN chmod +x *.sh

EXPOSE 8080 8081 5000 9090 3001

CMD ["./config/multi-model-gateway.sh"]
