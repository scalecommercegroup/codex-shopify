---
name: semantic-html-seo
description: Create, edit, review, and audit semantic HTML and people-first SEO structures for custom sections and page content. Use whenever building or changing custom sections, blocks, landing-page content, service content, product or collection content, navigation, breadcrumbs, forms, FAQs, headings, internal links, metadata, structured data, or other indexable markup in Shopify/Liquid or any frontend stack.
---

# Semantic HTML & SEO

Create content structures that remain understandable to people, assistive technology, browsers, search engines, and future maintainers. Treat semantics and SEO as information architecture and factual clarity, not a layer of keywords added after implementation.

## Start with ownership and context

1. Read every applicable `AGENTS.md`.
2. Inspect the rendered page and source before editing. Identify existing landmarks, heading levels, metadata, canonical URL, robots directives, internal links, and JSON-LD.
3. Identify the page purpose, primary audience, search intent, main entity, primary conversion, and verified source of each factual claim.
4. Determine what the page template already owns and what the custom section should own.
5. Preserve the established language, localization model, content schema, and URL strategy.

Do not invent keywords, locations, services, reviews, ratings, prices, availability, qualifications, opening hours, guarantees, or other business facts.

## Load the relevant references

- Read [references/semantic-html.md](references/semantic-html.md) whenever creating or changing markup, headings, landmarks, links, controls, lists, tables, media, or forms.
- Read [references/seo-content.md](references/seo-content.md) whenever writing or restructuring indexable content, titles, descriptions, headings, internal links, product, collection, service, location, or FAQ content.
- Read [references/structured-data.md](references/structured-data.md) before adding, editing, or recommending schema or JSON-LD.
- Read [references/qa-checklist.md](references/qa-checklist.md) before declaring custom section or content work complete.

## Workflow

### 1. Define the responsibility boundary

Keep document-level concerns with the page layout or template:

- document language and `<head>`;
- `<title>` and meta description;
- canonical URL, robots directives, hreflang, and social metadata;
- page-level H1 and primary entity;
- global `Organization` or `WebSite` schema;
- page-level `Product`, `Article`, `LocalBusiness`, `BreadcrumbList`, or similar schema.

Keep section-level concerns with the reusable section:

- its visible heading and descriptive content;
- semantic grouping of its cards, lists, media, controls, and links;
- unique IDs and accessible names;
- content-source settings and empty states;
- section-specific markup only when the template contract explicitly assigns it.

Do not inject document metadata or broad page schema from a reusable section. A section may appear several times or on several templates, creating duplication or false page context.

### 2. Establish the document outline

- Maintain one clear page-level H1 as the project default.
- Do not add another H1 from an ordinary reusable section.
- Use H2 for major page sections and H3 for grouped items beneath them unless the inspected page hierarchy requires another level.
- Keep heading levels sequential and structural. Never choose a heading element for its font size.
- Ensure each section heading describes its content rather than repeating a generic slogan.
- Remove empty headings and decorative text incorrectly marked as a heading.

This hierarchy supports comprehension; it is not a keyword-placement trick.

### 3. Select elements by meaning

- Use `main` once for the page's primary content.
- Use `nav` for major navigation groups and give repeated navigation landmarks distinct accessible names.
- Use `section` only for a thematic region that has an identifiable heading.
- Use `article` for self-contained content that can stand independently.
- Use `aside` for complementary content, not for ordinary layout columns.
- Use lists for real collections, tables for tabular relationships, and definition lists for term/value pairs.
- Use anchors with valid destinations for navigation and buttons for actions.
- Use native elements and behavior before ARIA. Do not add redundant or conflicting roles.

Read the semantic HTML reference for element-level decisions and Shopify wrapper behavior.

### 4. Write people-first, search-ready content

- Answer the page's primary intent early and clearly.
- Use the language customers use when it is accurate, without forcing exact-match phrases.
- Keep headings specific, concise, and distinct from neighboring headings.
- Support claims with verified detail, useful comparisons, process information, limitations, or expertise.
- Add descriptive internal links only where they provide a logical next step.
- Keep link text meaningful outside its surrounding sentence; avoid repeated “read more” links without context.
- Keep important indexable content in rendered HTML and available without requiring a user interaction.
- Avoid hidden SEO copy, keyword lists, doorway pages, mass-produced location variants, and duplicated boilerplate.

Read the SEO content reference for page-type guidance and document metadata responsibilities.

### 5. Handle media and interaction semantically

- Write alt text that explains an informative image's purpose in context; use empty alt text for decorative images.
- Keep meaningful text as text rather than baking it into images.
- Associate figures and captions when the caption adds meaning.
- Use explicit labels for form controls and helpful error relationships.
- Preserve logical DOM order, keyboard operation, focus visibility, and usable link destinations.
- Do not nest interactive elements or turn a non-interactive container into a button when a native element works.

### 6. Add structured data only when justified

Before changing JSON-LD:

1. Find all schema already emitted by the theme, apps, platform, and tag manager.
2. Identify the page's main entity and the component responsible for it.
3. Confirm every property is supported by visible, verified page content.
4. Follow the current documentation for the exact rich-result type.
5. Avoid duplicate entities by reusing stable `@id` values when architecture requires relationships.
6. Validate the rendered output, not only the template source.

Do not add schema merely because a section contains similarly named content. In particular, do not add review, rating, product, local-business, or FAQ schema without correct ownership, eligibility, and visible evidence.

### 7. Validate the result

Run the platform validator and inspect the rendered DOM. Confirm:

- valid HTML and Liquid/template syntax;
- logical landmarks and heading order;
- correct links, buttons, labels, lists, tables, and image alternatives;
- unique IDs and no empty semantic regions;
- no duplicate document metadata or structured-data entities;
- accurate, useful, non-duplicative visible content;
- responsive and keyboard behavior;
- structured-data validation when schema changed.

Use the complete QA checklist before handoff. Record any skipped rendered, crawl, analytics, Search Console, or schema verification and explain why.

## Non-negotiable defaults

- No section-level H1 by default.
- No metadata, canonical, robots, hreflang, or global schema emitted by ordinary reusable sections.
- No heading tags selected for visual styling.
- No links without destinations and no buttons used as links.
- No nested interactive controls.
- No hidden keyword blocks, keyword stuffing, fake expertise, fake reviews, or unsupported local claims.
- No structured data for content that users cannot see or facts that cannot be verified.
- No duplicate schema from theme, app, custom section, or tag manager.
- No promise that valid schema will produce a rich result or improve rankings.
- No completion claim without checking the rendered document structure.

## Related capabilities

Pair this skill with:

- `shopify-web-design` for ecommerce information architecture, design-system implementation, responsive behavior, and storefront QA;
- `shopify-liquid` for Shopify Liquid, section schema, and theme-code validation;
- `shopify-custom-data` before metafield or metaobject design;
- `wcag-web-audit` for detailed accessibility evidence;
- a browser or Playwright for rendered DOM, viewport, interaction, and structured-data inspection.
