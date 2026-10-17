<p align="center">
  <picture>
    <source media="(max-width: 600px)" srcset="assets/hero-compact.pt-BR.svg">
    <img src="assets/hero.pt-BR.svg" alt="BladeCP Agent Skills. Agent Skills oficiais: ensine seu agente de IA a operar a BladeCP. Três skills e o BladeCP MCP para Claude Code, Codex, Cursor, Antigravity e OpenCode. As aprovações ficam com você." width="100%">
  </picture>
</p>

<p align="center">
  <strong>Ensine seu agente de IA a migrar sites, consultar sua conta e seguir a documentação da BladeCP.</strong><br>
  As skills oficiais e o BladeCP MCP para Claude Code, Codex, Cursor, Antigravity CLI e OpenCode.
</p>

<p align="center">
  <a href="CHANGELOG.md"><img src="https://img.shields.io/badge/vers%C3%A3o-0.1.0-4f46e5?style=flat-square&amp;labelColor=1e1b4b" alt="Versão 0.1.0"></a>
  <a href="#instalacao"><img src="https://img.shields.io/badge/agentes-Claude%20Code%20%C2%B7%20Codex%20%C2%B7%20Cursor%20%C2%B7%20Antigravity%20%C2%B7%20OpenCode-6366f1?style=flat-square&amp;labelColor=1e1b4b" alt="Agentes: Claude Code, Codex, Cursor, Antigravity e OpenCode"></a>
  <a href="#skills"><img src="https://img.shields.io/badge/skills-3-7c3aed?style=flat-square&amp;labelColor=1e1b4b" alt="3 skills"></a><br>
  <a href="#mcp"><img src="https://img.shields.io/badge/MCP-11%20ferramentas%20s%C3%B3%20leitura-4f46e5?style=flat-square&amp;labelColor=1e1b4b" alt="BladeCP MCP com 11 ferramentas somente leitura"></a>
  <a href="#qualidade"><img src="https://img.shields.io/badge/verifica%C3%A7%C3%B5es-38%20aprovadas-8b5cf6?style=flat-square&amp;labelColor=1e1b4b" alt="38 verificações de release aprovadas na 0.1.0"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licen%C3%A7a-MIT-4338ca?style=flat-square&amp;labelColor=1e1b4b" alt="Licença MIT"></a>
  <a href="https://github.com/bladecp/skills/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/bladecp/skills/ci.yml?branch=main&amp;style=flat-square&amp;labelColor=1e1b4b&amp;label=CI%20p%C3%BAblico" alt="Status do CI público"></a>
</p>

<p align="center">
  <a href="#instalacao"><strong>Instalar</strong></a>
  &nbsp;·&nbsp;
  <a href="https://github.com/bladecp/skills/releases/tag/v0.1.0">Notas da versão</a>
  &nbsp;·&nbsp;
  <a href="https://github.com/bladecp/skills/releases/download/v0.1.0/SHA256SUMS">Checksum SHA-256</a>
</p>

<p align="center">
  <a href="#skills">Skills</a> ·
  <a href="#arquitetura">Arquitetura</a> ·
  <a href="#instalacao">Instalação</a> ·
  <a href="#mcp">Servidor MCP</a> ·
  <a href="#chave-de-api">Chave de API</a> ·
  <a href="#seguranca">Segurança</a> ·
  <a href="#perguntas">Perguntas</a> ·
  <a href="#suporte">Suporte</a>
  <br>
  <sub><a href="README.md">English</a> · <a href="README.es.md">Español</a></sub>
</p>

> [!TIP]
> **Configuração guiada.** Cole a frase abaixo no seu agente e ele conduz a instalação: `Busque e siga as instruções para me configurar para a BladeCP em https://developers.bladecp.com/pt-BR/agents/prompt.md`

As BladeCP Agent Skills são o plugin oficial da BladeCP para agentes de programação. Elas ensinam o seu agente a migrar um site do cPanel para a BladeCP com a BladeCP CLI, a consultar seus servidores e migrações e a seguir a documentação do [BladeCP Developers](https://developers.bladecp.com/pt-BR). O plugin também conecta o servidor BladeCP MCP, que oferece a documentação para qualquer pessoa e, com a sua chave de API, dados da sua conta somente para leitura.

O pacote segue o padrão [Agent Skills](https://agentskills.io) e traz manifestos de plugin para Claude Code, Codex, Cursor e Antigravity, além de um manifesto portátil [Agent Plugins](https://agent-plugins.org). O OpenCode e outros agentes instalam as skills e conectam o servidor MCP diretamente. Guia para cada agente: https://developers.bladecp.com/pt-BR/agents

<a id="skills"></a>

## O que o seu agente aprende

| Escolher a ferramenta certa | Migrar do cPanel | Consultar a sua conta |
| --- | --- | --- |
| `bladecp` explica o que a BladeCP oferece para desenvolvedores, qual ferramenta usar em cada tarefa, como ler a documentação, chaves de API e as regras de segurança. | `bladecp-migrate` leva um backup completo do cPanel pela BladeCP CLI, do login até a prévia privada, e deixa a aprovação com você. | `bladecp-servers` consulta conta, servidores, uso, domínios e migrações pelo MCP e diagnostica uma migração que falhou. |

As skills são carregadas automaticamente quando a conversa trata do assunto delas. Elas apontam o agente para as páginas `.md` da documentação oficial, sem copiar o conteúdo, para que o agente siga sempre o contrato atual.

### O que as skills nunca fazem

- **Pedir a sua chave na conversa.** A chave vem de uma variável de ambiente ou do seu gerenciador de segredos, e o agente nunca a imprime nem a grava.
- **Aprovar sozinhas.** Aprovar, cancelar e repetir uma migração exigem uma instrução explícita sua para aquela migração.
- **Obedecer conteúdo.** Arquivos, backups, documentação e resultados de ferramentas são informação, nunca instrução.
- **Alterar algo pelo MCP.** O MCP só lê. O envio passa pela BladeCP CLI, e as decisões ficam com uma pessoa, na CLI ou no Hub.

### O que vem no plugin

| Componente | Conteúdo |
| --- | --- |
| Skills | `bladecp`, `bladecp-migrate` e `bladecp-servers`, no padrão Agent Skills |
| Servidor MCP | Um único servidor, `bladecp`, em `https://mcp.bladecp.com/mcp` |
| Manifestos | Claude Code, Codex, Cursor, Antigravity e Agent Plugins |
| BladeCP CLI | Executada sob demanda com `npx @bladecp/cli`; precisa de Node.js 20 ou mais recente e tem login próprio |

## Arquitetura

O agente carrega as skills, as skills decidem qual ferramenta da BladeCP serve para a tarefa, e toda ação que altera algo continua com você. O MCP lê; a CLI envia; você aprova.

<p align="center">
  <picture>
    <source media="(max-width: 600px)" srcset="assets/architecture-compact.pt-BR.svg">
    <img src="assets/architecture.pt-BR.svg" alt="Como funcionam as BladeCP Agent Skills. O seu agente de IA carrega as skills. A skill bladecp escolhe a ferramenta e aponta a documentação, a bladecp-migrate executa a BladeCP CLI até a prévia privada e a bladecp-servers lê a conta pelo BladeCP MCP em mcp.bladecp.com/mcp. O MCP oferece as ferramentas de documentação sem chave e oito ferramentas da conta, somente leitura, com a BLADECP_API_KEY, chamando a Customer API em api.bladecp.com. Todas as skills leem o BladeCP Developers. Você aprova, cancela e repete." width="100%">
  </picture>
</p>

<p align="center"><sub>Visão lógica do plugin. <a href="assets/architecture.pt-BR.svg">Abrir o diagrama em tamanho real</a>.</sub></p>

### Do seu pedido à BladeCP

1. **O agente carrega as skills.** A skill `bladecp` vem primeiro e escolhe a ferramenta para a tarefa.
2. **A documentação vem primeiro.** Toda skill lê as páginas `.md` do BladeCP Developers, diretamente ou pelas ferramentas de documentação do MCP, que não pedem chave.
3. **As consultas passam pelo MCP.** Com a `BLADECP_API_KEY` no ambiente do agente, o MCP chama a Customer API por você, somente para leitura.
4. **As migrações passam pela CLI.** A `bladecp-migrate` executa a BladeCP CLI, que envia o backup e acompanha a migração até a prévia privada.
5. **Quem decide é você.** Aprovar, cancelar e repetir só acontecem com a sua instrução, na CLI ou no Hub.

<a id="instalacao"></a>

## Instalação

| Agente | Instalação | Ferramentas da conta com a sua chave |
| --- | --- | --- |
| **Claude Code** | `claude plugin marketplace add bladecp/skills`<br>`claude plugin install bladecp@bladecp` | Automático: o plugin lê a `BLADECP_API_KEY` |
| **Codex** | `codex plugin marketplace add bladecp/skills`<br>`codex plugin add bladecp@bladecp` | Uma entrada no `~/.codex/config.toml` |
| **Cursor** | **Customize** › **From GitHub Repository** › `https://github.com/bladecp/skills` | Uma entrada no `~/.cursor/mcp.json` |
| **Antigravity CLI** | `agy plugin install https://github.com/bladecp/skills` | Um servidor adicionado com `agy mcp add` |
| **OpenCode** | Copie `skills/` para `~/.config/opencode/skills/` | Uma entrada no `opencode.json` |
| **Outros agentes** | `npx -y skills add bladecp/skills --skill '*'` | As configurações de MCP do seu agente |

Toda instalação funciona sem chave, em modo só documentação. Os passos de cada agente vêm a seguir; verificação, atualização e remoção estão em [docs/installation.md](docs/installation.md) (em inglês).

### Claude Code

No terminal:

```sh
claude plugin marketplace add bladecp/skills
claude plugin install bladecp@bladecp
```

Dentro de uma sessão aberta, o equivalente é:

```text
/plugin marketplace add bladecp/skills
/plugin install bladecp@bladecp
/reload-plugins
```

O `/reload-plugins` aplica o plugin na sessão atual sem reiniciar. Depois, confira em `/mcp` se `bladecp` aparece como servidor do plugin. O plugin lê a chave da variável `BLADECP_API_KEY`: defina a variável **antes** de abrir o Claude Code e abra uma nova sessão se ela mudar.

### Codex

```sh
codex plugin marketplace add bladecp/skills
codex plugin add bladecp@bladecp
```

Também é possível instalar pelo navegador de plugins, com `/plugins` dentro da Codex CLI. Abra uma nova sessão depois da instalação.

O plugin instala as skills e o servidor MCP em **modo só documentação**, porque um plugin do Codex não consegue repassar a sua chave a partir de uma variável de ambiente. Para habilitar as ferramentas da conta, acrescente ao `~/.codex/config.toml`:

```toml
[mcp_servers.bladecp]
url = "https://mcp.bladecp.com/mcp"
env_http_headers = { "X-API-KEY" = "BLADECP_API_KEY" }
```

Com essa entrada, o Codex lista um único servidor `bladecp`, que envia a chave. Se a variável estiver vazia ou ausente, o Codex não envia o cabeçalho e o servidor continua no modo só documentação.

### Cursor

No Cursor, abra **Customize**, escolha **From GitHub Repository**, informe `https://github.com/bladecp/skills` e instale o plugin `bladecp`. Para testar sem importar, copie o repositório para `~/.cursor/plugins/local/bladecp` e rode **Developer: Reload Window**.

Assim como no Codex, o servidor do plugin funciona em **modo só documentação**. Para habilitar as ferramentas da conta, acrescente ao `~/.cursor/mcp.json`, sem remover os servidores que já estão lá:

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

A variável precisa estar visível para o processo do Cursor: se as ferramentas da conta não aparecerem, abra o Cursor a partir de um terminal em que ela esteja exportada. Se o servidor `bladecp` do plugin também aparecer na lista de MCP, desative-o em **Customize** para não duplicar as ferramentas de documentação.

### Antigravity CLI

```sh
agy plugin install https://github.com/bladecp/skills
```

O plugin instala as skills e o servidor MCP em **modo só documentação**. O Antigravity não documenta expansão de variáveis de ambiente nos cabeçalhos do MCP, então, para habilitar as ferramentas da conta, rode no seu próprio terminal:

```sh
agy mcp add --header "X-API-KEY: $BLADECP_API_KEY" bladecp-account https://mcp.bladecp.com/mcp
```

O shell expande a variável e a chave fica gravada em `~/.gemini/config/mcp_config.json`. Mantenha esse arquivo privado e rode o comando de novo depois de trocar a chave.

### OpenCode

Copie as skills para a pasta de skills do OpenCode:

```sh
git clone --depth 1 https://github.com/bladecp/skills.git bladecp-skills
mkdir -p ~/.config/opencode/skills
cp -R bladecp-skills/skills/. ~/.config/opencode/skills/
```

Depois, acrescente o servidor MCP ao `~/.config/opencode/opencode.json`:

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

Se a variável não estiver definida, o OpenCode envia um valor vazio e o servidor continua no modo só documentação.

### Outros agentes

Instale apenas as skills com a CLI [`skills`](https://skills.sh):

```sh
npx -y skills add bladecp/skills --skill '*'
```

Depois, configure o MCP no seu agente: endereço `https://mcp.bladecp.com/mcp` (HTTP com streaming), com o cabeçalho `X-API-KEY` lido de uma variável de ambiente. Se o cliente só aceitar token do tipo bearer, o servidor também aceita `Authorization: Bearer <chave>`. Nunca grave a chave por extenso em um arquivo versionado.

### Atualização

- **Claude Code:** rode `claude plugin marketplace update bladecp` e `claude plugin update bladecp@bladecp` e abra uma nova sessão.
- **Codex:** rode `codex plugin marketplace upgrade bladecp` e `codex plugin add bladecp@bladecp` e abra uma nova sessão.
- **Cursor:** atualize o plugin em **Customize**, ou substitua a cópia local e recarregue a janela.
- **Antigravity CLI:** rode de novo o comando `agy plugin install`.
- **OpenCode e outros agentes:** copie as skills de novo, ou rode `npx -y skills update`.

Cada [release](https://github.com/bladecp/skills/releases) também traz `bladecp-skills-<versão>.zip` e `SHA256SUMS`. Confira o download com `shasum -a 256 -c SHA256SUMS`; o arquivo contém uma pasta `bladecp`, a raiz do plugin.

<a id="mcp"></a>

## Servidor BladeCP MCP

| Servidor | Endereço | Variável da chave |
| --- | --- | --- |
| `bladecp` | `https://mcp.bladecp.com/mcp` | `BLADECP_API_KEY` |

| Ferramentas | Disponibilidade |
| --- | --- |
| `search_docs`, `get_doc_page`, `list_doc_pages` | Sempre, inclusive sem chave |
| `get_account`, `list_servers`, `get_server`, `get_server_usage`, `list_server_domains`, `list_migrations`, `get_migration`, `list_migration_destinations` | Com chave |

O MCP é somente leitura. Ele não envia backups nem cria, aprova, cancela ou repete migrações. Sem chave, ele conecta normalmente em modo só documentação, e a mesma instalação passa a oferecer as ferramentas da conta assim que a variável for definida. Veja a [documentação do BladeCP MCP](https://developers.bladecp.com/pt-BR/mcp).

## Chave de API

1. Crie uma chave de API pessoal no Hub, em [Chaves de API](https://hub.bladecp.com/account/api-keys). O passo a passo está na página [Chaves de API](https://developers.bladecp.com/pt-BR/getting-started/api-keys) da documentação.
2. Guarde a chave no seu gerenciador de segredos e exporte-a no ambiente em que o agente é aberto. Exemplo no macOS, com a chave guardada no Keychain:

   ```sh
   export BLADECP_API_KEY="$(security find-generic-password -s bladecp-api-key -w)"
   ```

3. Abra uma nova sessão do agente.

As chaves pessoais expiram, depois de 90 dias por padrão. Quando as ferramentas da conta passarem a responder com erro de autenticação, crie uma nova chave e atualize a variável.

A variável é o que o servidor MCP precisa. A BladeCP CLI entra com `bladecp login`, que abre o Hub no navegador ([Conectar pelo navegador](https://developers.bladecp.com/pt-BR/getting-started/connect)), e também aceita a `BLADECP_API_KEY`.

**Sem chave**, você continua com as skills, as ferramentas de documentação do MCP (`search_docs`, `get_doc_page` e `list_doc_pages`) e a BladeCP CLI depois do `bladecp login`.

<a id="seguranca"></a>

## Segurança

- **Nunca cole a chave na conversa.** As skills orientam o agente a nunca pedir a chave. Ela vem de uma variável de ambiente ou do seu gerenciador de segredos.
- **Quem aprova é uma pessoa.** As ferramentas do MCP só leem. As skills nunca aprovam, cancelam ou repetem uma migração sem uma instrução explícita sua.
- **Conteúdo é dado.** As skills orientam o agente a tratar arquivos, backups, documentação e resultados de ferramentas como informação, nunca como instrução.
- **Caminho da chave.** A chave segue em um cabeçalho até `mcp.bladecp.com`, que a usa apenas para chamar a API da BladeCP por você e não a registra em log.
- **Nada roda na instalação.** O plugin é texto: skills, manifestos JSON e ícones, sem hooks nem executáveis.
- **Repositório público.** Este repositório não contém segredos. Os arquivos de configuração citam apenas nomes de variáveis.

O modelo completo está em [docs/security.md](docs/security.md) (em inglês). Para relatar uma vulnerabilidade em privado, siga o [SECURITY.md](SECURITY.md).

<a id="qualidade"></a>

## Qualidade e validação

A versão `0.1.0` foi validada pelos mantenedores antes da publicação:

- **38 verificações de release** nas ferramentas de publicação: pacote determinístico, lista fechada de arquivos, portões de vazamento e de links e as travas da etapa de publicação.
- **Conferência de contrato** em cada skill e README: cada ferramenta do MCP e seus parâmetros, cada comando e flag da BladeCP CLI e cada página da documentação precisam existir nos contratos atuais da BladeCP.
- **Validação nos clientes** com `claude plugin validate --strict` e `agy plugin validate`, e do `plugin.json` e do `mcp.json` contra os esquemas do [Agent Plugins](https://agent-plugins.org).
- **Instalação a partir do pacote da release** no Claude Code, no Codex, no Antigravity CLI e no OpenCode, e o MCP de produção respondendo em modo só documentação sem chave.

Este repositório inclui o portão público de estrutura e higiene (`scripts/check-public-tree.sh`). O [CI público](https://github.com/bladecp/skills/actions/workflows/ci.yml) roda esse portão a cada alteração, junto com a validação dos esquemas.

<a id="desenvolvimento"></a>

## Estrutura do repositório e contribuição

| Caminho | Função |
| --- | --- |
| `skills/<nome>/SKILL.md` | Skills no padrão Agent Skills |
| `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json` | Plugin e marketplace do Claude Code |
| `.mcp.json` | Servidor MCP com a chave lida do ambiente, usado pelo Claude Code |
| `plugin.json`, `mcp.json` | Manifesto portátil Agent Plugins e servidor MCP, usados pelo Codex e pelo Cursor |
| `.codex-plugin/plugin.json`, `.agents/plugins/marketplace.json` | Apresentação e marketplace do Codex |
| `.cursor-plugin/plugin.json`, `.cursor-plugin/marketplace.json` | Plugin e marketplace do Cursor |
| `mcp_config.json` | Servidor MCP do Antigravity |
| `assets/` | Ícone do plugin, logos da BladeCP e a arte do README |
| `docs/` | Guias de instalação, segurança, solução de problemas, release e governança |

Para validar o repositório depois de uma alteração:

```sh
bash scripts/check-public-tree.sh
claude plugin validate --strict .
```

Contribuições são bem-vindas. Leia o [CONTRIBUTING.md](CONTRIBUTING.md) antes de abrir uma issue ou um pull request e nunca envie chaves ou dados de clientes. As mudanças estão no [CHANGELOG](CHANGELOG.md), e o processo de release está em [docs/release-process.md](docs/release-process.md).

<a id="perguntas"></a>

## Perguntas frequentes

<details>
<summary><strong>Preciso de uma chave de API?</strong></summary>

Não. As skills, as ferramentas de documentação do MCP e a BladeCP CLI (depois do `bladecp login`) funcionam sem ela. A chave só habilita as ferramentas da conta do MCP, que são somente leitura.

</details>

<details>
<summary><strong>O agente pode aprovar ou cancelar uma migração sozinho?</strong></summary>

Não. O MCP não altera nada, e as skills só executam `bladecp migrations approve`, `cancel` ou `retry` quando você pede explicitamente para aquela migração. Você também pode decidir no Hub.

</details>

<details>
<summary><strong>Para onde vai a minha chave?</strong></summary>

Da variável de ambiente até `mcp.bladecp.com`, em um cabeçalho. O MCP a usa apenas para chamar a API da BladeCP por você e não a registra em log. No Antigravity CLI, a chave também fica gravada na sua configuração local de MCP.

</details>

<details>
<summary><strong>Por que Codex, Cursor e Antigravity começam em modo só documentação?</strong></summary>

Os plugins deles não leem um cabeçalho a partir de uma variável de ambiente. O plugin conecta sem chave, e a entrada de configuração mostrada para cada agente acrescenta a chave.

</details>

<details>
<summary><strong>O meu agente não está na lista. Posso usar as skills?</strong></summary>

Sim. Qualquer agente que leia o padrão Agent Skills pode instalá-las com `npx -y skills add bladecp/skills --skill '*'` e conectar o MCP em `https://mcp.bladecp.com/mcp`.

</details>

<details>
<summary><strong>Algo não funciona. Por onde começo?</strong></summary>

O [docs/troubleshooting.md](docs/troubleshooting.md) (em inglês) cobre o MCP, a instalação em cada agente e a BladeCP CLI.

</details>

## Suporte

| Assunto | Canal |
| --- | --- |
| Bug reproduzível ou pedido de recurso | [GitHub Issues](https://github.com/bladecp/skills/issues) |
| Suporte técnico e de produto | [dev@bladecp.com](mailto:dev@bladecp.com) |
| Vulnerabilidade | [Política de segurança](SECURITY.md) |
| Documentação | [BladeCP Developers](https://developers.bladecp.com/pt-BR) |

Em relatos públicos, nunca inclua chave de API, conteúdo de backup ou dados de clientes.

## Licença

As BladeCP Agent Skills são distribuídas sob a [Licença MIT](LICENSE). A licença cobre este repositório; o uso dos serviços BladeCP segue os [termos da BladeCP](https://bladecp.com/terms-and-conditions).

<p align="center"><strong>BladeCP. Seu agente, nossa infraestrutura.</strong></p>
