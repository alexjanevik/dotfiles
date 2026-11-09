#!/bin/sh
# Prints ROOT/.../a/b/current: the repo root (or ~ or /) in full, then the
# last 3 directories, with anything in between collapsed to "...".
keep=3
root=$(git rev-parse --show-toplevel 2>/dev/null)
if [ -n "$root" ]; then
  prefix=${root##*/}
  rest=$(pwd -P)
  rest=${rest#"$(cd "$root" && pwd -P)"}
else
  case $PWD in
    "$HOME") printf '~'; exit ;;
    "$HOME"/*) prefix='~'; rest=${PWD#"$HOME"} ;;
    *) prefix=''; rest=$PWD ;;
  esac
fi

rest=${rest#/}
if [ -z "$rest" ]; then
  printf '%s' "${prefix:-/}"
  exit
fi

IFS=/
set -f
set -- $rest
n=$#
out=$prefix
if [ "$n" -gt "$keep" ]; then
  out=$out/...
  shift $((n - keep))
fi
for d in "$@"; do
  out=$out/$d
done
printf '%s' "$out"
