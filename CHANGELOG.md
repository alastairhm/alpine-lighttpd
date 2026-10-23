# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

Dates in this file are in format of YYYY-MM-DD (2019-12-13 means 13th of December 2019).

## [Unreleased]

### Added

* Taskfile `test` task: builds the image, runs it, and checks that a
  dotfile under `html/` (e.g. `.env`) is denied by `mod_access`
* `html/.env` sample dotfile used by the `test` task
* `CLAUDE.md` with repository guidance for Claude Code
* `test` task now also checks that `/` is served as `text/html`, that
  dot-directories and `%2e`-encoded or `../` dotfile paths return 403,
  that lighttpd runs as the `lighttpd` user, and that `CMD` can be
  overridden
* `html/.hidden/secret.txt` dot-directory fixture used by the `test` task
* Woodpecker pipeline runs `task test` (via a `docker:dind` service)
  before pushing to Docker Hub

### Changed

* `push` task now depends on `test`, so a failing dotfile-deny check
  blocks the Docker Hub push
* Bumped GitHub Actions to current major versions (`checkout@v4`,
  `login-action@v3`, `build-push-action@v6`)
* GitHub workflow now runs `task test` before building, so a failing
  dotfile-deny check blocks the GHCR push
* `test` task polls for readiness instead of a fixed `sleep 1`, and
  copies `html/` into the container instead of bind-mounting it so it
  works against a remote Docker daemon

### Fixed

* Tidied `html/index.html` into a valid HTML5 document (doctype,
  charset, matching `<h1>` tags)
* GitHub workflow no longer pushes `:latest` to GHCR on pull requests;
  PRs now build and test only
* Corrected misleading trigger comment in the GitHub workflow
* Corrected invalid `3.23.1` release date (`2026-06-31` -> `2026-07-31`)

## [[3.23.1]](https://github.com/alastairhm/alpine-lighttpd/releases/tag/3.23.1) - 2026-07-31

* Build with 3.23 Alpine base image
* Build with 3.22 Alpine base image
* Woodpecker pipeline

### Fixed

* Run lighttpd as the package-provided `lighttpd` user instead of creating a
  redundant, unpinned-uid `www-data` account
* Use `CMD` instead of `ENTRYPOINT` so `docker run <image> <cmd>` replaces the
  container command instead of being silently appended to lighttpd's arguments
* Deny access to dotfiles/dot-directories (e.g. `.git`) via `mod_access`, and
  updated README volume-mount example to avoid serving non-public files

## [[3.21]](https://github.com/alastairhm/alpine-lighttpd/releases/tag/3.21) - 2024-12-22

* Build with 3.19 Alpine base image
* Build with 3.18 Alpine base image
* Build with 3.17 Alpine base image
* Build with 3.15 Alpine base image
* Build with 3.21 Alpine base image
* Taskfile added.

### Added

* Added GitHub action to build and push package

## [[3.14]](https://github.com/alastairhm/alpine-lighttpd/releases/tag/3.14) - 2021-07-22

### Changed

* Build with 3.14 Alpine base image
* Readme updated

## [[3.13]](https://github.com/alastairhm/alpine-lighttpd/releases/tag/3.13) - 2021-05-14

### Changed

* Build with 3.13 Alpine base image
* Readme updated

## [[3.12]](https://github.com/alastairhm/alpine-lighttpd/releases/tag/3.12) - 2020-12-14

### Changed

* Build with 3.12 Alpine base image
