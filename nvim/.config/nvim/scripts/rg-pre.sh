#!/bin/sh
# ripgrep preprocessor: make .docx contents searchable by converting them to
# plain text on the fly. Only invoked for files matching --pre-glob (see fzf.lua),
# so the cat branch is just a safety net.
case "$1" in
  *.docx) exec pandoc "$1" -t plain 2>/dev/null ;;
  *)      exec cat "$1" ;;
esac
