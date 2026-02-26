FROM python:3.12 AS base

#Тут нужно указать название вашей папки с проектом
WORKDIR /CI-CD_template

# Обновляем pip перед установкой зависимостей
RUN pip install --upgrade pip setuptools wheel


FROM base AS flask-app
#Тут нужно указать название вашей папки с проектом
ENV PYTHONPATH=/CI-CD_template
WORKDIR /CI-CD_template/code
RUN pip install --no-cache-dir -r requirements.txt
ENV PORT=8080
CMD ["sh", "-c", "exec gunicorn main_yandex_api:asgi_app -w 1 -k uvicorn.workers.UvicornWorker -b 0.0.0.0:${PORT:-8080} --timeout 45 --asgi-lifespan on --access-logfile - --error-logfile -"]
