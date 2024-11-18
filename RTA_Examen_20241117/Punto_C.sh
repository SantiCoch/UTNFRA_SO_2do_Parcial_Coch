
# Este archivo define como se construye la imagen de Docker.
FROM nginx
COPY index.html /usr/share/nginx/html/index.html

# Editamos el archivo html
nano html


# Creamos el script run.sh

# Construye la imagen
docker build -t web1-coch .
# Etiqueta la imagen con el nombre de usuario
docker tag web1-coch santicoch810/web1-coch
# Realiza un push de la imagen a Docker Hub
docker push santicoch810/web1-coch
# Ejecuta la imagen como un contenedor en el puerto 8080 del host
docker run -d -p 8080:80 santicoch810/web1-coch

