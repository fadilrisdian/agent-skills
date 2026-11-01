#!/usr/bin/env bash
# Install the OpenSpec CLI (https://openspec.dev) and optionally initialize a project.
#
# Usage:
#   tools/openspec/install.sh              # install the CLI only
#   tools/openspec/install.sh /path/to/proj  # install the CLI, then run `openspec init` there
set -euo pipefail

if ! command -v openspec >/dev/null 2>&1; then
  echo "Installing OpenSpec CLI..."
  if command -v npm >/dev/null 2>&1; then
    # Requires Node.js >= 22.12.0
    npm install -g @fission-ai/openspec@latest
  else
    curl -fsSL https://openspec.dev/cli/install.sh | sh
  fi
else
  echo "OpenSpec already installed: $(openspec --version)"
fi

if [ "${1:-}" != "" ]; then
  cd "$1"
  openspec init   # interactive: pick the agents/tools you use
fi
