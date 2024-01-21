# Usa la imagen base de Alpine Linux versión 3.19
FROM alpine:3.19

# Instala las dependencias necesarias
RUN apk add --no-cache python3-dev py3-pip

# Crea y activa el entorno virtual, luego actualiza pip
RUN python3 -m venv /venv && \
    /venv/bin/pip install --upgrade pip

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el contenido del directorio actual al directorio /app en la imagen
COPY . .

# Activa el entorno virtual y luego instala las dependencias del proyecto
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

# Comando predeterminado que se ejecuta al iniciar el contenedor
CMD ["/venv/bin/python3", "app.py"]




