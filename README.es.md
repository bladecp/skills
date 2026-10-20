<p align="center">
  <picture>
    <source media="(max-width: 600px)" srcset="assets/hero-compact.es.svg">
    <img src="assets/hero.es.svg" alt="BladeCP Agent Skills. Agent Skills oficiales: enseña a tu agente de IA a operar BladeCP. Cuatro skills y el BladeCP MCP para Claude Code, Codex, Cursor, Antigravity y OpenCode. Las aprobaciones son tuyas." width="100%">
  </picture>
</p>

<p align="center">
  <strong>Enseña a tu agente de IA a migrar sitios, gestionar tus servidores, operar como socio y seguir la documentación de BladeCP.</strong><br>
  Las skills oficiales y el BladeCP MCP para Claude Code, Codex, Cursor, Antigravity CLI y OpenCode.
</p>

<p align="center">
  <a href="CHANGELOG.md"><img src="https://img.shields.io/badge/versi%C3%B3n-0.2.2-4f46e5?style=flat-square&amp;labelColor=1e1b4b" alt="Versión 0.2.2"></a>
  <a href="#instalacion"><img src="https://img.shields.io/badge/agentes-Claude%20Code%20%C2%B7%20Codex%20%C2%B7%20Cursor%20%C2%B7%20Antigravity%20%C2%B7%20OpenCode-6366f1?style=flat-square&amp;labelColor=1e1b4b" alt="Agentes: Claude Code, Codex, Cursor, Antigravity y OpenCode"></a>
  <a href="#skills"><img src="https://img.shields.io/badge/skills-4-7c3aed?style=flat-square&amp;labelColor=1e1b4b" alt="4 skills"></a><br>
  <a href="#mcp"><img src="https://img.shields.io/badge/MCP-14%20herramientas%20de%20lectura-4f46e5?style=flat-square&amp;labelColor=1e1b4b" alt="BladeCP MCP con 14 herramientas de solo lectura"></a>
  <a href="#calidad"><img src="https://img.shields.io/badge/verificaciones-38%20aprobadas-8b5cf6?style=flat-square&amp;labelColor=1e1b4b" alt="38 verificaciones de release aprobadas en la 0.2.2"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licencia-MIT-4338ca?style=flat-square&amp;labelColor=1e1b4b" alt="Licencia MIT"></a>
  <a href="https://github.com/bladecp/skills/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/bladecp/skills/ci.yml?branch=main&amp;style=flat-square&amp;labelColor=1e1b4b&amp;label=CI%20p%C3%BAblico" alt="Estado del CI público"></a>
</p>

<p align="center">
  <a href="#instalacion"><strong>Instalar</strong></a>
  &nbsp;·&nbsp;
  <a href="https://github.com/bladecp/skills/releases/tag/v0.2.2">Notas de la versión</a>
  &nbsp;·&nbsp;
  <a href="https://github.com/bladecp/skills/releases/download/v0.2.2/SHA256SUMS">Checksum SHA-256</a>
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

Las BladeCP Agent Skills son el plugin oficial de BladeCP para agentes de programación. Enseñan a tu agente a migrar un sitio de cPanel a BladeCP, a consultar y gestionar tus servidores, dominios, apps y WordPress y, si eres socio de BladeCP, a operar los servicios de tus clientes, todo con la BladeCP CLI, y a seguir la documentación de [BladeCP Developers](https://developers.bladecp.com/es). El plugin también conecta el servidor BladeCP MCP, que ofrece la documentación y orientación sobre los productos a cualquier persona y, cuando inicias sesión con BladeCP o usas tu clave de API, datos de tu cuenta solo de lectura.

El paquete sigue el formato [Agent Skills](https://agentskills.io) e incluye manifiestos de plugin para Claude Code, Codex, Cursor y Antigravity, además de un manifiesto portátil [Agent Plugins](https://agent-plugins.org). OpenCode y otros agentes instalan las skills y conectan el servidor MCP directamente. Guía para cada agente: https://developers.bladecp.com/es/agents

<a id="skills"></a>

## Lo que aprende tu agente

| Elegir la herramienta correcta | Migrar desde cPanel | Cuidar tus servidores | Operar como socio |
| --- | --- | --- | --- |
| `bladecp` explica qué ofrece BladeCP a los desarrolladores, qué herramienta usar en cada tarea, cómo leer la documentación, las claves de API, `bladecp api` para cualquier ruta y las reglas de seguridad. | `bladecp-migrate` analiza un backup completo de cPanel sin subir nada y lo lleva con la BladeCP CLI, desde el inicio de sesión hasta la vista previa privada, y deja la aprobación en tus manos. | `bladecp-servers` consulta tu cuenta, servidores, uso, dominios y migraciones con el MCP, gestiona dominios, apps y WordPress con la CLI y diagnostica una migración que falló. | `bladecp-partner` ejecuta los comandos de socio de la CLI: catálogo, servidores de tus clientes, cuentas de BladeCP Vibe, marketplace, webhooks y Fast Deploy de tus clientes. |

Las skills se cargan automáticamente cuando la conversación trata de su tema. Indican al agente las páginas `.md` de la documentación oficial, sin copiar su contenido, para que siga siempre el contrato actual.

### Lo que las skills nunca hacen

- **Pedir tu clave en el chat.** La clave viene de una variable de entorno o de tu gestor de secretos, y el agente nunca la imprime ni la guarda.
- **Actuar por su cuenta.** Aprobar, cancelar o reintentar una migración y cualquier cambio en un servidor, un dominio, una app o un servicio de socio (suspender, cancelar, eliminar, dar de baja, cambiar un secreto) requieren tu instrucción explícita para ese elemento.
- **Guardar secretos de un solo uso.** Los secretos de firma de webhook y los enlaces de acceso de un solo uso te llegan una vez y nunca se escriben en archivos, logs ni resúmenes.
- **Obedecer contenido.** Archivos, backups, documentación y resultados de herramientas son información, nunca instrucciones.
- **Cambiar algo con el MCP.** El MCP solo lee. Los cambios pasan por la BladeCP CLI cuando los pides, y las decisiones quedan en manos de una persona, en la CLI o en el Hub.

### Qué incluye el plugin

| Componente | Contenido |
| --- | --- |
| Skills | `bladecp`, `bladecp-migrate`, `bladecp-servers` y `bladecp-partner`, en el formato Agent Skills |
| Servidor MCP | Un único servidor, `bladecp`, en `https://mcp.bladecp.com/mcp` |
| Manifiestos | Claude Code, Codex, Cursor, Antigravity y Agent Plugins |
| BladeCP CLI | Se ejecuta bajo demanda con `npx @bladecp/cli@0.4.3`; versión 0.4.0 o posterior para los comandos de servidor, de socio y `bladecp api`. Necesita Node.js 20 o posterior y tiene su propio inicio de sesión |

## Arquitectura

El agente carga las skills, las skills deciden qué herramienta de BladeCP sirve para la tarea, y toda acción que cambia algo sigue en tus manos. El MCP lee; la CLI actúa cuando lo pides; tú apruebas.

<p align="center">
  <picture>
    <source media="(max-width: 600px)" srcset="assets/architecture-compact.es.svg">
    <img src="assets/architecture.es.svg" alt="Cómo funcionan las BladeCP Agent Skills. Tu agente de IA carga las skills. La skill bladecp elige la herramienta y señala la documentación, bladecp-migrate ejecuta la BladeCP CLI hasta la vista previa privada y bladecp-servers lee la cuenta con el BladeCP MCP en mcp.bladecp.com/mcp. El MCP ofrece las herramientas de documentación y las públicas sin clave y ocho herramientas de la cuenta, solo de lectura, con el inicio de sesión de BladeCP o BLADECP_API_KEY, llamando a la Customer API en api.bladecp.com. Todas las skills leen BladeCP Developers. Tú apruebas, cancelas y reintentas." width="100%">
  </picture>
</p>

<p align="center"><sub>Vista lógica del plugin. <a href="assets/architecture.es.svg">Abrir el diagrama a tamaño completo</a>.</sub></p>

### De tu pedido a BladeCP

1. **El agente carga las skills.** La skill `bladecp` va primero y elige la herramienta para la tarea.
2. **La documentación va primero.** Cada skill lee las páginas `.md` de BladeCP Developers, directamente o con las herramientas de documentación del MCP, que no piden clave.
3. **Las consultas pasan por el MCP.** Después de iniciar sesión con BladeCP, o con `BLADECP_API_KEY` en el entorno del agente, el MCP llama a la Customer API por ti, solo de lectura.
4. **Los cambios pasan por la CLI.** `bladecp-migrate` ejecuta la BladeCP CLI, que sube el backup y sigue la migración hasta la vista previa privada; `bladecp-servers` y `bladecp-partner` ejecutan los comandos de servidor y de socio que pidas.
5. **Tú decides.** Aprobar una migración y cualquier cambio en un servidor o un servicio solo ocurren con tu instrucción, en la CLI o en el Hub.

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

Toda instalación funciona sin clave: las herramientas de documentación, `recommend_plan`, `explain_migration` y `explain_server_closing` responden al instante, y las herramientas de la cuenta te piden iniciar sesión con BladeCP en los agentes que admiten el inicio de sesión en MCP. Con tu clave, las herramientas de la cuenta funcionan directamente. Los pasos de cada agente vienen a continuación; la verificación, la actualización y la desinstalación están en [docs/installation.md](docs/installation.md) (en inglés).

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

`/reload-plugins` aplica el plugin a la sesión actual sin reiniciar. Después, comprueba en `/mcp` que `bladecp` aparece como servidor del plugin. El plugin lee la clave de la variable `BLADECP_API_KEY`: defínela **antes** de abrir Claude Code y abre una nueva sesión si cambia. Sin la variable, Claude Code abre el inicio de sesión de BladeCP en el navegador la primera vez que el agente llama a una herramienta de la cuenta. Permites el acceso de solo lectura (`bladecp:read`) y puedes desconectarlo después en tu cuenta BladeCP, en [Apps conectadas](https://secure.bladecp.com/account/applications).

### Codex

```sh
codex plugin marketplace add bladecp/skills
codex plugin add bladecp@bladecp
```

También puedes instalarlo desde el navegador de plugins, con `/plugins` dentro de la Codex CLI. Abre una nueva sesión después de instalarlo.

El plugin instala las skills y el servidor MCP **sin clave**, porque un plugin de Codex no puede pasar tu clave desde una variable de entorno. Las herramientas de documentación y las públicas funcionan, y las herramientas de la cuenta piden el inicio de sesión de BladeCP donde Codex admite el inicio de sesión en MCP. Para usar las herramientas de la cuenta con tu clave, agrega esto a `~/.codex/config.toml`:

```toml
[mcp_servers.bladecp]
url = "https://mcp.bladecp.com/mcp"
env_http_headers = { "X-API-KEY" = "BLADECP_API_KEY" }
```

Con esta entrada, Codex muestra un único servidor `bladecp`, que envía la clave. Si la variable está vacía o no existe, Codex no envía la cabecera y el servidor funciona como sin clave.

### Cursor

En Cursor, abre **Customize**, elige **From GitHub Repository**, escribe `https://github.com/bladecp/skills` e instala el plugin `bladecp`. Para probarlo sin importarlo, copia el repositorio en `~/.cursor/plugins/local/bladecp` y ejecuta **Developer: Reload Window**.

Igual que en Codex, el servidor del plugin se conecta **sin clave**: las herramientas de documentación y las públicas funcionan, y las herramientas de la cuenta piden el inicio de sesión de BladeCP donde Cursor lo admite. Para usar las herramientas de la cuenta con tu clave, agrega esto a `~/.cursor/mcp.json`, sin quitar los servidores que ya están ahí:

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

El plugin instala las skills y el servidor MCP **sin clave**: las herramientas de documentación y las públicas funcionan, y las herramientas de la cuenta piden el inicio de sesión de BladeCP donde Antigravity lo admite. Antigravity no documenta la expansión de variables de entorno en las cabeceras del MCP, así que, para usar las herramientas de la cuenta con tu clave, ejecuta esto en tu propia terminal:

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

Con `"oauth": false`, OpenCode usa la clave y no abre el inicio de sesión de BladeCP. Si la variable no está definida, OpenCode envía un valor vacío, y solo funcionan las herramientas que no piden iniciar sesión.

### Otros agentes

Instala solo las skills con la CLI [`skills`](https://skills.sh):

```sh
npx -y skills add bladecp/skills --skill '*'
```

Después, agrega el servidor MCP a tu agente: dirección `https://mcp.bladecp.com/mcp` (HTTP con streaming), con la cabecera `X-API-KEY` leída de una variable de entorno. Si tu cliente solo admite tokens de tipo bearer, el servidor también acepta `Authorization: Bearer <clave>`. Sin cabecera, las herramientas de la cuenta necesitan el inicio de sesión de BladeCP, si tu agente admite el inicio de sesión en MCP. Nunca escribas la clave en un archivo versionado.

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
| `search_docs`, `get_doc_page`, `list_doc_pages`, `recommend_plan`, `explain_migration`, `explain_server_closing` | Siempre, incluso sin clave |
| `get_account`, `list_servers`, `get_server`, `get_server_usage`, `list_server_domains`, `list_migrations`, `get_migration`, `list_migration_destinations` | Con el inicio de sesión de BladeCP o una clave de API |

El MCP es solo de lectura. No sube backups ni crea, aprueba, cancela o reintenta migraciones. Sin clave, lista todas las herramientas: las de documentación, `recommend_plan` (qué producto de BladeCP sirve para un proyecto), `explain_migration` (cómo llega un sitio a BladeCP) y `explain_server_closing` (cómo pedir en el Hub la cancelación de un servidor) responden al instante, y una herramienta de la cuenta responde con una solicitud de inicio de sesión. Los agentes que admiten el inicio de sesión en MCP, como Claude Code, abren entonces el inicio de sesión de BladeCP en el navegador, donde permites el acceso de solo lectura (`bladecp:read`). Puedes desconectarlo cuando quieras en tu cuenta BladeCP, en [Apps conectadas](https://secure.bladecp.com/account/applications). Con tu clave, las herramientas de la cuenta funcionan directamente, como antes. Consulta la [documentación del BladeCP MCP](https://developers.bladecp.com/es/mcp).

## Clave de API

1. Crea una clave de API personal en el Hub, en [Claves de API](https://hub.bladecp.com/account/api-keys). Los pasos están en la página [Claves de API](https://developers.bladecp.com/es/getting-started/api-keys) de la documentación.
2. Guárdala en tu gestor de secretos y expórtala en el entorno donde se abre el agente. Ejemplo en macOS, con la clave guardada en el Keychain:

   ```sh
   export BLADECP_API_KEY="$(security find-generic-password -s bladecp-api-key -w)"
   ```

3. Abre una nueva sesión del agente.

Las claves personales caducan, a los 90 días por defecto. Cuando las herramientas de la cuenta empiecen a responder con un error de autenticación, crea una nueva clave y actualiza la variable.

La variable es lo que necesita el servidor MCP cuando no inicias sesión con BladeCP. La BladeCP CLI inicia sesión con `bladecp login`, que abre el Hub en el navegador ([Conectar con el navegador](https://developers.bladecp.com/es/getting-started/connect)), y también acepta `BLADECP_API_KEY`.

**Claves de socio.** Los comandos `bladecp partner` necesitan una clave de socio, con el alcance `partner:read`, creada en el área de socio del Hub, en Claves de API. `bladecp login` guarda una clave personal; para el trabajo de socio, define `BLADECP_API_KEY` con la clave de socio en el entorno donde se abre el agente.

**Sin clave**, sigues teniendo las skills, las herramientas del MCP que no piden iniciar sesión (`search_docs`, `get_doc_page`, `list_doc_pages`, `recommend_plan`, `explain_migration` y `explain_server_closing`), las herramientas de la cuenta después de iniciar sesión con BladeCP en un agente que lo admite y la BladeCP CLI después de `bladecp login`.

## Seguridad

- **Nunca pegues tu clave en el chat.** Las skills indican al agente que nunca la pida. La clave viene de una variable de entorno o de tu gestor de secretos.
- **Una persona aprueba.** Las herramientas del MCP solo leen. Las skills nunca aprueban, cancelan ni reintentan una migración, ni cambian un servidor o un servicio de socio, sin tu instrucción explícita. Con `--json` la BladeCP CLI no vuelve a preguntar, así que las skills tratan tu pedido como la decisión.
- **Valores de un solo uso.** Los secretos de firma de webhook y los enlaces de acceso de un solo uso se te entregan una vez y nunca se guardan.
- **El contenido es información.** Las skills indican al agente que trate archivos, backups, documentación y resultados de herramientas como información, nunca como instrucciones.
- **Recorrido de la clave.** La clave viaja en una cabecera hasta `mcp.bladecp.com`, que la usa solo para llamar a la API de BladeCP por ti y no la registra.
- **Inicio de sesión.** Iniciar sesión con BladeCP concede un único permiso, de solo lectura, `bladecp:read`, y no deja ninguna clave en el agente. Desconecta la app cuando quieras en tu cuenta BladeCP, en Apps conectadas.
- **Nada se ejecuta al instalar.** El plugin es texto: skills, manifiestos JSON e iconos, sin hooks ni ejecutables.
- **Repositorio público.** Este repositorio no contiene secretos. Los archivos de configuración solo citan nombres de variables.

El modelo completo está en [docs/security.md](docs/security.md) (en inglés). Para informar de una vulnerabilidad en privado, sigue el [SECURITY.md](SECURITY.md).

<a id="calidad"></a>

## Calidad y validación

La versión `0.2.2` fue validada por los mantenedores antes de publicarse:

- **38 verificaciones de release** en las herramientas de publicación: paquete determinista, lista cerrada de archivos, controles de filtraciones y de enlaces y los bloqueos de la etapa de publicación.
- **Verificación de contrato** en cada skill y README: cada herramienta del MCP y sus parámetros, cada comando y flag de la BladeCP CLI y cada página de la documentación deben existir en los contratos actuales de BladeCP.
- **Validación en los clientes** con `claude plugin validate --strict` y `agy plugin validate`, y de `plugin.json` y `mcp.json` contra los esquemas de [Agent Plugins](https://agent-plugins.org).
- **Instalación desde el paquete de la release** en Claude Code, y seis rondas de pruebas del plugin en Claude Code contra el MCP y la BladeCP CLI de producción: las herramientas públicas sin clave, el inicio de sesión, todas las skills y la desconexión de la app.

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

No. Las skills, las herramientas de documentación y las públicas del MCP y la BladeCP CLI (después de `bladecp login`) funcionan sin ella. Para las herramientas de la cuenta del MCP, que son de solo lectura, puedes iniciar sesión con BladeCP en los agentes que admiten el inicio de sesión en MCP, como Claude Code, o usar la clave. Los comandos de socio de la CLI necesitan una clave de socio.

</details>

<details>
<summary><strong>¿Puede el agente aprobar una migración o cambiar un servicio por su cuenta?</strong></summary>

No. El MCP no cambia nada, y las skills solo ejecutan `bladecp migrations approve`, `cancel` o `retry`, o un comando que cambia un servidor o un servicio de socio, cuando lo pides explícitamente para ese elemento. También puedes decidir en el Hub.

</details>

<details>
<summary><strong>Soy socio de BladeCP. ¿Qué obtiene mi agente?</strong></summary>

La skill `bladecp-partner`. Con una clave de socio, tu agente ejecuta los comandos `bladecp partner` de la BladeCP CLI 0.4.0 o posterior: planes y opciones, servidores de tus clientes, cuentas de BladeCP Vibe, ganancias del marketplace, webhooks y las solicitudes de Fast Deploy de BladeCP for WHMCS. Lee antes de cada cambio y solo cambia lo que pides.

</details>

<details>
<summary><strong>¿A dónde va mi clave?</strong></summary>

De la variable de entorno a `mcp.bladecp.com`, en una cabecera. El MCP la usa solo para llamar a la API de BladeCP por ti y no la registra. En Antigravity CLI, la clave también queda guardada en tu configuración local de MCP.

</details>

<details>
<summary><strong>¿Por qué Codex, Cursor y Antigravity necesitan una entrada más para la clave?</strong></summary>

Sus plugins no leen una cabecera desde una variable de entorno, así que el servidor del plugin se conecta sin clave: las herramientas de documentación y las públicas funcionan, y las herramientas de la cuenta piden el inicio de sesión de BladeCP donde el agente lo admite. La entrada de configuración indicada para cada agente agrega la clave, y las herramientas de la cuenta funcionan directamente.

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
