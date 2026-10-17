# Repository governance

This document describes the intended governance for the public `bladecp/skills` repository. It is a recommendation for the repository owners to apply. It does not claim that any GitHub setting has already been enabled.

## Public collaboration

The public GitHub repository keeps a focused, reviewable history of the skills, the plugin manifests and their published releases.

Public issues and pull requests are welcome. Maintainers review them in GitHub for transparency. An approved contribution follows the complete validation and release process before it appears in a published release, so a merged pull request may not appear in a release right away.

After the first public release, history remains normal and append-only. Do not rewrite public commits or force-push public branches.

## Recommended GitHub settings

For the default branch, repository owners should consider enabling:

- Pull requests before merge.
- At least one approving review for changes made by contributors.
- Dismissal of stale approvals when new commits are pushed.
- Required successful checks from the public continuous integration workflow.
- Conversation resolution before merge.
- Blocked force-pushes and branch deletion.
- Private vulnerability reporting, in addition to the email address in [SECURITY.md](../SECURITY.md).

Restrict release creation and version tags to trusted maintainers.

## Issues and pull requests

Use the issue templates for bugs and feature requests. A good report names the agent and its version, the BladeCP Agent Skills version, a concise reproduction path and the observed result.

Never include API keys, backup contents, customer records, private addresses, full logs or screenshots containing sensitive information. Use the private process in [SECURITY.md](../SECURITY.md) for vulnerabilities.

Pull requests should be focused, explain the agent behavior that changes and include the validation performed. Changes to a skill must keep its safety rules and must not mention commands, flags, MCP tools or documentation pages that do not exist. Maintainers may request adjustments before a contribution can be included in a release.

## Releases

Releases are prepared from a closed list of public files. They include a deterministic archive, its SHA-256 checksum, release notes and the reviewed repository tree. The three-step process is documented in [the release process](release-process.md).

Preparing a release or creating a local stage never publishes anything. A separate, explicitly confirmed command is required for an external release.
