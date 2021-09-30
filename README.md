# Lighttpd running on an Alpine Docker image

[![](http://dockeri.co/image/alastairhm/alpine-lighttpd)](https://index.docker.io/u/alastairhm/alpine-lighttpd/)

Build using;

```bash
docker build -t alpine-lighttpd:latest .
```

Run from Docker Hub using;

```bash
docker run --rm --name "my-lighttpd" --rm -p 8000:80 -v $(pwd):/var/www alastairhm/alpine-lighttpd
```

Or from GitHub packages using;

```bash
docker run --rm --name "my-lighttpd" --rm -p 8000:80 -v $(pwd):/var/www ghcr.io/alastairhm/alpine-lighttpd:latest
```

Works for static web content.

```text
          _    _ __  __ 
    /\   | |  | |  \/  | Email   : alastair@montgomery.me.uk
   /  \  | |__| | \  / | Web     : https://blog.0x32.co.uk/
  / /\ \ |  __  | |\/| | Twitter : @alastair_hm
 / ____ \| |  | | |  | |
/_/    \_\_|  |_|_|  |_| (c) 2021
```
