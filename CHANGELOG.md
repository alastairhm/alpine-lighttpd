# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

Dates in this file are in format of YYYY-MM-DD (2019-12-13 means 13th of December 2019).

## [Unreleased]

## [[3.23.1]](https://github.com/alastairhm/alpine-lighttpd/releases/tag/3.23.1) - 2026-06-31

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
