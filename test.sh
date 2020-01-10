#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o noclobber

check() {
  declare -r URL="${1}"
  echo "* ${URL}"
  curl -s -I -L "${URL}" \
    | grep 'HTTP' \
    | sed 's/^/    /'
}

echo "=== OK case ==="
check "http://localhost/"
check "http://localhost/?status="
echo
echo "=== NG case ==="
check "http://localhost/?status=union+select"
check "http://localhost/?status=../../etc"
