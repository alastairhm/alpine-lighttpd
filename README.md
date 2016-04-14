Lighttpd running on an Alpine Docker image.

Build using;

docker build -t alpine-lighttpd .

Run using;

docker run --name "my-lighttpd" -p 8000:80 -v $(pwd):/var/www alpine-lighttpd

Works for static web content.
