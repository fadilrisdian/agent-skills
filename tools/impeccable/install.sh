#!/usr/bin/env bash
# Install Impeccable (https://impeccable.style) design skills into a project.
#
# Usage:
#   tools/impeccable/install.sh /path/to/project            # interactive CLI install (recommended)
#   tools/impeccable/install.sh /path/to/project --shared   # via the shared `skills` CLI
set -euo pipefail

target="${1:?usage: install.sh /path/to/project [--shared]}"
cd "$target"

if [ "${2:-}" = "--shared" ]; then
  npx skills add pbakaus/impeccable
else
  npx impeccable install
fi

echo "Next: run '/impeccable init' in your agent chat, then '/impeccable hooks on'."
