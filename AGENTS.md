# Storefront engineering instructions

## Scope

Apply these instructions to every Shopify theme, ecommerce storefront, landing page, and customer-facing web interface in this repository.

Use `$shopify-web-design` for storefront design, implementation, redesign, review, responsive work, navigation, component-library, collection, product, search, cart, footer, accessibility, performance, or conversion tasks. If the skill is not automatically available, read `.agents/skills/shopify-web-design/SKILL.md` before acting.

Use `$semantic-html-seo` whenever creating, editing, reviewing, or auditing custom sections, blocks, page content, headings, navigation, breadcrumbs, forms, internal links, metadata, structured data, or other indexable markup. If the skill is not automatically available, read `.agents/skills/semantic-html-seo/SKILL.md` before acting.

## Authority and intent

- Follow the latest explicit user request first, then approved briefs or wireframes, then the established project design system, then framework/theme defaults.
- Treat wireframes as authoritative for information architecture, order, priority, and functionality. Treat them as structural guidance unless their visual styling is explicitly approved.
- Preserve verified business facts. Never invent prices, opening hours, reviews, guarantees, delivery times, stock status, partners, certifications, or legal claims.
- Prefer factual disagreement over implementing a choice that creates a worse customer or maintenance outcome. Explain the evidence and tradeoff briefly.

## Required workflow

1. Inspect the existing implementation, target route/template, rendered document outline, active metadata and structured data, design tokens, reusable components, content source, and mobile behavior before editing.
2. Confirm the exact target theme, branch, environment, or deployment. Work on a duplicate, development, or unpublished theme unless the user explicitly authorizes production.
3. Identify the page's primary audience, primary task, primary CTA, supporting CTA, trust needs, and next logical destination.
4. Reuse or extend the component library and design tokens. Do not create page-specific copies of shared patterns without a documented reason.
5. Build mobile-first, then verify tablet, laptop, and wide desktop. Do not approve desktop first and assume mobile works.
6. Validate syntax, schemas, interactions, accessibility, content, responsive layout, and critical commerce flows.
7. Report what changed, what was verified, what was skipped, why it was skipped, and any remaining blocker or provisional destination.

## Design-system rules

- Use semantic tokens for color, type, spacing, containers, radii, borders, shadows, motion, and z-index. Do not scatter raw values through components.
- Preserve an established token scale. If none exists, start with spacing values `4, 8, 12, 16, 24, 32, 48, 64, 96, 128px`; do not invent arbitrary intermediate gaps.
- Default page gutters: 16px mobile, 24px tablet, and 32–48px desktop. Default content width: 1200–1440px unless the brand or theme already defines one.
- Default section rhythm: 48–64px mobile and 64–96px desktop. Use 32–48px for compact sections; use 128px only for an intentional editorial break.
- Use no more than two font families. Use the project fonts everywhere; do not introduce a font for one page or component.
- Define one responsive type scale for H1–H4, body, small text, labels, prices, and buttons. Body and form-control text should normally be at least 16px.
- Keep body copy around 60–75 characters per line, use comfortable line-height, and prevent headings from producing awkward single-word final lines when practical.
- Use only the global primary, secondary, and text-link button variants. A section may not invent its own button treatment.
- Use action colors for actions and states, not decoration. Text contrast must meet WCAG 2.2 AA.
- Align sections to the same container and grid. Misaligned edges, accidental double dividers, unexplained empty bands, and one-off negative margins are defects.

## Components and sections

- Build shared patterns once: hero, card/puff grid, product card, process, CTA band, FAQ, reviews, anchor navigation, forms, newsletter, header, mega-menu, cart drawer, and footer.
- Every component must define its purpose, content limits, states, responsive behavior, and editor controls.
- Use fixed media ratios within a card row. Keep cards equal height and bottom-align repeated CTAs when this improves scanning.
- Do not clamp essential information. Editorial card headings may use two lines and summaries three lines when the full content remains available at the destination.
- A whole card may be clickable, but do not nest interactive elements. Ensure a visible hover and focus state.
- Keep one clear primary action per section. Add a secondary action only when it serves a distinct user path.
- Do not use placeholders, fake badges, generic trust icons, dead links, empty modals, duplicated decoration, or demo content in production-facing work.
- Cap ordinary ecommerce heroes near 70vh desktop and 60vh mobile. The next section should normally remain discoverable without a large scroll.

## Responsive and interaction rules

- Design from 360–390px first. Verify at 360, 375, 390, 768, 1024, 1280/1366, and 1440px when tooling permits.
- Verify short laptop viewports such as 1366×768; viewport height matters for headers, heroes, dialogs, mega-menus, filters, and cart drawers.
- Never allow horizontal page overflow. Intentional horizontal carousels must communicate overflow, snap predictably, and remain keyboard usable.
- Touch targets should be at least 44×44px. Keep 8px or more between adjacent targets when practical.
- Use native controls and semantic HTML. Support keyboard operation, visible `:focus-visible`, escape/close behavior, focus return, and reduced motion.
- Do not shrink desktop navigation until it merely fits. Simplify content, cap search width, use deliberate 20–32px menu gaps, or move secondary links to their intended row.
- Desktop mega-menus must fit within the viewport, use predictable columns, avoid flyouts over content, and provide internal scrolling when height is constrained. Mobile navigation should use a clear level-by-level drawer or accordion.
- Dialogs, variant pickers, predictive search, filter sheets, and cart drawers must have useful loading, empty, success, error, and unavailable states.

## Shopify rules

- Prefer Online Store 2.0 JSON templates composed from reusable sections and blocks.
- Keep merchant content and content relationships in theme settings, Shopify navigation, metafields, metaobjects, collections, or products—not hardcoded in Liquid.
- Keep section schemas focused. Expose meaningful choices, not arbitrary pixel controls that can break the system.
- Use snippets for reusable markup, sections for merchant-arrangeable modules, blocks for repeatable/nestable items, assets for shared CSS/JS, locales for all interface strings, and metafields/metaobjects for structured content.
- Use Shopify image filters with responsive widths, intrinsic dimensions, meaningful alt text, and appropriate loading priority. Use SVG for logos and simple brand marks.
- Keep customer-facing strings localized. Do not allow English theme defaults to leak into a Swedish or otherwise localized storefront.
- Preserve one H1 per page, logical headings, canonical URLs, useful metadata, breadcrumb integrity, and valid structured data based only on visible verified facts.
- Keep document-level metadata and page-level schema in the page layout or template. Ordinary reusable sections must not emit their own canonical, robots, hreflang, broad page schema, or default H1.
- Treat search, variant selection, add-to-cart, cart drawer, discounts, price/tax labels, stock messaging, filters, pagination, account links, forms, and checkout handoff as critical flows.
- For Admin API bulk writes: export a backup, generate a deterministic dry run, change only matching records and fields, inspect user errors, then re-export and verify the result.
- Never publish a theme, remove production data, or broaden a bulk mutation without explicit authorization.

## Quality gates

A change is not complete until the relevant checks pass:

- Shopify Theme Check or the framework's equivalent validation.
- Rendered desktop and mobile review when a preview is available.
- Keyboard navigation and visible focus review.
- No clipping, overlap, accidental large gaps, double rules, horizontal overflow, or obscured text.
- No broken or provisional CTA unless it is explicitly logged.
- Search, variant, add-to-cart, cart drawer, filtering, forms, and navigation tested when affected.
- Images checked for crop, sharpness, alt text, sizing, and loading priority.
- Rendered HTML checked for one clear page H1, logical headings and landmarks, correct link-versus-button semantics, unique IDs, and no empty semantic regions.
- Metadata and structured data checked for correct ownership, verified visible facts, and no duplicate entities emitted by the theme, apps, sections, or tag manager.
- Console checked for new errors and obvious performance regressions.
- Blockers, deliberate omissions, missing content, schema gaps, and verification limits recorded in `IMPLEMENTATION_LOG.md` when that file exists.

## Handoff

Lead with the outcome. Include changed routes/components, verification evidence, and unresolved items. Do not say a page is finished when rendered QA was unavailable; state the exact verification limit.
