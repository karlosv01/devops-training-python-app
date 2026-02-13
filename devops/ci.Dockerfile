FROM python:3.6-slim

# Instalamos las dependencias de sistema (make)
RUN apt-get update && apt-get install -y \
    make \
    && rm -rf /var/lib/apt/lists/*

# Preparamos el directorio de trabajo
WORKDIR /app

# Copiamos requirements e instalamos todo (incluyendo linters)
# Al hacerlo aquí, el Jenkinsfile queda limpio como querías
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt flake8 mypy

# Copiamos el resto del proyecto
COPY . .