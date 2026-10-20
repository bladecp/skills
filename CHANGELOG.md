# Changelog

All notable changes to BladeCP Agent Skills are documented in this file. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses [Semantic Versioning](https://semver.org/).

## [0.2.1] - 2026-10-20

Fixes from six test rounds of the plugin in Claude Code: the skills sign in first, answer from BladeCP data and stop guessing.

### Changed

- Access starts with the BladeCP sign-in of the MCP, with an API key as the alternative; in Cursor, the Add to Cursor button comes first.
- The skills run the installed `bladecp` and fall back to `npx` only when it is missing.
- The WordPress commands on the user's own server no longer ask for `--external-id`; only a partner key adds it (BladeCP CLI 0.4.1 or later).
- The base skill names the whole product line: Stack Container, Edge Cloud, Hyper Cloud, Quantum Steel and Vibe.

### Fixed

- Counts come from the tools: `list_servers` hides deleted servers and gives a `summary`, a count of a subset takes only the rows that match, and CLI counts come from `jq`.
- A status is not usage, a missing measurement covers only the servers queried, missing plan limits are not equal limits, and a related event is not a cause.
- Identifiers stay whole, and answers follow the user's language, also passed to the tools as `locale`.
- Where email goes after pointing the domain follows the MX records, with the BladeCP nameservers or with only an A record.
- What a migration brings is described as the docs say: MySQL and MariaDB databases (PostgreSQL coming soon), and the latest changes since the backup brought at approval.
- A blocked command no longer stops the flow or turns into a request to lift the agent's permissions, and a blocked `--help` leads to the command itself.
- After the user disconnects the app, the agent says so instead of switching on its own to the CLI's separate sign-in.
- To say what a tool returns, the agent calls it; for partner data, it runs the partner command and relays the real result.

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
