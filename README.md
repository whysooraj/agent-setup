# Agent Setup

Universal setup package for AI agent skills, plugins, MCP configurations, and system rules.

## Quick Install

### Windows (PowerShell)

Open PowerShell and run:

```powershell
irm https://raw.githubusercontent.com/whysooraj/agent-setup/main/install.ps1 | iex
```

### Linux / macOS / Git Bash

Run in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/whysooraj/agent-setup/main/install.sh | bash
```

## What Is Included

1. Skills: Agent capabilities under `~/.agents/skills/`.
2. Rules: Standardized behavior guidelines under `~/.agents/rules/`, `~/AGENTS.md`, and `~/GEMINI.md`.
3. MCP Server Definitions: Tool specifications under `~/.gemini/antigravity-cli/mcp/` and `~/.agents/mcp.json`.
4. Plugins: Extended tooling under `~/.gemini/config/plugins/`.

## Manual Installation

Clone the repository and run the installer directly:

```bash
git clone https://github.com/whysooraj/agent-setup.git
cd agent-setup
chmod +x install.sh
./install.sh
```
