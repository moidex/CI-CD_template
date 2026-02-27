FROM python:3.12 AS base

#Тут нужно указать название вашей папки с проектом
WORKDIR /CI-CD_template

# Обновляем pip перед установкой зависимостей
RUN pip install --upgrade pip setuptools wheel


FROM base AS flask-app
#Тут нужно указать название вашей папки с проектом
COPY . /CI-CD_template/
ENV PYTHONPATH=/CI-CD_template
ENV FLASK_APP=flask_app:app
WORKDIR /CI-CD_template
RUN pip install --no-cache-dir -r requirements.txt
WORKDIR /CI-CD_template/code
CMD ["flask", "--app", "flask_app:app", "run", "--debug", "--host=0.0.0.0", "--port=8080"]

