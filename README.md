# Codex Shopify development standards

A reusable Codex setup for Shopify theme and ecommerce storefront development. It combines:

- durable repository rules in `AGENTS.md`;
- a custom `shopify-web-design` skill for design systems, responsive ecommerce UX, accessibility and QA;
- Shopify's official AI Toolkit for current Liquid, API, schema and validation knowledge;
- a safe workflow for local theme development, previews, Git review and handoff.

This repository does not contain Shopify credentials, store data or a theme. Install its standards into each Shopify project that should use them.

## Contents

```text
codex-shopify/
|-- AGENTS.md
|-- DEVELOPER_GUIDE.md
|-- IMPLEMENTATION_LOG.md
|-- README.md
|-- .agents/
|   `-- skills/
|       `-- shopify-web-design/
|           |-- SKILL.md
|           |-- agents/openai.yaml
|           `-- references/
|               |-- design-system.md
|               |-- qa-checklist.md
|               `-- shopify-storefront.md
`-- scripts/
    |-- install.ps1
    `-- install.sh
```

## Recommended setup

Use all three layers:

1. Install Codex.
2. Install Shopify's official AI Toolkit plugin in Codex.
3. Copy this repository's `AGENTS.md` and `shopify-web-design` skill into the Shopify theme repository.

The official Shopify plugin and the custom skill are not substitutes for one another:

- Shopify's plugin supplies current documentation, API schemas and Shopify-specific validation.
- `shopify-web-design` supplies the design-system, ecommerce UX, responsive, accessibility and evidence-based QA workflow.
- `AGENTS.md` keeps the non-negotiable project rules active on every task.

## Zero-to-working installation

### 1. Obtain the required accounts and access

Before installing software, confirm that the developer has:

- access to ChatGPT/Codex through the approved company account;
- access to the relevant GitHub repositories;
- Shopify access as the store owner, a staff account with the Themes permission, or a collaborator with Manage themes permission;
- permission to work on an unpublished or development theme.

Do not share Shopify access tokens, custom-app secrets or passwords in Git, screenshots, documentation or ordinary prompts.

### 2. Install Git and Node.js

Shopify CLI currently requires:

- Node.js `22.12` or newer;
- Git `2.28.0` or newer;
- npm, Yarn 1.x or pnpm.

Install the current supported versions from:

- [Node.js](https://nodejs.org/en/download)
- [Git](https://git-scm.com/downloads)

Verify them:

```sh
node --version
npm --version
git --version
```

Do not continue until all three commands work in a new terminal.

### 3. Install Codex

Choose one Codex surface. The desktop app is recommended for visual Shopify work because it supports projects, previews, browser testing, plugins and skills in one interface. The CLI is useful for terminal-first workflows and automation.

#### Windows desktop app

Install from the Microsoft Store or run:

```powershell
winget install --id 9PLM9XGG6VKS -s msstore
```

Open the app and sign in with the approved ChatGPT account.

#### Codex CLI

With Node.js installed:

```sh
npm install -g @openai/codex
codex --version
```

Open the project directory, run `codex`, and complete the sign-in flow:

```sh
cd path/to/project
codex
```

On macOS or Linux, the official standalone installer is also available:

```sh
curl -fsSL https://chatgpt.com/codex/install.sh | sh
```

### 4. Install Shopify CLI

Install Shopify CLI globally:

```sh
npm install -g @shopify/cli@latest
shopify version
```

If `shopify` is not found, close the terminal, open a new one and run the version check again.

### 5. Install Shopify's official AI Toolkit

The plugin is Shopify's recommended installation because it bundles the official capabilities and can update automatically.

From Codex CLI:

```sh
codex plugin add shopify@openai-curated
```

In an interactive Codex session, you can instead run `/plugins`, search for `Shopify`, and add it to Codex. Restart Codex or start a new session after installation.

Manual skill installation is a fallback, not the default, because manually added skills do not auto-update:

```sh
npx skills add Shopify/shopify-ai-toolkit
```

The expected Shopify skills include at least:

- `shopify-liquid`;
- `shopify-admin`;
- `shopify-custom-data`;
- `shopify-onboarding-dev`.

Other Shopify skills load when their API surface is relevant.

### 6. Clone this standards repository

```sh
git clone https://github.com/scalecommercegroup/codex-shopify.git
cd codex-shopify
```

### 7. Install the standards into a Shopify project

Run the installer from this repository and point it at the root of the Shopify theme repository.

Windows PowerShell:

```powershell
.\scripts\install.ps1 -TargetPath "C:\path\to\shopify-theme"
```

macOS, Linux or Git Bash:

```sh
./scripts/install.sh /path/to/shopify-theme
```

The installer copies:

```text
AGENTS.md
.agents/skills/shopify-web-design/**
```

It deliberately refuses to overwrite an existing, different `AGENTS.md` or an existing `shopify-web-design` skill. If either exists, review and merge the files manually instead of erasing project-specific rules.

Manual installation is also valid: copy `AGENTS.md` and the complete `.agents/skills/shopify-web-design` directory into the target repository root.

Commit both paths to the Shopify project's Git repository so every developer uses the same version.

### 8. Open and verify the Shopify project

Open Codex from the Shopify repository root, not from a parent downloads folder or an unrelated workspace. Start a new task and run this read-only verification prompt:

```text
Summarize the active AGENTS.md instructions and list the Shopify skills available for this project. Do not change any files.
```

Confirm that Codex reports:

- the repository's `AGENTS.md`;
- `shopify-web-design`;
- Shopify's official skills, including `shopify-liquid`, `shopify-admin` and `shopify-custom-data`.

If using the CLI, `/skills` shows discovered skills. Explicitly typing `$shopify-web-design` in a prompt should also invoke the custom skill.

## Connect a Shopify theme

### Existing Git-managed theme

Clone the theme repository and install these standards into its root:

```sh
git clone <theme-repository-url>
cd <theme-repository-folder>
```

Do not pull store files over a repository without first checking Git status and confirming the target theme.

### Existing theme available only in Shopify

Create a new empty local directory, then inspect the available themes:

```sh
shopify theme list --store store-name.myshopify.com
```

Pull the selected unpublished or duplicate theme into that directory. Confirm the exact theme ID before running the command:

```sh
shopify theme pull --store store-name.myshopify.com --theme <theme-id>
```

Initialize Git after confirming that the pull is correct, then install these standards.

### New theme

Create a theme from Shopify's current starter:

```sh
shopify theme init theme-name
cd theme-name
```

Then initialize Git and install these standards.

### Start local theme development

From a valid Shopify theme directory:

```sh
shopify theme dev --store store-name.myshopify.com
```

The first store command prompts for Shopify authentication. Check the active connection at any time:

```sh
shopify theme info
```

Work on a development, duplicate or unpublished theme. Do not publish a theme unless the responsible person explicitly authorizes publication after preview QA.

## First task checklist

Before asking Codex to edit a storefront, provide:

- the exact repository, branch, store and target theme;
- the route or template in scope;
- the approved design or wireframe;
- the content and business-fact sources;
- whether the request is diagnosis, proposal, implementation or publication;
- anything that must not change.

Example:

```text
$shopify-web-design Audit and improve the collection page on mobile and desktop.
Use the existing design system and real product data. Work only on the unpublished
theme. Test filters, sorting, product cards and empty results. Do not publish.
```

For Liquid implementation, Codex should combine `shopify-web-design` with `shopify-liquid`. For metafields or metaobjects, it must use `shopify-custom-data` first. For Admin GraphQL design, it should use `shopify-admin`.

## Required validation before handoff

The relevant checks should include:

```sh
shopify theme check
```

Also verify the actual rendered storefront at mobile and desktop sizes. Theme Check cannot prove that spacing, menus, drawers, search, variant selection, add-to-cart, cart updates, filters or forms work visually.

Every handoff should state:

- what changed;
- what was tested and at which viewports;
- validation results;
- what was skipped and why;
- blockers, missing content, provisional links and exact next actions.

## Updating an installed project

Pull the latest standards repository:

```sh
git pull --ff-only
```

Then review the changes before merging them into a Shopify project. Do not blindly overwrite a client-specific `AGENTS.md`. The custom skill can normally be replaced as a complete directory after reviewing its diff.

## Security rules

- Never commit `.env` files, access tokens, Theme Access passwords, private keys or Shopify client secrets.
- Never paste secrets into `AGENTS.md`, `SKILL.md`, documentation or screenshots.
- Use the smallest Shopify scopes needed for the task.
- Prefer preview, development and unpublished themes.
- Require explicit authorization for publication, destructive catalog writes, deletions and broad production mutations.
- Create Git checkpoints before and after meaningful tasks.
- Review the rendered storefront and the code diff before shipping.

## Troubleshooting

### The custom skill is missing

Confirm this exact path exists inside the Shopify repository:

```text
.agents/skills/shopify-web-design/SKILL.md
```

Then open Codex from the repository root and start a new session.

### Shopify's official skills are missing

Run:

```sh
codex plugin add shopify@openai-curated
```

Restart Codex. If plugins are controlled by a company workspace, ask the workspace administrator to allow or install Shopify's plugin.

### Shopify CLI cannot find the store

Use the permanent `.myshopify.com` domain, verify the account has theme permissions, and run:

```sh
shopify auth logout
shopify theme dev --store store-name.myshopify.com
```

### Existing project instructions conflict

Do not overwrite them. Merge the universal rules deliberately, keep client facts in the project-level instructions, and use a nested `AGENTS.md` only where a subdirectory genuinely needs narrower rules.

## More detail

Read [DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md) for installation scopes, daily usage, nested project instructions, maintenance and troubleshooting.

## Official references

- [Codex CLI](https://developers.openai.com/codex/cli)
- [Codex `AGENTS.md`](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
- [Shopify AI Toolkit](https://shopify.dev/docs/apps/build/ai-toolkit)
- [Shopify CLI](https://shopify.dev/docs/api/shopify-cli)
- [Shopify CLI for themes](https://shopify.dev/docs/storefronts/themes/tools/cli)
- [Shopify AI Toolkit source](https://github.com/Shopify/Shopify-AI-Toolkit)
