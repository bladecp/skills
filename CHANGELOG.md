# Changelog

All notable changes to BladeCP Agent Skills are documented in this file. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses [Semantic Versioning](https://semver.org/).

## [0.2.0] - 2026-10-19

The skills now cover the whole Customer API through the BladeCP CLI 0.4.0, and the BladeCP MCP can be used by signing in with BladeCP, without a key.

### Added

- Skill `bladecp-partner`: for BladeCP partners operating their customers' services with the `bladecp partner` commands. It checks that the key is a partner key, covers the catalog, the customers' servers, BladeCP Vibe accounts, the marketplace, webhooks and partner migrations with `--json`, and sets the safety rules: read before writing, never suspend, cancel, delete, terminate or rotate a secret without the user's explicit request, and treat signing secrets and one-time sign-in links as credentials.
- Skill `bladecp-servers`: domains (`list`, `check`, `add`, `remove`), apps (`list`, `show`, `install`), WordPress (`status`, `dashboard`, `update core`, `update plugin`, `update theme`, `task`, with the `--external-id` they require) and the components catalog through the BladeCP CLI.
- Skill `bladecp`: routing for the new command groups, `bladecp api <path>` and `bladecp api list` for any Customer API route, how the BladeCP CLI answers agents (one JSON document, no questions with `--json`, short IDs), and the exit codes up to 11 with the `partner_only`, `ambiguous_id` and `update_required` errors.
- Skill `bladecp-migrate`: the offline check with `bladecp analyze` before migrating, and a pointer to `bladecp partner migrations` for partners.

### Changed

- The new commands need the BladeCP CLI 0.4.0 or later. With `--json`, a command that changes something runs without a question, so every skill sends a change only after the user asked for it.
- `bladecp-migrate` no longer says that Fast Deploy takes only WordPress sites: any site moves.
- The plugin manifests and marketplaces describe the partner skill and the new commands.
- The BladeCP MCP server can now be used by signing in with BladeCP, without a key: the READMEs, the guides and the skills describe the sign-in in place of the documentation-only mode, and list `recommend_plan` and `explain_migration` with the tools that work without signing in.

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
