# Public assets

## Plugin icon

`logo.svg` is the BladeCP mark with its gradient. The plugin manifests use it as the icon in plugin catalogs (`.codex-plugin/plugin.json` and `.cursor-plugin/plugin.json`).

## Wordmark

`logo-light.svg` is the official BladeCP wordmark for light backgrounds, and `logo-dark.svg` is the matching variant for dark backgrounds. They are the same files used by the other public BladeCP repositories. The two differ only in the root `fill` color (`#ffffff` in the dark variant); their vector paths and view box are identical.

## Review

Every SVG in this folder contains only vector paths, gradients and a namespace declaration. They contain no scripts, embedded images, external references, links or event handlers. `scripts/check-public-tree.sh` checks this on every change.
