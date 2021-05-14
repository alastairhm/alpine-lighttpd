# Lighttpd running on an Alpine Docker image.

Build using;

```bash
docker build -t alpine-lighttpd .
```

Run using;

```bash
docker run --name "my-lighttpd" -p 8000:80 -v $(pwd):/var/www alastairhm/alpine-lighttpd
```

Works for static web content.
