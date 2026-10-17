# Changelog

All notable changes to BladeCP Agent Skills are documented in this file. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses [Semantic Versioning](https://semver.org/).

## [0.1.0] - 2026-10-17

First public release.

### Added

- Skill `bladecp`: what BladeCP offers developers, which tool fits each task, how to read the BladeCP Developers documentation, API keys and safety rules.
- Skill `bladecp-migrate`: migrating a cPanel full backup with the BladeCP CLI, from login to the private preview, with approval left to the user. The migration is complete once approved; pointing the domain is optional and relayed with the values BladeCP returns.
- Skill `bladecp-servers`: read-only inspection of account, servers, usage, domains and migrations through the BladeCP MCP, and troubleshooting of failed migrations.
- Plugin manifests and marketplaces for Claude Code, Codex, Cursor and Antigravity, plus a portable Agent Plugins manifest.
- BladeCP MCP server at `https://mcp.bladecp.com/mcp`, with the key read from `BLADECP_API_KEY` and a documentation-only mode without a key.
- Installation guides for Claude Code, Codex, Cursor, Antigravity CLI, OpenCode and other agents, plus security, troubleshooting, release and governance documentation.
- A deterministic release archive with `SHA256SUMS`, and public continuous integration for the skills, the manifests and the MCP configuration.
- MIT License.
