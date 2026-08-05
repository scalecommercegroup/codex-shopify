# Developer reference: Shopify web-design standards

Start with [README.md](README.md) for the complete zero-to-working installation. This reference explains how the package is structured and used after installation.

This package gives Codex durable project rules plus a reusable Shopify/ecommerce design workflow. Use it for Shopify theme work, page design, responsive fixes, component libraries, navigation, product and collection pages, search, cart, forms, accessibility, performance, and QA.

## 1. What is included

```text
project-root/
├── AGENTS.md
└── .agents/
    └── skills/
        └── shopify-web-design/
            ├── SKILL.md
            ├── agents/
            │   └── openai.yaml
            └── references/
                ├── design-system.md
                ├── shopify-storefront.md
                └── qa-checklist.md
```

### `AGENTS.md`

Codex reads this automatically before working in the project. It contains the non-negotiable rules that should apply to every task: design-system consistency, mobile-first work, safe Shopify changes, accessibility, verification, and blocker reporting.

### `shopify-web-design` skill

The skill contains the reusable workflow. Codex first sees its name and description, then loads the complete `SKILL.md` when:

- the request matches Shopify storefront or ecommerce design work; or
- you explicitly write `$shopify-web-design` in the prompt.

The detailed reference files load only when relevant. This keeps ordinary tasks from receiving the entire design handbook every time.

### Official Shopify skills

This custom skill complements the official installed Shopify skills; it does not replace or bundle them:

- `shopify-liquid`: Liquid, sections, blocks, schema, and theme validation;
- `shopify-admin`: Admin GraphQL design;
- `shopify-custom-data`: metafields and metaobjects;
- other Shopify skills such as Hydrogen or Functions when those technologies are in scope.

Confirm that the developer's Codex environment also has Shopify's official AI Toolkit. The recommended Codex installation is `codex plugin add shopify@openai-curated`. If `shopify-liquid`, `shopify-admin`, and `shopify-custom-data` do not appear after restarting Codex, ask the workspace administrator whether plugin installation is restricted. Do not copy another developer's private Codex installation directory.

## 2. Recommended installation: repository-local

Use this option for company and client projects. It ensures every developer and agent uses the same version.

### Step 1: copy the files

Copy these into the root of the Shopify repository:

```text
AGENTS.md
.agents/skills/shopify-web-design/
```

Important:

- `.agents` is a hidden directory on some systems. Make sure it is included.
- Copy the complete skill directory, including `agents/openai.yaml` and all references.
- If the destination already has an `AGENTS.md`, merge the rules deliberately. Do not overwrite project-specific instructions blindly.
- Do not copy API keys, store passwords, access tokens, private exports, or client secrets with the package.

### Step 2: commit both to source control

The following should be versioned together:

```text
AGENTS.md
.agents/skills/shopify-web-design/**
```

This allows changes to be reviewed in pull requests and keeps the whole team on the same standard.

### Step 3: open the repository correctly

Open Codex from the repository root, or select the repository root as the workspace. Codex scans `.agents/skills` from the working directory up to the repository root.

After first installation or after changing skill metadata, start a new task/session. If the skill still does not appear, restart Codex.

### Step 4: verify installation

Start a read-only task with:

```text
Summarize the active AGENTS.md instructions and list the Shopify skills available for this project. Do not change any files.
```

Confirm that the response mentions:

- the root `AGENTS.md`;
- `shopify-web-design`;
- `shopify-liquid`;
- `shopify-admin`;
- `shopify-custom-data`.

In Codex CLI, you can also use `/skills` or type `$shopify-web-design` in a prompt. The desktop app exposes discovered skills in its Skills interface.

## 3. Optional installation: personal/global

Use this only when a repository does not ship the skill and one developer wants it available across projects.

On Windows, copy the skill directory to:

```text
%USERPROFILE%\.agents\skills\shopify-web-design\
```

On macOS or Linux:

```text
~/.agents/skills/shopify-web-design/
```

For personal rules that should apply to every repository, use:

```text
~/.codex/AGENTS.md
```

Do not install the same skill at both repository and personal scope unless you intentionally want duplicate entries. Codex does not merge two skills with the same name. For team work, the repository-local installation is preferable.

## 4. Add client-specific instructions

Keep universal rules in the root `AGENTS.md`. Add a nested file only when a directory needs narrower instructions.

Example:

```text
project-root/
├── AGENTS.md
└── themes/
    └── client-theme/
        └── AGENTS.md
```

A theme-specific file can define:

- approved brand fonts and exact design tokens;
- logo and image sources;
- target theme name and role;
- content language and markets;
- approved reference designs;
- page-specific requirements;
- integrations and content sources;
- test commands;
- rules about uploading or publishing.

Instructions closer to the working directory take precedence over broader instructions. Do not repeat the entire root file in the nested file.

## 5. How to use it in daily work

Explicitly invoke the skill for important storefront tasks:

```text
$shopify-web-design Audit and improve the collection page on mobile and desktop. Reuse the existing design system, keep the current product data, and do not publish the theme. Test filters, sorting, product cards and empty results.
```

Other examples:

```text
$shopify-web-design Redesign the desktop header and mega-menu. Keep search prominent without squeezing the logo or cart actions. Verify at 1366×768 and 375px.
```

```text
$shopify-web-design Build a reusable Shopify section for service cards. Use blocks, approved spacing tokens, localized strings and accessible focus states.
```

```text
$shopify-web-design Review this product page against the QA checklist. Diagnose problems first and do not implement fixes until I confirm.
```

For Liquid implementation, mention both the goal and the platform context. Codex should automatically combine the custom design workflow with `shopify-liquid`.

For metafields or metaobjects, state that explicitly. Codex must use `shopify-custom-data` first.

For catalog or Admin API operations, describe the exact records and fields in scope. Expect a backup, dry run, narrow mutation, user-error inspection, and post-update export.

## 6. Expected workflow

For a normal Shopify design/build task, Codex should:

1. Read applicable `AGENTS.md` instructions.
2. Load `shopify-web-design` and the relevant official Shopify skill.
3. Inspect the existing theme, components, design tokens, real content, and rendered page.
4. Confirm the target theme/environment and avoid production publication unless authorized.
5. Implement reusable sections, blocks, snippets, settings, and tokens instead of page-specific patches.
6. Review mobile first, then tablet, short laptop, and wide desktop.
7. Test affected commerce interactions such as variants, search, filters, quick add, cart drawer, forms, and checkout handoff.
8. Run Shopify Theme Check or the relevant validator.
9. Report completed changes, evidence, skipped checks, blockers, provisional links, and next actions.

A successful API call or build command does not prove the storefront works. The expected visible interface state must also be verified.

## 7. Developer responsibilities

Before asking Codex to change anything:

- identify the exact repository, branch, theme, and route;
- provide the approved reference or brief;
- state whether the task is diagnosis, proposal, implementation, or publication;
- identify the source of business facts and content;
- state what must not change.

Before approving the result:

- review the actual preview rather than only the code diff;
- test at 375px and a short laptop viewport;
- test keyboard focus and critical shopping flows;
- confirm text, prices, stock, shipping, contact and legal claims;
- read the reported blockers and omissions;
- do not publish merely because Theme Check passed.

## 8. Updating the standards

When a recurring lesson appears across projects:

1. Add the short enforceable rule to `AGENTS.md` only if it should apply on every relevant task.
2. Add detailed methodology to the appropriate skill reference.
3. Keep client facts in a client-specific nested `AGENTS.md`, not in the universal skill.
4. Review the change like code and test the skill with a realistic prompt.
5. Start a new Codex session if updated behavior does not appear.

Avoid turning `AGENTS.md` into a large handbook. Codex has a size limit for combined project instructions, and oversized automatic instructions consume context on every task.

## 9. Troubleshooting

### The skill does not appear

Check:

```text
.agents/skills/shopify-web-design/SKILL.md
```

Then verify:

- `SKILL.md` contains valid YAML frontmatter with `name` and `description`;
- Codex was opened from the correct repository/workspace;
- the hidden `.agents` directory was actually copied;
- a new Codex session was started;
- another skill with the same name is not installed at personal scope.

### `AGENTS.md` is ignored

- Confirm it is named exactly `AGENTS.md` and is not empty.
- Confirm it is at the repository root or between the root and current working directory.
- Look for an `AGENTS.override.md` that may take precedence.
- Start a new Codex session after changes.

### The wrong rules are applied

- Ask Codex to list the active instruction sources.
- Check parent directories and `%USERPROFILE%\.codex\AGENTS.md` for global rules.
- Check for nested `AGENTS.md` or `AGENTS.override.md` files near the theme.
- Remove duplicated skill installations with the same name.

### Shopify-specific capabilities are missing

Install or refresh Shopify's official AI Toolkit with `codex plugin add shopify@openai-curated`, then restart Codex. The custom design skill cannot provide Shopify API schemas or Liquid validation by itself.

## 10. Security and deployment

- Never store Shopify client secrets, Admin tokens, storefront passwords, or private keys in `AGENTS.md`, `SKILL.md`, Git, screenshots, or prompts intended for sharing.
- Use environment variables or the approved credential flow.
- Work on an unpublished or duplicate theme by default.
- Review bulk-operation backups and dry runs.
- Publishing, deleting data, changing checkout behavior, and broad production mutations require explicit authorization.

## Official references

- [Codex CLI](https://developers.openai.com/codex/cli)
- [Build skills](https://developers.openai.com/plugins/build/skills)
- [Custom instructions with AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
- [Shopify AI Toolkit](https://shopify.dev/docs/apps/build/ai-toolkit)
- [Shopify CLI](https://shopify.dev/docs/api/shopify-cli)
- [Agent Skills standard](https://agentskills.io)
