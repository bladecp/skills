# Public release process

This page explains how maintainers prepare and publish the BladeCP Agent Skills. The process is intentionally conservative: preparing an artifact does not publish it.

## The three steps

```sh
./scripts/public-release.sh prepare 0.1.0
./scripts/public-release.sh stage-github 0.1.0
BLADECP_ALLOW_PUBLIC_PUBLISH=1 ./scripts/public-release.sh publish 0.1.0 --confirm-publication v0.1.0
```

`prepare` runs the release gates and creates the reviewed artifact directory. `stage-github` creates a local Git repository with an independent public history and the matching version tag. Neither command contacts GitHub or publishes files. Releases after the first one pass `--public-base` with a clean checkout of the public `main` branch, so each release adds to the existing history.

`publish` is intentionally separate. It requires the exact version confirmation and an additional maintainer-controlled safety lock. It validates the staged commit, tag, checksum and approved GitHub destination before it can perform an external write. It never force-pushes. These scripts live with the maintainers' source and are not part of this repository.

## What is released

Every public release includes:

- `bladecp-skills-<version>.zip`, with one `bladecp` folder that is the plugin root: the skills, every plugin manifest, the MCP configuration files, the icons, the documentation and the license;
- `SHA256SUMS`, so users can verify the downloaded archive;
- release notes taken from [CHANGELOG.md](../CHANGELOG.md);
- this repository tree, at the version tag.

The archive is deterministic: the same content and version always produce the same file and checksum.

## Versions

The version is the same in `plugin.json`, `.claude-plugin/plugin.json`, `.codex-plugin/plugin.json`, `.cursor-plugin/plugin.json` and the first `## [x.y.z] - YYYY-MM-DD` heading of the changelog. The project follows [Semantic Versioning](https://semver.org/). Versions with a suffix, such as `0.2.0-rc.1`, are published as pre-releases.

## Safety checks

The preparation process checks version consistency, the skills and their frontmatter, every manifest and MCP configuration file, the commands, flags, MCP tools and documentation pages the skills mention, links, credential patterns and unintended internal references. It validates the plugin with the Claude Code and Antigravity CLIs when they are installed, verifies that the archive matches the reviewed tree and records an audit report.

Automated checks cannot judge every security or editorial concern. The first public release and material changes receive a human review of the skills, documentation, manifests and release assets, and an installation test in each supported agent, with and without `BLADECP_API_KEY`.

## History policy

The first public release starts a clean, curated public history. Later releases add ordinary reviewed commits and version tags to that history. The maintainers' development source remains authoritative: its history is never mirrored or copied into this repository, and public history is never rewritten after the first release.

Public contributions are reviewed in GitHub, then incorporated into the development source before returning in a later curated release. For the contribution path, see [repository governance](repository-governance.md).
