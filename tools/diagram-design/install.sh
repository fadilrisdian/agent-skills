#!/usr/bin/env bash
# Install the diagram-design skill (https://github.com/cathrynlavery/diagram-design).
#
# Usage:
#   tools/diagram-design/install.sh                 # install in the current directory
#   tools/diagram-design/install.sh /path/to/proj   # install in a project
set -euo pipefail

[ "${1:-}" != "" ] && cd "$1"
npx skills add cathrynlavery/diagram-design
