# Security Policy

## Supported versions

Security fixes are evaluated for the latest public release of the BladeCP Agent Skills. Install or update to the latest release before reporting an issue that may already be fixed.

## Reporting a vulnerability

Please report suspected vulnerabilities privately by email:

<dev@bladecp.com>

Include enough information for us to reproduce and assess the issue, such as:

- A clear description of the impact.
- The BladeCP Agent Skills version, the agent and its version.
- Reproduction steps, including the prompt or file content that triggers the behavior.
- Relevant output, with API keys, customer information and other sensitive data removed.

Do not open a public GitHub issue, publish exploit details or share a proof of concept that could expose users while the issue is being assessed.

## What to report here

- A skill that leads an agent to reveal, print, store or forward an API key.
- A skill that leads an agent to approve, cancel or retry a migration without an explicit instruction from the user.
- Prompt injection through documentation, backups, tool results or repository content that the skills fail to treat as data.
- A plugin manifest or MCP configuration that sends a credential to a host other than `mcp.bladecp.com`.
- A release artifact whose content or checksum does not match this repository.

Vulnerabilities in the BladeCP MCP server, the BladeCP CLI or the BladeCP API can be reported to the same address.

## What happens next

We will acknowledge the report, assess its impact and coordinate an appropriate fix and disclosure. We do not publish a fixed response-time commitment. Please allow time for investigation and, where needed, for users to update safely.

## Scope

This policy covers the content distributed from [`bladecp/skills`](https://github.com/bladecp/skills). For issues in third-party software, including the agents that load these skills, please contact the relevant vendor as well.

See also [the security model of the skills](docs/security.md).
