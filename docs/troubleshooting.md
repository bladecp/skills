# Troubleshooting

## The BladeCP MCP server

| Symptom | What to check |
| --- | --- |
| Only `search_docs`, `get_doc_page` and `list_doc_pages` show up | No key reached the server, so it runs in documentation-only mode. Check that `BLADECP_API_KEY` is set in the environment where the agent starts, then start a new session. In Codex, Cursor and Antigravity CLI, the plugin's server never carries the key: add the entry described in [Installation](installation.md) for that agent. |
| The account tools answer with an authentication error | The key expired or was revoked. Create a new key in the Hub and update the variable. In Antigravity CLI, run `agy mcp add` again with the new key. |
| An account tool answers `403` with `insufficient_scope` | The key lacks a scope. Ask the agent to run `get_account` to see the scopes in use, then create a key with the scope the task needs. |
| No `bladecp` server at all | The plugin is not installed or is disabled, or the MCP entry is missing. Install it again. Meanwhile, the agent can use the BladeCP CLI read commands with `--json`. |
| Documentation tools appear twice | Two servers point to the BladeCP MCP. In Cursor, turn off the plugin's `bladecp` server in **Customize**. In Antigravity CLI this is expected when you added `bladecp-account`. |
| The connection times out | Check that the machine can reach `mcp.bladecp.com` over HTTPS, including through any proxy or firewall. |

## Installation

| Agent | Symptom | What to check |
| --- | --- | --- |
| Claude Code | `claude plugin install` cannot find the plugin | Add the marketplace first with `claude plugin marketplace add bladecp/skills`, then install with the full id, `bladecp@bladecp`. |
| Claude Code | The skills do not appear in the current session | Run `/reload-plugins`, or start a new session. |
| Claude Code | The key changed but the tools did not | Claude Code reads the variable at startup. Start a new session. |
| Codex | The plugin is not listed | Run `codex plugin marketplace list` to confirm the `bladecp` marketplace, then `codex plugin add bladecp@bladecp`. |
| Codex | The account tools do not appear | Confirm the `[mcp_servers.bladecp]` entry in `~/.codex/config.toml` with `codex mcp list`, and that the variable is set before Codex starts. |
| Cursor | **From GitHub Repository** does not find a plugin | Use the repository address `https://github.com/bladecp/skills`. The repository provides `.cursor-plugin/marketplace.json`. |
| Cursor | A local copy does not load | The folder must be `~/.cursor/plugins/local/bladecp`, not a symbolic link to another location. Run **Developer: Reload Window**. On Teams and Enterprise, local plugin imports may be turned off by an administrator. |
| Cursor | The account tools do not appear | Open Cursor from a terminal where `BLADECP_API_KEY` is exported, so the process can read `${env:BLADECP_API_KEY}`. |
| Antigravity CLI | `agy plugin list` shows no MCP server | Update to the latest release of the plugin, which ships `mcp_config.json`. |
| OpenCode | `opencode debug skill` does not list the skills | Each skill must be a folder with `SKILL.md` directly under `~/.config/opencode/skills/`, for example `~/.config/opencode/skills/bladecp/SKILL.md`. |

## The BladeCP CLI

| Symptom | What to check |
| --- | --- |
| `npx` is missing | Install Node.js 20 or later. |
| `bladecp whoami --json` exits with code 3 | You are not signed in. Run `bladecp login` in your own terminal. |
| The browser does not open on `bladecp login` | Run `bladecp login --no-browser` and open the address it prints on the same computer. |
| A migration stops with exit code 10 | BladeCP is waiting for you, for example to confirm the domain. The skill `bladecp-migrate` explains the next step. |

For the complete CLI behavior, see the [BladeCP CLI documentation](https://developers.bladecp.com/cli).

## Get help

Open an issue with the agent, its version, the plugin version and the sanitized error message. Never include an API key. For vulnerabilities, follow [SECURITY.md](../SECURITY.md).
