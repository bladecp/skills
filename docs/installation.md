# Installation

This guide installs the BladeCP Agent Skills and connects the BladeCP MCP server in each supported agent. Every section follows the agent's own documentation, linked at the end of the section.

| Agent | Skills | BladeCP MCP | Account tools with your key |
| --- | --- | --- | --- |
| Claude Code | Plugin | Plugin | Read from `BLADECP_API_KEY` by the plugin |
| Codex | Plugin | Plugin, without a key | An entry in `~/.codex/config.toml` |
| Cursor | Plugin | Plugin, without a key | An entry in `~/.cursor/mcp.json` |
| Antigravity CLI | Plugin | Plugin, without a key | A server added with `agy mcp add` |
| OpenCode | Skills folder | An entry in `opencode.json` | Read from `BLADECP_API_KEY` by that entry |
| Other agents | `skills` CLI | Your agent's MCP settings | Depends on the agent |

Without a key, the BladeCP MCP server lists every tool. The documentation tools (`search_docs`, `get_doc_page` and `list_doc_pages`), `recommend_plan`, `explain_migration` and `explain_server_closing` work, and an account tool answers with a sign-in request: agents that support MCP sign-in, such as Claude Code, open the BladeCP sign-in in your browser, where you allow read-only access (`bladecp:read`). You can disconnect it later in your BladeCP account, under [Connected apps](https://secure.bladecp.com/account/applications). With a key, the read-only account tools work right away. To create the key and expose it as `BLADECP_API_KEY`, follow [API key](../README.md#api-key) in the README.

The `bladecp-migrate` skill runs the BladeCP CLI with `npx @bladecp/cli@0.4.3`, so the machine needs Node.js 20 or later. The CLI signs in on its own with `bladecp login`.

## Claude Code

Add the marketplace and install the plugin from a terminal:

```sh
claude plugin marketplace add bladecp/skills
claude plugin install bladecp@bladecp
```

Inside a session, the equivalent is:

```text
/plugin marketplace add bladecp/skills
/plugin install bladecp@bladecp
/reload-plugins
```

In a session, `/plugin install` opens the plugin details so you can choose the scope. To pin a release, add the tag to the marketplace source, for example `claude plugin marketplace add bladecp/skills#v0.1.0`.

**Key.** The plugin's MCP configuration reads `BLADECP_API_KEY` from the environment. Set the variable before you start Claude Code; after changing it, start a new session. Without the variable, Claude Code opens the BladeCP sign-in in your browser the first time the agent calls an account tool.

**Check.** `claude plugin list` shows `bladecp@bladecp` as enabled, and `/mcp` lists `bladecp` as a plugin server.

**Update.** `claude plugin marketplace update bladecp`, then `claude plugin update bladecp@bladecp`, then start a new session.

**Remove.** `claude plugin uninstall bladecp@bladecp`, then `claude plugin marketplace remove bladecp`.

References: [Install and manage plugins](https://code.claude.com/docs/en/plugins/install), [Create a marketplace](https://code.claude.com/docs/en/plugin-marketplaces), [MCP](https://code.claude.com/docs/en/mcp).

## Codex

Add the marketplace and install the plugin:

```sh
codex plugin marketplace add bladecp/skills
codex plugin add bladecp@bladecp
```

You can also open the plugin browser with `/plugins` in the Codex CLI. Start a new session after installing. To pin a release, use `codex plugin marketplace add bladecp/skills --ref v0.1.0`.

**Key.** The plugin's MCP server connects without a key, because a plugin cannot pass a key from an environment variable: the documentation and public tools work, and the account tools ask for the BladeCP sign-in where Codex supports MCP sign-in. To use the account tools with your key, add this entry to `~/.codex/config.toml`:

```toml
[mcp_servers.bladecp]
url = "https://mcp.bladecp.com/mcp"
env_http_headers = { "X-API-KEY" = "BLADECP_API_KEY" }
```

The same result from the command line, with the key sent as a bearer token: `codex mcp add bladecp --url https://mcp.bladecp.com/mcp --bearer-token-env-var BLADECP_API_KEY`. With this entry, Codex lists a single `bladecp` server that sends the key. If the variable is empty or missing, Codex does not send the header and the server works as it does without a key.

**Check.** `codex mcp list` shows `bladecp` at `https://mcp.bladecp.com/mcp`, and `/mcp` lists its tools in a session.

**Update.** `codex plugin marketplace upgrade bladecp`, then `codex plugin add bladecp@bladecp`, then start a new session.

**Remove.** `codex plugin remove bladecp@bladecp`, then `codex plugin marketplace remove bladecp`. Remove the `[mcp_servers.bladecp]` entry if you added it.

References: [Package your plugin](https://developers.openai.com/plugins/build/plugins), [MCP](https://developers.openai.com/codex/mcp), [Skills](https://developers.openai.com/codex/skills).

## Cursor

In Cursor, open **Customize**, choose **From GitHub Repository**, enter `https://github.com/bladecp/skills` and install the `bladecp` plugin with the user or project scope. On Teams and Enterprise plans, an administrator can instead add the repository as a team marketplace in **Dashboard > Plugins & MCPs > Add Marketplace > Import from Repo**.

To try it without importing, copy the repository, or the `bladecp` folder of a release archive, to `~/.cursor/plugins/local/bladecp` and run **Developer: Reload Window**.

**Key.** The plugin's MCP server connects without a key: the documentation and public tools work, and the account tools ask for the BladeCP sign-in where Cursor supports it. To use the account tools with your key, add this entry to `~/.cursor/mcp.json` without removing the servers already there:

```json
{
  "mcpServers": {
    "bladecp": {
      "url": "https://mcp.bladecp.com/mcp",
      "headers": {
        "X-API-KEY": "${env:BLADECP_API_KEY}"
      }
    }
  }
}
```

The variable must be visible to the Cursor process. If the account tools do not show up, open Cursor from a terminal where the variable is exported. If the plugin's `bladecp` server also shows up, turn it off in **Customize** to avoid duplicate documentation tools.

**Check.** **Customize** lists the `bladecp` plugin with four skills, and the MCP list shows `bladecp`.

**Update and remove.** Manage the plugin in **Customize**. For a local copy, replace the folder and reload the window.

References: [Plugins](https://cursor.com/docs/plugins), [Skills](https://cursor.com/docs/skills), [MCP](https://cursor.com/docs/mcp).

## Antigravity CLI

Install the plugin from the repository:

```sh
agy plugin install https://github.com/bladecp/skills
```

Inside a session, `/plugin` opens the plugin manager. The plugin installs the four skills and the BladeCP MCP server without a key, from `mcp_config.json`: the documentation and public tools work, and the account tools ask for the BladeCP sign-in where Antigravity supports it. In the Antigravity app and IDE, you can also copy the plugin folder to `~/.gemini/config/plugins/bladecp`.

**Key.** Antigravity does not document environment variable expansion in MCP headers. To use the account tools with your key, run this in your own terminal, not through an agent:

```sh
agy mcp add --header "X-API-KEY: $BLADECP_API_KEY" bladecp-account https://mcp.bladecp.com/mcp
```

Your shell expands the variable when the command runs, so the key is stored as a value in `~/.gemini/config/mcp_config.json`. Keep that file private, for example with `chmod 600 ~/.gemini/config/mcp_config.json`, and run the command again after you rotate the key. The documentation tools then appear twice, once per server.

**Check.** `agy plugin list` shows `bladecp` with 4 skills and 1 MCP server, and `agy mcp list` shows `bladecp-account` when you added it.

**Update.** Run the install command again.

**Remove.** `agy plugin uninstall bladecp`, and `agy mcp remove bladecp-account` if you added it.

References: [Plugins](https://antigravity.google/docs/plugins), [Agent skills](https://antigravity.google/docs/skills), [MCP](https://antigravity.google/docs/mcp).

## OpenCode

OpenCode loads skills from folders. Copy the four skills to your global skills folder:

```sh
git clone --depth 1 https://github.com/bladecp/skills.git bladecp-skills
mkdir -p ~/.config/opencode/skills
cp -R bladecp-skills/skills/. ~/.config/opencode/skills/
```

For a single project, copy them to `.opencode/skills/` in that project instead. OpenCode also reads `~/.agents/skills/`. The [`skills`](https://skills.sh) CLI does the same in one step: `npx -y skills add bladecp/skills --skill '*' -a opencode -g`.

**MCP and key.** Add the server to `~/.config/opencode/opencode.json`, keeping the settings already there:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "bladecp": {
      "type": "remote",
      "url": "https://mcp.bladecp.com/mcp",
      "oauth": false,
      "headers": {
        "X-API-KEY": "{env:BLADECP_API_KEY}"
      }
    }
  }
}
```

With `"oauth": false`, OpenCode uses the key and does not open the BladeCP sign-in. If the variable is not set, OpenCode sends an empty value, and only the tools that need no sign-in work.

**Check.** `opencode debug skill` lists `bladecp`, `bladecp-migrate`, `bladecp-partner` and `bladecp-servers`, and `opencode mcp list` shows `bladecp`.

**Update.** Pull the repository again and repeat the copy, or run `npx -y skills update -g`.

References: [Agent Skills](https://opencode.ai/docs/skills/), [MCP servers](https://opencode.ai/docs/mcp-servers/), [Config](https://opencode.ai/docs/config/).

## Other agents

Install only the skills with the [`skills`](https://skills.sh) CLI, which knows the skills folder of many agents:

```sh
npx -y skills add bladecp/skills --skill '*'
```

Then add the MCP server in your agent's settings: address `https://mcp.bladecp.com/mcp` (streamable HTTP), with the `X-API-KEY` header read from an environment variable. If your agent only supports bearer tokens, the server also accepts `Authorization: Bearer <key>`. Without a header, the account tools need the BladeCP sign-in, if your agent supports MCP sign-in. Never write the key itself into a versioned file.

## Install from a release archive

Each [release](https://github.com/bladecp/skills/releases) includes `bladecp-skills-<version>.zip` and `SHA256SUMS`. Verify the download before you use it:

```sh
shasum -a 256 -c SHA256SUMS
```

On Linux, use `sha256sum -c SHA256SUMS`. The archive contains one `bladecp` folder, which is the plugin root:

- Claude Code: `claude --plugin-dir ./bladecp` loads it for one session.
- Cursor: copy it to `~/.cursor/plugins/local/bladecp`.
- Antigravity CLI: `agy plugin install ./bladecp`.
- OpenCode and other agents: copy `bladecp/skills/` to the agent's skills folder.
