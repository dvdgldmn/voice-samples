#!/usr/bin/env bash
# Публикует папку как публичный репозиторий dvdgldmn/voice-samples + GitHub Pages и печатает ссылку.
set -e; cd "$(dirname "$0")"
[ -d .git ] || { git init -q -b main; git add index.html *.mp3; git -c user.name=David -c user.email=noreply@users.noreply.github.com commit -qm "Voice samples"; }
gh repo create dvdgldmn/voice-samples --public --source=. --push
gh api -X POST repos/dvdgldmn/voice-samples/pages -f "source[branch]=main" -f "source[path]=/" --jq .html_url
