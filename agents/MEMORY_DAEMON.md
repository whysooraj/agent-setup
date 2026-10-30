# Codebase Background Memory Daemon
To actively update graph memory across codebases automatically (without manual LLM calls), a background daemon is required to watch the filesystem and parse ASTs into Neo4j or Mem0.

Since Neo4j docker installation failed (auth/key issues on this machine), we use `mem0-mcp` which provides a dedicated memory server with file-backed SQLite storage and embeddings.
