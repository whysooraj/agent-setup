$ErrorActionPreference = 'Stop'
$Repo = "whysooraj/agent-setup"
$Branch = "main"
$ZipUrl = "https://github.com/$Repo/archive/refs/heads/$Branch.zip"

Write-Host "=== AI Agent Environment Installer (Windows) ===" -ForegroundColor Cyan

$DestHome = $env:USERPROFILE
$DestAgents = Join-Path $DestHome ".agents"
$DestGeminiMcp = Join-Path $DestHome ".gemini\antigravity-cli\mcp"
$DestGeminiPlugins = Join-Path $DestHome ".gemini\config\plugins"

New-Item -ItemType Directory -Force -Path $DestAgents | Out-Null
New-Item -ItemType Directory -Force -Path $DestGeminiMcp | Out-Null
New-Item -ItemType Directory -Force -Path $DestGeminiPlugins | Out-Null

$TempZip = Join-Path $env:TEMP "agent-setup.zip"
$TempDir = Join-Path $env:TEMP "agent-setup-extract"

if (Test-Path $TempDir) {
    Remove-Item -Recurse -Force $TempDir
}
New-Item -ItemType Directory -Force -Path $TempDir | Out-Null

Write-Host "Downloading bundle from GitHub..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $ZipUrl -OutFile $TempZip -UseBasicParsing

Write-Host "Extracting archive..." -ForegroundColor Yellow
Expand-Archive -Path $TempZip -DestinationPath $TempDir -Force

$SourceRoot = Join-Path $TempDir "agent-setup-$Branch"

Write-Host "Installing skills and agent config to $DestAgents..."
Copy-Item -Path (Join-Path $SourceRoot "agents\*") -Destination $DestAgents -Recurse -Force

Write-Host "Installing MCP tools to $DestGeminiMcp..."
Copy-Item -Path (Join-Path $SourceRoot "gemini\mcp\*") -Destination $DestGeminiMcp -Recurse -Force

Write-Host "Installing plugins to $DestGeminiPlugins..."
Copy-Item -Path (Join-Path $SourceRoot "gemini\plugins\*") -Destination $DestGeminiPlugins -Recurse -Force

if (Test-Path (Join-Path $SourceRoot "root_configs\AGENTS.md")) {
    Copy-Item -Path (Join-Path $SourceRoot "root_configs\AGENTS.md") -Destination (Join-Path $DestHome "AGENTS.md") -Force
}

if (Test-Path (Join-Path $SourceRoot "root_configs\GEMINI.md")) {
    Copy-Item -Path (Join-Path $SourceRoot "root_configs\GEMINI.md") -Destination (Join-Path $DestHome "GEMINI.md") -Force
}

Remove-Item -Force $TempZip -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force $TempDir -ErrorAction SilentlyContinue

Write-Host "=== Installation complete ===" -ForegroundColor Green
Write-Host "Restored:"
Write-Host " - Skills and rules: $DestAgents"
Write-Host " - MCP tools:       $DestGeminiMcp"
Write-Host " - Plugins:         $DestGeminiPlugins"
Write-Host " - System rules:    $DestHome\AGENTS.md, $DestHome\GEMINI.md"
