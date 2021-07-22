# Lighttpd running on an Alpine Docker image.

[![](http://dockeri.co/image/alastairhm/alpine-lighttpd)](https://index.docker.io/u/alastairhm/alpine-lighttpd/)

Build using;

```bash
docker build -t alpine-lighttpd:latest .
```

Run using;

```bash
docker run --name "my-lighttpd" --rm -p 8000:80 -v $(pwd):/var/www alastairhm/alpine-lighttpd
```

Works for static web content.
