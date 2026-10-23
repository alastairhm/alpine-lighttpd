# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A minimal Docker image: Alpine + the `lighttpd` package, serving static files from `/var/www` (intended to be supplied as a volume mount). There is no application code. The whole image is `Dockerfile` + `lighttpd.conf`. `html/` is sample content used for local runs and the smoke test.

## Commands

Tasks are defined in `Taskfile.yml` ([go-task](https://taskfile.dev)):

```bash
task build   # docker buildx build -t alastairhm/alpine-lighttpd:latest ./
task test    # build, run on host port 18080 with ./html mounted, assert GET /.env returns 403
task push    # runs test first, then pushes to Docker Hub
```

`task test` is the only test. It checks that the `mod_access` dotfile-deny rule in `lighttpd.conf` works, using `html/.env` as a deliberately "secret" fixture. Don't delete `html/.env`. If you add more checks, put them in the `test` task so they also gate `push`.

Manual run: `docker run --rm -p 8000:80 -v $(pwd)/html:/var/www alastairhm/alpine-lighttpd`

## Design constraints (from past fixes, see CHANGELOG)

- Use `CMD`, not `ENTRYPOINT`, so that `docker run <image> <cmd>` replaces the command instead of appending to lighttpd's args.
- Run as the package-provided `lighttpd` user/group (`server.username`/`groupname` in `lighttpd.conf`). Don't create extra users in the Dockerfile.
- Keep the `$HTTP["url"] =~ "(^|/)\."` deny block. Users may mount a directory broader than intended, so dotfiles and dot-directories (e.g. `.git`) must not be served.
- `mimetype.assign` is explicit and short. Add an entry to it when supporting a new static file type.

## CI / publishing

Two pipelines build from `master`, and each pushes `:latest` to a different registry:
- `.woodpecker/docker.yml` pushes to Docker Hub (`alastairhm/alpine-lighttpd`).
- `.github/workflows/deploy.yml` pushes to GHCR (`ghcr.io/<repo>`). It also runs on PRs to `master`.

## Versioning

Release tags follow the Alpine base image version (e.g. `3.23.1` for `alpine:3.23`). When bumping the base image, update the `FROM` line and add a `CHANGELOG.md` entry. The changelog uses Keep a Changelog format with an `[Unreleased]` section and `YYYY-MM-DD` dates.
