# Lighttpd running on an Alpine Docker image

[![](http://dockeri.co/image/alastairhm/alpine-lighttpd)](https://index.docker.io/u/alastairhm/alpine-lighttpd/)

Build using;

```bash
docker build -t alpine-lighttpd:latest .
```

Run from Docker Hub using;

```bash
docker run --rm --name "my-lighttpd" -p 8000:80 -v $(pwd)/html:/var/www alastairhm/alpine-lighttpd
```

Or from GitHub packages using;

```bash
docker run --rm --name "my-lighttpd" -p 8000:80 -v $(pwd)/html:/var/www ghcr.io/alastairhm/alpine-lighttpd:latest
```

Works for static web content. Mount a directory that contains only the files you
intend to serve — anything under the mounted path is reachable over HTTP, so avoid
mounting a repo root or other directory containing non-public files (e.g. `.git`,
`Dockerfile`, secrets).

```text
          _    _ __  __ 
    /\   | |  | |  \/  | Email   : alastair@montgomery.me.uk
   /  \  | |__| | \  / | Web     : https://blog.0x32.co.uk/
  / /\ \ |  __  | |\/| | Twitter : @alastair_hm
 / ____ \| |  | | |  | |
/_/    \_\_|  |_|_|  |_| (c) 2021
```
