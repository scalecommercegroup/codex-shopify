---
name: shopify-web-design
description: Design, implement, redesign, and audit consistent ecommerce storefronts with a reusable design system, mobile-first layout, accessible interactions, conversion-focused information architecture, Shopify Online Store 2.0 components, and evidence-based QA. Use for Shopify themes, Liquid sections or blocks, headers, mega-menus, footers, homepages, landing pages, collection pages, product pages, predictive search, filters, carts, forms, responsive CSS, visual cleanup, design-system work, accessibility reviews, performance reviews, and storefront handoff.
---

# Shopify Web Design

Build coherent storefront systems instead of isolated pages. Preserve the approved information architecture and business facts while improving visual hierarchy, usability, accessibility, conversion, performance, and merchant editability.

## Start with project instructions

1. Read every applicable `AGENTS.md`, from repository root to the target file's directory.
2. Resolve instruction priority: explicit user request, approved brief/wireframe, project design system, then theme/framework defaults.
3. Identify the exact theme, route, template, environment, deployment status, and content source.
4. Inspect the current rendered interface and reusable components before proposing or implementing changes.
5. Do not treat a wireframe's placeholder styling as final design unless explicitly approved.

## Load the relevant references

- Read [references/design-system.md](references/design-system.md) for layout, spacing, typography, hierarchy, sections, headers, cards, buttons, imagery, and responsive design.
- Read [references/shopify-storefront.md](references/shopify-storefront.md) for Shopify architecture, Theme Editor controls, navigation, product/collection/search/cart patterns, SEO, performance, localization, and deployment safety.
- Read [references/qa-checklist.md](references/qa-checklist.md) before implementation handoff or when auditing an existing storefront.

Read only the references relevant to the current task, but always read the QA checklist before declaring implementation complete.

## Workflow

### 1. Establish the design contract

Write down or infer from verified sources:

- audience and customer type;
- page purpose and primary conversion;
- primary and secondary CTA destinations;
- required content and trust evidence;
- approved fonts, colors, logo, imagery, and tone;
- component and section order;
- mobile behavior;
- data source and merchant-editable fields;
- explicit non-goals.

If a required fact or destination is missing, continue with safe in-scope work and log the gap. Do not invent it.

### 2. Audit before editing

Inspect:

- existing tokens and typography;
- container widths, gutters, spacing rhythm, and breakpoints;
- reusable sections, blocks, snippets, templates, locales, metafields, and metaobjects;
- header, navigation, search, cart, footer, and global CSS interactions;
- affected empty, loading, error, sold-out, unavailable, and long-content states;
- mobile and short-laptop layouts;
- console, network, and accessibility signals when a preview is available.

Prefer fixing the shared token or component that causes a repeated defect. Avoid page-specific CSS patches unless the behavior is genuinely unique.

### 3. Design the system before the page

Define or reuse:

- semantic colors and approved contrast pairs;
- responsive typography roles;
- spacing and container scales;
- shared button, link, card, form, badge, icon, and surface variants;
- media ratios and crop behavior;
- section spacing modes;
- focus, hover, active, loading, disabled, error, empty, and success states.

Use the smallest number of variants that covers the real content. Do not expose arbitrary visual controls that allow merchants to dismantle hierarchy or accessibility.

### 4. Implement reusable, merchant-safe components

- Compose pages from reusable sections and blocks.
- Keep content in Shopify resources or settings rather than Liquid markup.
- Render nothing when required content or destinations are blank; do not emit empty buttons or modals.
- Make repeated cards structurally consistent and resilient to realistic text lengths.
- Use semantic HTML and native interaction patterns before adding ARIA or JavaScript.
- Localize every interface string.
- Preserve progressive enhancement: core shopping and navigation actions must remain understandable if enhancement scripts fail.

### 5. Verify mobile first

Start at 360–390px, then expand to tablet, laptop, and wide desktop. Verify viewport height as well as width. Check hierarchy, touch reach, crop, wrapping, overflow, drawers, sticky UI, keyboard focus, and content order.

Do not solve mobile by shrinking everything. Reflow, prioritize, collapse, scroll intentionally, or remove nonessential duplication.

### 6. Verify commerce behavior

When affected, test:

- navigation and mega-menu routes;
- predictive search and no-result behavior;
- collection filters, chips, sort, pagination, and empty results;
- variant selection and unavailable combinations;
- quick add, product add-to-cart, cart count, cart drawer, quantity changes, removal, and checkout handoff;
- price, tax, compare-at, discount, stock, lead-time, and shipping messaging;
- account, contact, newsletter, and application forms;
- localization, currency, market, and translated strings.

A successful network response is not sufficient if the expected interface state did not occur.

### 7. Validate and hand off

Run the relevant syntax/schema/theme checks and the full applicable QA checklist. Use a real rendered preview whenever available. If rendered verification is blocked, state that limitation and do not call the page finished.

Report:

- outcome and affected routes/components;
- reusable system changes;
- devices and flows tested;
- validation results;
- blockers, deliberate omissions, provisional links, missing schemas/content, and exact next actions.

## Non-negotiable defaults

- No fake facts, fake urgency, fake scarcity, placeholder reviews, or generic trust claims.
- No full-viewport ecommerce hero by default.
- No arbitrary spacing, font, color, border, button, or card style per section.
- No hidden focus state, hover-only disclosure, keyboard trap, or inaccessible overlay.
- No distorted images, blurry upscales, unbounded media heights, or below-fold images loaded eagerly.
- No hardcoded merchant content in reusable Shopify sections when a setting or resource is appropriate.
- No live publication, destructive catalog operation, or unreviewed bulk API write without explicit authorization.
- No completion claim without proportionate verification and a written record of known gaps.

## Related capabilities

Use this skill as the design and QA layer. Pair it with:

- `semantic-html-seo` whenever creating or changing custom sections, page content, headings, internal links, metadata, breadcrumbs, or structured data;
- `shopify-liquid` for Liquid objects, schema, and theme-code validation;
- `shopify-admin` for Admin GraphQL design;
- `shopify-custom-data` before metafield or metaobject work;
- `wcag-web-audit` for detailed accessibility and contrast evidence;
- a real browser or Playwright for rendered responsive and interaction verification.
