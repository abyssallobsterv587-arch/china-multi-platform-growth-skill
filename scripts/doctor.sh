#!/usr/bin/env bash
set -euo pipefail

check_cmd() {
  local name="$1"
  local hint="$2"
  if command -v "$name" >/dev/null 2>&1; then
    printf "OK   %s\n" "$name"
  else
    printf "MISS %s - %s\n" "$name" "$hint"
  fi
}

echo "China Growth Ops Doctor"
echo

check_cmd git "Install Git for repository workflows."
check_cmd gh "Install and authenticate GitHub CLI for repo publish flows."
check_cmd openclaw "Install OpenClaw if you want browser-assisted execution."

if [ -d "/Applications/Google Chrome.app" ]; then
  echo "OK   chrome"
else
  echo "MISS chrome - Install Google Chrome for browser-assisted flows."
fi

echo
echo "Recommended next step:"

if ! command -v gh >/dev/null 2>&1; then
  echo "- Set up GitHub CLI first if you want one-command publish flows."
elif ! command -v openclaw >/dev/null 2>&1; then
  echo "- Install OpenClaw next if you want browser-assisted execution."
else
  echo "- Environment is good enough for draft-first runs."
fi
