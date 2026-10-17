<p align="center">
  <picture>
    <source media="(max-width: 600px)" srcset="assets/hero-compact.es.svg">
    <img src="assets/hero.es.svg" alt="BladeCP Agent Skills. Agent Skills oficiales: enseña a tu agente de IA a operar BladeCP. Tres skills y el BladeCP MCP para Claude Code, Codex, Cursor, Antigravity y OpenCode. Las aprobaciones son tuyas." width="100%">
  </picture>
</p>

<p align="center">
  <strong>Enseña a tu agente de IA a migrar sitios, consultar tu cuenta y seguir la documentación de BladeCP.</strong><br>
  Las skills oficiales y el BladeCP MCP para Claude Code, Codex, Cursor, Antigravity CLI y OpenCode.
</p>

<p align="center">
  <a href="CHANGELOG.md"><img src="https://img.shields.io/badge/versi%C3%B3n-0.1.0-4f46e5?style=flat-square&amp;labelColor=1e1b4b" alt="Versión 0.1.0"></a>
  <a href="#instalacion"><img src="https://img.shields.io/badge/agentes-Claude%20Code%20%C2%B7%20Codex%20%C2%B7%20Cursor%20%C2%B7%20Antigravity%20%C2%B7%20OpenCode-6366f1?style=flat-square&amp;labelColor=1e1b4b" alt="Agentes: Claude Code, Codex, Cursor, Antigravity y OpenCode"></a>
  <a href="#skills"><img src="https://img.shields.io/badge/skills-3-7c3aed?style=flat-square&amp;labelColor=1e1b4b" alt="3 skills"></a><br>
  <a href="#mcp"><img src="https://img.shields.io/badge/MCP-11%20herramientas%20de%20lectura-4f46e5?style=flat-square&amp;labelColor=1e1b4b" alt="BladeCP MCP con 11 herramientas de solo lectura"></a>
  <a href="#calidad"><img src="https://img.shields.io/badge/verificaciones-38%20aprobadas-8b5cf6?style=flat-square&amp;labelColor=1e1b4b" alt="38 verificaciones de release aprobadas en la 0.1.0"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licencia-MIT-4338ca?style=flat-square&amp;labelColor=1e1b4b" alt="Licencia MIT"></a>
  <a href="https://github.com/bladecp/skills/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/bladecp/skills/ci.yml?branch=main&amp;style=flat-square&amp;labelColor=1e1b4b&amp;label=CI%20p%C3%BAblico" alt="Estado del CI público"></a>
</p>

<p align="center">
  <a href="#instalacion"><strong>Instalar</strong></a>
  &nbsp;·&nbsp;
  <a href="https://github.com/bladecp/skills/releases/tag/v0.1.0">Notas de la versión</a>
  &nbsp;·&nbsp;
  <a href="https://github.com/bladecp/skills/releases/download/v0.1.0/SHA256SUMS">Checksum SHA-256</a>
</p>

<p align="center">
  <a href="#skills">Skills</a> ·
  <a href="#arquitectura">Arquitectura</a> ·
  <a href="#instalacion">Instalación</a> ·
  <a href="#mcp">Servidor MCP</a> ·
  <a href="#clave-de-api">Clave de API</a> ·
  <a href="#seguridad">Seguridad</a> ·
  <a href="#preguntas">Preguntas</a> ·
  <a href="#soporte">Soporte</a>
  <br>
  <sub><a href="README.md">English</a> · <a href="README.pt-BR.md">Português (Brasil)</a></sub>
</p>

> [!TIP]
> **Configuración guiada.** Pega esta frase en tu agente y te guiará en la instalación: `Busca y sigue las instrucciones para configurarme para BladeCP en https://developers.bladecp.com/es/agents/prompt.md`

Las BladeCP Agent Skills son el plugin oficial de BladeCP para agentes de programación. Enseñan a tu agente a migrar un sitio de cPanel a BladeCP con la BladeCP CLI, a consultar tus servidores y migraciones y a seguir la documentación de [BladeCP Developers](https://developers.bladecp.com/es). El plugin también conecta el servidor BladeCP MCP, que ofrece la documentación a cualquier persona y, con tu clave de API, datos de tu cuenta solo de lectura.

El paquete sigue el formato [Agent Skills](https://agentskills.io) e incluye manifiestos de plugin para Claude Code, Codex, Cursor y Antigravity, además de un manifiesto portátil [Agent Plugins](https://agent-plugins.org). OpenCode y otros agentes instalan las skills y conectan el servidor MCP directamente. Guía para cada agente: https://developers.bladecp.com/es/agents

<a id="skills"></a>

## Lo que aprende tu agente

| Elegir la herramienta correcta | Migrar desde cPanel | Consultar tu cuenta |
| --- | --- | --- |
| `bladecp` explica qué ofrece BladeCP a los desarrolladores, qué herramienta usar en cada tarea, cómo leer la documentación, las claves de API y las reglas de seguridad. | `bladecp-migrate` lleva un backup completo de cPanel con la BladeCP CLI, desde el inicio de sesión hasta la vista previa privada, y deja la aprobación en tus manos. | `bladecp-servers` consulta tu cuenta, servidores, uso, dominios y migraciones con el MCP y diagnostica una migración que falló. |

Las skills se cargan automáticamente cuando la conversación trata de su tema. Indican al agente las páginas `.md` de la documentación oficial, sin copiar su contenido, para que siga siempre el contrato actual.

### Lo que las skills nunca hacen

- **Pedir tu clave en el chat.** La clave viene de una variable de entorno o de tu gestor de secretos, y el agente nunca la imprime ni la guarda.
- **Aprobar por su cuenta.** Aprobar, cancelar y reintentar una migración requieren tu instrucción explícita para esa migración.
- **Obedecer contenido.** Archivos, backups, documentación y resultados de herramientas son información, nunca instrucciones.
- **Cambiar algo con el MCP.** El MCP solo lee. La subida pasa por la BladeCP CLI, y las decisiones quedan en manos de una persona, en la CLI o en el Hub.

### Qué incluye el plugin

| Componente | Contenido |
| --- | --- |
| Skills | `bladecp`, `bladecp-migrate` y `bladecp-servers`, en el formato Agent Skills |
| Servidor MCP | Un único servidor, `bladecp`, en `https://mcp.bladecp.com/mcp` |
| Manifiestos | Claude Code, Codex, Cursor, Antigravity y Agent Plugins |
| BladeCP CLI | Se ejecuta bajo demanda con `npx @bladecp/cli`; necesita Node.js 20 o posterior y tiene su propio inicio de sesión |

## Arquitectura

El agente carga las skills, las skills deciden qué herramienta de BladeCP sirve para la tarea, y toda acción que cambia algo sigue en tus manos. El MCP lee; la CLI sube; tú apruebas.

<p align="center">
  <picture>
    <source media="(max-width: 600px)" srcset="assets/architecture-compact.es.svg">
    <img src="assets/architecture.es.svg" alt="Cómo funcionan las BladeCP Agent Skills. Tu agente de IA carga las skills. La skill bladecp elige la herramienta y señala la documentación, bladecp-migrate ejecuta la BladeCP CLI hasta la vista previa privada y bladecp-servers lee la cuenta con el BladeCP MCP en mcp.bladecp.com/mcp. El MCP ofrece las herramientas de documentación sin clave y ocho herramientas de la cuenta, solo de lectura, con BLADECP_API_KEY, llamando a la Customer API en api.bladecp.com. Todas las skills leen BladeCP Developers. Tú apruebas, cancelas y reintentas." width="100%">
  </picture>
</p>

<p align="center"><sub>Vista lógica del plugin. <a href="assets/architecture.es.svg">Abrir el diagrama a tamaño completo</a>.</sub></p>

### De tu pedido a BladeCP

1. **El agente carga las skills.** La skill `bladecp` va primero y elige la herramienta para la tarea.
2. **La documentación va primero.** Cada skill lee las páginas `.md` de BladeCP Developers, directamente o con las herramientas de documentación del MCP, que no piden clave.
3. **Las consultas pasan por el MCP.** Con `BLADECP_API_KEY` en el entorno del agente, el MCP llama a la Customer API por ti, solo de lectura.
4. **Las migraciones pasan por la CLI.** `bladecp-migrate` ejecuta la BladeCP CLI, que sube el backup y sigue la migración hasta la vista previa privada.
5. **Tú decides.** Aprobar, cancelar y reintentar solo ocurren con tu instrucción, en la CLI o en el Hub.

<a id="instalacion"></a>

## Instalación

| Agente | Instalación | Herramientas de la cuenta con tu clave |
| --- | --- | --- |
| **Claude Code** | `claude plugin marketplace add bladecp/skills`<br>`claude plugin install bladecp@bladecp` | Automático: el plugin lee `BLADECP_API_KEY` |
| **Codex** | `codex plugin marketplace add bladecp/skills`<br>`codex plugin add bladecp@bladecp` | Una entrada en `~/.codex/config.toml` |
| **Cursor** | **Customize** › **From GitHub Repository** › `https://github.com/bladecp/skills` | Una entrada en `~/.cursor/mcp.json` |
| **Antigravity CLI** | `agy plugin install https://github.com/bladecp/skills` | Un servidor agregado con `agy mcp add` |
| **OpenCode** | Copia `skills/` en `~/.config/opencode/skills/` | Una entrada en `opencode.json` |
| **Otros agentes** | `npx -y skills add bladecp/skills --skill '*'` | La configuración de MCP de tu agente |

Toda instalación funciona sin clave, en modo solo documentación. Los pasos de cada agente vienen a continuación; la verificación, la actualización y la desinstalación están en [docs/installation.md](docs/installation.md) (en inglés).

### Claude Code

En una terminal:

```sh
claude plugin marketplace add bladecp/skills
claude plugin install bladecp@bladecp
```

Dentro de una sesión abierta, el equivalente es:

```text
/plugin marketplace add bladecp/skills
/plugin install bladecp@bladecp
/reload-plugins
```

`/reload-plugins` aplica el plugin a la sesión actual sin reiniciar. Después, comprueba en `/mcp` que `bladecp` aparece como servidor del plugin. El plugin lee la clave de la variable `BLADECP_API_KEY`: defínela **antes** de abrir Claude Code y abre una nueva sesión si cambia.

### Codex

```sh
codex plugin marketplace add bladecp/skills
codex plugin add bladecp@bladecp
```

También puedes instalarlo desde el navegador de plugins, con `/plugins` dentro de la Codex CLI. Abre una nueva sesión después de instalarlo.

El plugin instala las skills y el servidor MCP en **modo solo documentación**, porque un plugin de Codex no puede pasar tu clave desde una variable de entorno. Para habilitar las herramientas de la cuenta, agrega esto a `~/.codex/config.toml`:

```toml
[mcp_servers.bladecp]
url = "https://mcp.bladecp.com/mcp"
env_http_headers = { "X-API-KEY" = "BLADECP_API_KEY" }
```

Con esta entrada, Codex muestra un único servidor `bladecp`, que envía la clave. Si la variable está vacía o no existe, Codex no envía la cabecera y el servidor sigue en modo solo documentación.

### Cursor

En Cursor, abre **Customize**, elige **From GitHub Repository**, escribe `https://github.com/bladecp/skills` e instala el plugin `bladecp`. Para probarlo sin importarlo, copia el repositorio en `~/.cursor/plugins/local/bladecp` y ejecuta **Developer: Reload Window**.

Igual que en Codex, el servidor del plugin funciona en **modo solo documentación**. Para habilitar las herramientas de la cuenta, agrega esto a `~/.cursor/mcp.json`, sin quitar los servidores que ya están ahí:

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

La variable debe ser visible para el proceso de Cursor: si las herramientas de la cuenta no aparecen, abre Cursor desde una terminal donde esté exportada. Si el servidor `bladecp` del plugin también aparece en la lista de MCP, desactívalo en **Customize** para no duplicar las herramientas de documentación.

### Antigravity CLI

```sh
agy plugin install https://github.com/bladecp/skills
```

El plugin instala las skills y el servidor MCP en **modo solo documentación**. Antigravity no documenta la expansión de variables de entorno en las cabeceras del MCP, así que, para habilitar las herramientas de la cuenta, ejecuta esto en tu propia terminal:

```sh
agy mcp add --header "X-API-KEY: $BLADECP_API_KEY" bladecp-account https://mcp.bladecp.com/mcp
```

Tu shell expande la variable y la clave queda guardada en `~/.gemini/config/mcp_config.json`. Mantén ese archivo privado y vuelve a ejecutar el comando después de cambiar la clave.

### OpenCode

Copia las skills en la carpeta de skills de OpenCode:

```sh
git clone --depth 1 https://github.com/bladecp/skills.git bladecp-skills
mkdir -p ~/.config/opencode/skills
cp -R bladecp-skills/skills/. ~/.config/opencode/skills/
```

Después, agrega el servidor MCP a `~/.config/opencode/opencode.json`:

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

Si la variable no está definida, OpenCode envía un valor vacío y el servidor sigue en modo solo documentación.

### Otros agentes

Instala solo las skills con la CLI [`skills`](https://skills.sh):

```sh
npx -y skills add bladecp/skills --skill '*'
```

Después, agrega el servidor MCP a tu agente: dirección `https://mcp.bladecp.com/mcp` (HTTP con streaming), con la cabecera `X-API-KEY` leída de una variable de entorno. Si tu cliente solo admite tokens de tipo bearer, el servidor también acepta `Authorization: Bearer <clave>`. Nunca escribas la clave en un archivo versionado.

### Actualización

- **Claude Code:** ejecuta `claude plugin marketplace update bladecp` y `claude plugin update bladecp@bladecp` y abre una nueva sesión.
- **Codex:** ejecuta `codex plugin marketplace upgrade bladecp` y `codex plugin add bladecp@bladecp` y abre una nueva sesión.
- **Cursor:** actualiza el plugin en **Customize**, o reemplaza la copia local y recarga la ventana.
- **Antigravity CLI:** vuelve a ejecutar el comando `agy plugin install`.
- **OpenCode y otros agentes:** vuelve a copiar las skills, o ejecuta `npx -y skills update`.

Cada [release](https://github.com/bladecp/skills/releases) también incluye `bladecp-skills-<versión>.zip` y `SHA256SUMS`. Comprueba la descarga con `shasum -a 256 -c SHA256SUMS`; el archivo contiene una carpeta `bladecp`, la raíz del plugin.

<a id="mcp"></a>

## Servidor BladeCP MCP

| Servidor | Dirección | Variable de la clave |
| --- | --- | --- |
| `bladecp` | `https://mcp.bladecp.com/mcp` | `BLADECP_API_KEY` |

| Herramientas | Disponibilidad |
| --- | --- |
| `search_docs`, `get_doc_page`, `list_doc_pages` | Siempre, incluso sin clave |
| `get_account`, `list_servers`, `get_server`, `get_server_usage`, `list_server_domains`, `list_migrations`, `get_migration`, `list_migration_destinations` | Con clave |

El MCP es solo de lectura. No sube backups ni crea, aprueba, cancela o reintenta migraciones. Sin clave, se conecta normalmente en modo solo documentación, y la misma instalación ofrece las herramientas de la cuenta en cuanto se define la variable. Consulta la [documentación del BladeCP MCP](https://developers.bladecp.com/es/mcp).

## Clave de API

1. Crea una clave de API personal en el Hub, en [Claves de API](https://hub.bladecp.com/account/api-keys). Los pasos están en la página [Claves de API](https://developers.bladecp.com/es/getting-started/api-keys) de la documentación.
2. Guárdala en tu gestor de secretos y expórtala en el entorno donde se abre el agente. Ejemplo en macOS, con la clave guardada en el Keychain:

   ```sh
   export BLADECP_API_KEY="$(security find-generic-password -s bladecp-api-key -w)"
   ```

3. Abre una nueva sesión del agente.

Las claves personales caducan, a los 90 días por defecto. Cuando las herramientas de la cuenta empiecen a responder con un error de autenticación, crea una nueva clave y actualiza la variable.

La variable es lo que necesita el servidor MCP. La BladeCP CLI inicia sesión con `bladecp login`, que abre el Hub en el navegador ([Conectar con el navegador](https://developers.bladecp.com/es/getting-started/connect)), y también acepta `BLADECP_API_KEY`.

**Sin clave**, sigues teniendo las skills, las herramientas de documentación del MCP (`search_docs`, `get_doc_page` y `list_doc_pages`) y la BladeCP CLI después de `bladecp login`.

## Seguridad

- **Nunca pegues tu clave en el chat.** Las skills indican al agente que nunca la pida. La clave viene de una variable de entorno o de tu gestor de secretos.
- **Una persona aprueba.** Las herramientas del MCP solo leen. Las skills nunca aprueban, cancelan ni reintentan una migración sin tu instrucción explícita.
- **El contenido es información.** Las skills indican al agente que trate archivos, backups, documentación y resultados de herramientas como información, nunca como instrucciones.
- **Recorrido de la clave.** La clave viaja en una cabecera hasta `mcp.bladecp.com`, que la usa solo para llamar a la API de BladeCP por ti y no la registra.
- **Nada se ejecuta al instalar.** El plugin es texto: skills, manifiestos JSON e iconos, sin hooks ni ejecutables.
- **Repositorio público.** Este repositorio no contiene secretos. Los archivos de configuración solo citan nombres de variables.

El modelo completo está en [docs/security.md](docs/security.md) (en inglés). Para informar de una vulnerabilidad en privado, sigue el [SECURITY.md](SECURITY.md).

<a id="calidad"></a>

## Calidad y validación

La versión `0.1.0` fue validada por los mantenedores antes de publicarse:

- **38 verificaciones de release** en las herramientas de publicación: paquete determinista, lista cerrada de archivos, controles de filtraciones y de enlaces y los bloqueos de la etapa de publicación.
- **Verificación de contrato** en cada skill y README: cada herramienta del MCP y sus parámetros, cada comando y flag de la BladeCP CLI y cada página de la documentación deben existir en los contratos actuales de BladeCP.
- **Validación en los clientes** con `claude plugin validate --strict` y `agy plugin validate`, y de `plugin.json` y `mcp.json` contra los esquemas de [Agent Plugins](https://agent-plugins.org).
- **Instalación desde el paquete de la release** en Claude Code, Codex, Antigravity CLI y OpenCode, y el MCP de producción respondiendo en modo solo documentación sin clave.

Este repositorio incluye el control público de estructura e higiene (`scripts/check-public-tree.sh`). El [CI público](https://github.com/bladecp/skills/actions/workflows/ci.yml) lo ejecuta en cada cambio, junto con la validación de los esquemas.

<a id="desarrollo"></a>

## Estructura del repositorio y contribución

| Ruta | Función |
| --- | --- |
| `skills/<nombre>/SKILL.md` | Skills en el formato Agent Skills |
| `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json` | Plugin y marketplace de Claude Code |
| `.mcp.json` | Servidor MCP con la clave leída del entorno, usado por Claude Code |
| `plugin.json`, `mcp.json` | Manifiesto portátil Agent Plugins y servidor MCP, usados por Codex y Cursor |
| `.codex-plugin/plugin.json`, `.agents/plugins/marketplace.json` | Presentación y marketplace de Codex |
| `.cursor-plugin/plugin.json`, `.cursor-plugin/marketplace.json` | Plugin y marketplace de Cursor |
| `mcp_config.json` | Servidor MCP de Antigravity |
| `assets/` | Icono del plugin, logos de BladeCP y el arte del README |
| `docs/` | Guías de instalación, seguridad, solución de problemas, releases y gobernanza |

Para validar el repositorio después de un cambio:

```sh
bash scripts/check-public-tree.sh
claude plugin validate --strict .
```

Las contribuciones son bienvenidas. Lee el [CONTRIBUTING.md](CONTRIBUTING.md) antes de abrir una issue o un pull request y nunca subas claves ni datos de clientes. Los cambios están en el [CHANGELOG](CHANGELOG.md), y el proceso de release se describe en [docs/release-process.md](docs/release-process.md).

<a id="preguntas"></a>

## Preguntas frecuentes

<details>
<summary><strong>¿Necesito una clave de API?</strong></summary>

No. Las skills, las herramientas de documentación del MCP y la BladeCP CLI (después de `bladecp login`) funcionan sin ella. La clave solo habilita las herramientas de la cuenta del MCP, que son de solo lectura.

</details>

<details>
<summary><strong>¿Puede el agente aprobar o cancelar una migración por su cuenta?</strong></summary>

No. El MCP no cambia nada, y las skills solo ejecutan `bladecp migrations approve`, `cancel` o `retry` cuando lo pides explícitamente para esa migración. También puedes decidir en el Hub.

</details>

<details>
<summary><strong>¿A dónde va mi clave?</strong></summary>

De la variable de entorno a `mcp.bladecp.com`, en una cabecera. El MCP la usa solo para llamar a la API de BladeCP por ti y no la registra. En Antigravity CLI, la clave también queda guardada en tu configuración local de MCP.

</details>

<details>
<summary><strong>¿Por qué Codex, Cursor y Antigravity empiezan en modo solo documentación?</strong></summary>

Sus plugins no leen una cabecera desde una variable de entorno. El plugin se conecta sin clave, y la entrada de configuración indicada para cada agente agrega la clave.

</details>

<details>
<summary><strong>Mi agente no está en la lista. ¿Puedo usar las skills?</strong></summary>

Sí. Cualquier agente que lea el formato Agent Skills puede instalarlas con `npx -y skills add bladecp/skills --skill '*'` y conectar el MCP en `https://mcp.bladecp.com/mcp`.

</details>

<details>
<summary><strong>Algo no funciona. ¿Por dónde empiezo?</strong></summary>

[docs/troubleshooting.md](docs/troubleshooting.md) (en inglés) cubre el MCP, la instalación en cada agente y la BladeCP CLI.

</details>

## Soporte

| Asunto | Canal |
| --- | --- |
| Error reproducible o pedido de funcionalidad | [GitHub Issues](https://github.com/bladecp/skills/issues) |
| Soporte técnico y de producto | [dev@bladecp.com](mailto:dev@bladecp.com) |
| Vulnerabilidad | [Política de seguridad](SECURITY.md) |
| Documentación | [BladeCP Developers](https://developers.bladecp.com/es) |

En reportes públicos, nunca incluyas una clave de API, contenido de backups ni datos de clientes.

## Licencia

Las BladeCP Agent Skills se distribuyen bajo la [Licencia MIT](LICENSE). La licencia cubre este repositorio; el uso de los servicios de BladeCP sigue los [términos de BladeCP](https://bladecp.com/terms-and-conditions).

<p align="center"><strong>BladeCP. Tu agente, nuestra infraestructura.</strong></p>
