#!/usr/bin/env bash
# Rebuild the static site from the Markdown source into ../_site using Jekyll
# in a throwaway Ruby container (no local Ruby needed). The running nginx
# container serves ../_site read-only, so edits go live the moment this
# finishes — no compose restart required.
set -euo pipefail
cd "$(dirname "$0")/.."
docker run --rm \
  -u "$(id -u):$(id -g)" -e HOME=/tmp -e BUNDLE_PATH=/site/vendor/bundle \
  -v "$PWD":/site -w /site ruby:3.2 \
  bash -lc "bundle install --quiet && bundle exec jekyll build"
echo "Built _site/ — live at https://anthony-tong.com"
