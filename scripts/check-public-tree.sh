#!/usr/bin/env bash
# Structure and hygiene gate for the public BladeCP Agent Skills repository.
#
# Checks the skills (Agent Skills frontmatter), every plugin manifest, the
# three MCP configuration files, versions, links, BladeCP URLs, credentials
# and editorial markers. It needs only bash and Python 3.8 or later.
#
#   bash scripts/check-public-tree.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
command -v python3 >/dev/null 2>&1 || { echo "error: python3 is required" >&2; exit 2; }

if find "$ROOT" -path "$ROOT/.git" -prune -o -type l -print | grep -q .; then
  echo "error: symbolic links are not allowed in the public tree" >&2
  find "$ROOT" -path "$ROOT/.git" -prune -o -type l -print >&2
  exit 1
fi

python3 - "$ROOT" <<'PY'
import json
import os
import re
import sys
from urllib.parse import urlsplit

ROOT = sys.argv[1]
NAME = 'bladecp'
HOMEPAGE = 'https://developers.bladecp.com'
REPOSITORY = 'https://github.com/bladecp/skills'
MCP_URL = 'https://mcp.bladecp.com/mcp'
SKILLS = ['bladecp', 'bladecp-migrate', 'bladecp-partner', 'bladecp-servers']
BLADECP_HOSTS = {'bladecp.com', 'hub.bladecp.com', 'developers.bladecp.com', 'mcp.bladecp.com', 'api.bladecp.com', 'secure.bladecp.com'}
TEXT_EXT = {'.md', '.json', '.yml', '.yaml', '.sh', '.svg', '.txt', ''}
BINARY_EXT = {'.png', '.jpg', '.jpeg', '.gif', '.webp', '.ico'}
# Built from parts so this file does not trip its own check.
MARKERS = re.compile(r'\b(?:' + '|'.join(['TO' + 'DO', 'FIX' + 'ME', 'DR' + 'AFT', 'T' + 'BD', 'X' + 'XX']) + r')\b')
LONG_DASH = re.compile('[' + chr(0x2014) + chr(0x2013) + ']')
CREDENTIALS = re.compile(
    r'bcp_(?:live|sand)_[A-Za-z0-9_]{12,}'
    r'|-----BEGIN [A-Z ]*PRIVATE KEY-----'
    r'|\bgh[pousr]_[A-Za-z0-9]{36,}'
    r'|(?i:bearer)\s+[A-Za-z0-9._-]{24,}'
)
URL = re.compile(r'https?://[^\s)"\'<>`\]|]+')
SCHEME = re.compile(r'^[A-Za-z][A-Za-z0-9+.-]*:')
REQUIRED = [
    'LICENSE', 'README.md', 'README.pt-BR.md', 'README.es.md', 'CHANGELOG.md', 'CONTRIBUTING.md', 'SECURITY.md',
    'plugin.json', 'mcp.json', 'mcp_config.json', '.mcp.json',
    '.claude-plugin/plugin.json', '.claude-plugin/marketplace.json',
    '.codex-plugin/plugin.json', '.agents/plugins/marketplace.json',
    '.cursor-plugin/plugin.json', '.cursor-plugin/marketplace.json',
    'assets/logo.svg', 'assets/logo-light.svg', 'assets/logo-dark.svg',
    'docs/installation.md', 'docs/security.md', 'docs/troubleshooting.md',
    'docs/release-process.md', 'docs/repository-governance.md',
] + [f'skills/{skill}/SKILL.md' for skill in SKILLS]
# README artwork: the icon, the two wordmarks and, for each language, a wide and
# a compact hero and architecture diagram. Nothing else is an SVG in assets/.
ARTWORK = ['assets/logo.svg', 'assets/logo-light.svg', 'assets/logo-dark.svg'] + [
    f'assets/{name}.{lang}.svg' for lang in ('en', 'pt-BR', 'es')
    for name in ('hero', 'hero-compact', 'architecture', 'architecture-compact')]
# Active content or external references: GitHub shows the artwork through <img>,
# where scripts never run, and the public tree keeps it static all the same.
# Internal references such as <use href="#icon"> are allowed.
ACTIVE = re.compile(
    r'<(?:script|foreignObject|image|iframe|embed|object)[\s>/]'
    r'|\son[a-z]+\s*='
    r'|(?:href|src)\s*=\s*["\'](?!#)'
    r'|url\(\s*(?!["\']?#)'
    r'|@import', re.I)
REQUIRED += ARTWORK

errors = []


def fail(path, message):
    errors.append(f'{path}: {message}')


def files():
    out = []
    for base, dirs, names in os.walk(ROOT):
        dirs[:] = sorted(d for d in dirs if d != '.git')
        for name in sorted(names):
            if name == '.git':
                continue
            out.append(os.path.relpath(os.path.join(base, name), ROOT).replace(os.sep, '/'))
    return out


def read(path):
    with open(os.path.join(ROOT, path), encoding='utf-8') as handle:
        return handle.read()


def load(path):
    try:
        return json.loads(read(path))
    except (OSError, ValueError) as exc:
        fail(path, f'invalid JSON: {exc}')
        return {}


ALL = files()
for path in REQUIRED:
    if path not in ALL:
        fail(path, 'required public file is missing')

# 1. Text files are UTF-8 and free of credentials, editorial markers and long dashes.
for path in ALL:
    ext = os.path.splitext(path)[1].lower()
    if ext in BINARY_EXT:
        continue
    try:
        text = read(path)
    except UnicodeDecodeError:
        fail(path, 'not UTF-8 text')
        continue
    for number, line in enumerate(text.splitlines(), 1):
        if CREDENTIALS.search(line):
            fail(f'{path}:{number}', 'credential-like value')
        if path != 'scripts/check-public-tree.sh' and MARKERS.search(line):
            fail(f'{path}:{number}', 'editorial marker')
        if LONG_DASH.search(line):
            fail(f'{path}:{number}', 'long dash; use a comma, colon, parentheses or a hyphen')

# 2. LICENSE.
if 'LICENSE' in ALL and not read('LICENSE').startswith('MIT License\n'):
    fail('LICENSE', 'must be the MIT License')

# 3. Manifests and versions.
versions = {}


def plugin_basics(path, data, license_required=False):
    if data.get('name') != NAME:
        fail(path, f'name must be "{NAME}"')
    if data.get('homepage') != HOMEPAGE:
        fail(path, f'homepage must be {HOMEPAGE}')
    if data.get('repository') != REPOSITORY:
        fail(path, f'repository must be {REPOSITORY}')
    if not data.get('description'):
        fail(path, 'description is required')
    if license_required and data.get('license') != 'MIT':
        fail(path, 'license must be MIT')
    if not re.fullmatch(r'\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?', str(data.get('version', ''))):
        fail(path, 'version must be semver')
    versions[path] = data.get('version')


def require_file(path, field, value):
    if not isinstance(value, str) or not os.path.isfile(os.path.join(ROOT, value)):
        fail(path, f'{field} points to a missing file: {value}')


portable = load('plugin.json')
plugin_basics('plugin.json', portable, license_required=True)
claude = load('.claude-plugin/plugin.json')
plugin_basics('.claude-plugin/plugin.json', claude, license_required=True)
if claude.get('mcpServers') != './.mcp.json':
    fail('.claude-plugin/plugin.json', 'mcpServers must be ./.mcp.json')
codex = load('.codex-plugin/plugin.json')
plugin_basics('.codex-plugin/plugin.json', codex, license_required=True)
if codex.get('skills') != './skills/':
    fail('.codex-plugin/plugin.json', 'skills must be ./skills/')
interface = codex.get('interface') or {}
require_file('.codex-plugin/plugin.json', 'interface.logo', interface.get('logo'))
require_file('.codex-plugin/plugin.json', 'interface.composerIcon', interface.get('composerIcon'))
cursor = load('.cursor-plugin/plugin.json')
plugin_basics('.cursor-plugin/plugin.json', cursor)
require_file('.cursor-plugin/plugin.json', 'logo', cursor.get('logo'))

for path, source in (('.claude-plugin/marketplace.json', './'), ('.cursor-plugin/marketplace.json', './'),
                     ('.agents/plugins/marketplace.json', {'source': 'local', 'path': './'})):
    data = load(path)
    plugins = data.get('plugins')
    if data.get('name') != NAME or not isinstance(plugins, list) or len(plugins) != 1:
        fail(path, f'must be the "{NAME}" marketplace with exactly one plugin')
        continue
    if plugins[0].get('name') != NAME or plugins[0].get('source') != source:
        fail(path, f'the plugin entry must be "{NAME}" with source {json.dumps(source)}')

changelog = read('CHANGELOG.md') if 'CHANGELOG.md' in ALL else ''
heading = re.search(r'^## \[(\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?)\]', changelog, re.M)
if not heading:
    fail('CHANGELOG.md', 'missing a "## [x.y.z]" heading')
else:
    versions['CHANGELOG.md'] = heading.group(1)
if len(set(versions.values())) > 1:
    fail('manifests', f'versions differ: {versions}')

# 4. MCP configuration: one server, the public endpoint, no credentials.
mcp_files = {
    '.mcp.json': ('type', 'http', 'url', {'X-API-KEY': '${BLADECP_API_KEY:-}'}),
    'mcp.json': ('type', 'streamable-http', 'url', None),
    'mcp_config.json': (None, None, 'serverUrl', None),
}
for path, (type_key, type_value, url_key, headers) in mcp_files.items():
    servers = load(path).get('mcpServers') or {}
    if list(servers) != [NAME]:
        fail(path, f'must declare exactly one server named "{NAME}"')
        continue
    server = servers[NAME]
    if type_key and server.get(type_key) != type_value:
        fail(path, f'{type_key} must be "{type_value}"')
    if server.get(url_key) != MCP_URL:
        fail(path, f'{url_key} must be {MCP_URL}')
    if server.get('headers') != headers:
        fail(path, f'headers must be {json.dumps(headers)}')

# 5. Skills (Agent Skills format).
skill_dirs = sorted({p.split('/')[1] for p in ALL if p.startswith('skills/') and p.count('/') >= 2})
if skill_dirs != sorted(SKILLS):
    fail('skills', f'expected exactly {SKILLS}, found {skill_dirs}')
for skill in skill_dirs:
    path = f'skills/{skill}/SKILL.md'
    if path not in ALL:
        fail(path, 'missing')
        continue
    text = read(path)
    match = re.match(r'---\n(.*?)\n---\n', text, re.S)
    if not match:
        fail(path, 'missing YAML frontmatter')
        continue
    fields = dict(re.findall(r'^([A-Za-z][\w-]*):\s*(.*)$', match.group(1), re.M))
    name = fields.get('name', '').strip()
    description = fields.get('description', '').strip()
    if name != skill or not re.fullmatch(r'[a-z0-9]+(?:-[a-z0-9]+)*', name) or len(name) > 64:
        fail(path, 'name must equal the directory, in lowercase words joined by hyphens (max 64)')
    if not description or len(description) > 1024:
        fail(path, 'description is required and must have at most 1024 characters')
    if '<' in description or '>' in description:
        fail(path, 'description must not contain angle brackets')
    if not description.startswith(('"', "'")) and (': ' in description or ' #' in description):
        fail(path, 'unquoted description contains ": " or " #"')
    if len(text[match.end():].strip()) < 200:
        fail(path, 'body is too short')

# 6. URLs: BladeCP hosts are allowlisted, HTTPS only, and the MCP URL is exact.
for path in ALL:
    if os.path.splitext(path)[1].lower() in BINARY_EXT:
        continue
    text = read(path)
    for match in URL.finditer(text):
        raw = match.group(0).rstrip('.,;:!?*')
        host = (urlsplit(raw).hostname or '').lower()
        if not re.search(r'(^|\.)bladecp\.', host):
            continue
        line = text.count('\n', 0, match.start()) + 1
        if host not in BLADECP_HOSTS:
            fail(f'{path}:{line}', f'BladeCP host not allowed in the public tree: {host}')
        elif not raw.startswith('https:'):
            fail(f'{path}:{line}', f'BladeCP URLs must use HTTPS: {raw}')
        elif host == 'mcp.bladecp.com' and raw != MCP_URL:
            fail(f'{path}:{line}', f'the MCP URL must be exactly {MCP_URL}: {raw}')

# 7. Relative Markdown links resolve inside the tree.
LINK = re.compile(r'!?\[[^\]]*\]\(([^)\s]+)(?:\s+"[^"]*")?\)')
root_real = os.path.realpath(ROOT)
for path in [p for p in ALL if p.endswith('.md')]:
    text = read(path)
    for match in LINK.finditer(text):
        target = match.group(1).strip('<>')
        if not target or target.startswith('#') or SCHEME.match(target):
            continue
        target = target.split('#', 1)[0]
        candidate = os.path.realpath(os.path.join(ROOT, os.path.dirname(path), target))
        if not (candidate == root_real or candidate.startswith(root_real + os.sep)) or not os.path.exists(candidate):
            fail(path, f'broken relative link: {match.group(1)}')

# 8. The artwork is exactly the approved set of static vector files.
svgs = sorted(p for p in ALL if p.endswith('.svg'))
if svgs != sorted(ARTWORK):
    fail('assets', f'SVG files must be exactly the approved artwork; extra: {sorted(set(svgs) - set(ARTWORK))}, '
                   f'missing: {sorted(set(ARTWORK) - set(svgs))}')
for path in svgs:
    match = ACTIVE.search(read(path))
    if match:
        fail(path, f'SVG must not contain scripts, embedded content or external references: {match.group(0)!r}')

if errors:
    for line in errors:
        print(f'error: {line}', file=sys.stderr)
    print(f'{len(errors)} problem(s) found in the public tree.', file=sys.stderr)
    sys.exit(1)
print(f'Public tree checks passed: {len(ALL)} files, version {versions.get("plugin.json")}.')
PY
