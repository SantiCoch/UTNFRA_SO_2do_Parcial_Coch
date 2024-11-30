
FROM nginx
COPY index.html /usr/share/nginx/html/index.html

docker build -t web1-coch .

docker tag web1-coch santicoch810/web1-coch

docker push santicoch810/web1-coch

docker run -d -p 8080:80 santicoch810/web1-coch

