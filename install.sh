#!/usr/bin/env bash
set -euo pipefail

REPO="whysooraj/agent-setup"
BRANCH="main"
TAR_URL="https://github.com/${REPO}/archive/refs/heads/${BRANCH}.tar.gz"

echo "=== AI Agent Environment Installer ==="
echo "Target user: ${USER}"
echo "Target home: ${HOME}"

DEST_AGENTS="${HOME}/.agents"
DEST_GEMINI_MCP="${HOME}/.gemini/antigravity-cli/mcp"
DEST_GEMINI_PLUGINS="${HOME}/.gemini/config/plugins"

mkdir -p "${DEST_AGENTS}"
mkdir -p "${DEST_GEMINI_MCP}"
mkdir -p "${DEST_GEMINI_PLUGINS}"

# Check if running locally inside cloned repo or via curl pipe
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"

if [[ -d "${SCRIPT_DIR}/agents" && -d "${SCRIPT_DIR}/gemini" ]]; then
    SOURCE_DIR="${SCRIPT_DIR}"
else
    echo "Downloading package from GitHub (${REPO}@${BRANCH})..."
    TEMP_DIR="$(mktemp -d)"
    trap 'rm -rf "${TEMP_DIR}"' EXIT

    curl -fsSL "${TAR_URL}" -o "${TEMP_DIR}/bundle.tar.gz"
    tar -xzf "${TEMP_DIR}/bundle.tar.gz" -C "${TEMP_DIR}"
    SOURCE_DIR="${TEMP_DIR}/agent-setup-${BRANCH}"
fi

echo "Installing skills and agent configuration to ${DEST_AGENTS}..."
cp -r "${SOURCE_DIR}/agents/"* "${DEST_AGENTS}/"

echo "Installing MCP tool definitions to ${DEST_GEMINI_MCP}..."
cp -r "${SOURCE_DIR}/gemini/mcp/"* "${DEST_GEMINI_MCP}/"

echo "Installing plugins to ${DEST_GEMINI_PLUGINS}..."
cp -r "${SOURCE_DIR}/gemini/plugins/"* "${DEST_GEMINI_PLUGINS}/"

echo "Installing root agent rules..."
if [[ -f "${SOURCE_DIR}/root_configs/AGENTS.md" ]]; then
    cp "${SOURCE_DIR}/root_configs/AGENTS.md" "${HOME}/AGENTS.md"
fi

if [[ -f "${SOURCE_DIR}/root_configs/GEMINI.md" ]]; then
    cp "${SOURCE_DIR}/root_configs/GEMINI.md" "${HOME}/GEMINI.md"
fi

# Ensure executable permissions on any scripts
if [[ -d "${DEST_AGENTS}/scripts" ]]; then
    chmod +x "${DEST_AGENTS}/scripts/"* 2>/dev/null || true
fi

echo "=== Installation complete ==="
echo "Restored:"
echo " - Skills and rules: ${DEST_AGENTS}"
echo " - MCP tools:       ${DEST_GEMINI_MCP}"
echo " - Plugins:         ${DEST_GEMINI_PLUGINS}"
echo " - System rules:    ${HOME}/AGENTS.md, ${HOME}/GEMINI.md"
