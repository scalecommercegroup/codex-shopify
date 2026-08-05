# Semantic HTML and SEO QA checklist

Use the relevant checks before handoff. Mark any unavailable check as skipped and record why.

## Context and ownership

- [ ] Confirm the route, template, market, language, page purpose, and main entity.
- [ ] Identify the component that owns the H1, document metadata, canonical, robots, hreflang, breadcrumbs, and structured data.
- [ ] Confirm factual and content sources.
- [ ] Inspect existing theme/app schema before adding markup.

## Rendered document structure

- [ ] Exactly one visible primary `main` landmark.
- [ ] One clear page-level H1 under the project convention.
- [ ] Heading levels are sequential and describe the content outline.
- [ ] No heading elements used solely for styling.
- [ ] `section`, `article`, `aside`, `nav`, `header`, and `footer` match their content roles.
- [ ] Repeated navigation landmarks have distinct accessible names.
- [ ] No empty headings, landmarks, lists, links, buttons, labels, or sections.
- [ ] IDs are unique in the fully rendered page.
- [ ] Generated HTML is valid.

## Content

- [ ] The primary intent is answered early in visible content.
- [ ] Copy is specific, useful, accurate, and written for the intended audience.
- [ ] No keyword stuffing, hidden SEO copy, fake claims, or duplicated filler.
- [ ] Important content does not exist only inside images or interaction-hidden panels.
- [ ] Product, price, stock, service, location, policy, and contact claims match their authoritative source.
- [ ] Localized content and links use the correct language and market.

## Links and controls

- [ ] Links navigate and have real destinations.
- [ ] Buttons perform actions and use the correct type.
- [ ] Link text communicates the destination without relying on “click here” or repeated “read more.”
- [ ] No nested interactive elements.
- [ ] Current-page navigation uses `aria-current` where appropriate.
- [ ] Disclosures, dialogs, menus, forms, and dynamic states work with keyboard and visible focus.

## Lists, tables, forms, and media

- [ ] Conceptual collections use lists.
- [ ] Tabular data uses table headers, scope, and a meaningful caption when needed.
- [ ] Inputs have persistent labels, correct types, autocomplete, and associated help/error text.
- [ ] Informative images have useful contextual alt text.
- [ ] Decorative images use empty alt text.
- [ ] Icon-only controls have accurate accessible names.

## Page-level SEO

- [ ] The page title is unique, descriptive, concise, and aligned with the page language and main heading.
- [ ] The meta description accurately summarizes the page without keyword lists or unsupported claims.
- [ ] Canonical, robots, hreflang, and social metadata come from the responsible template/platform layer.
- [ ] Internal links support a logical customer journey and site hierarchy.
- [ ] Breadcrumb labels and destinations match the visible hierarchy.
- [ ] No reusable section emits duplicate document metadata.
- [ ] Indexable content is present in rendered HTML.

## Structured data

- [ ] The marked-up entity matches the page's visible main content.
- [ ] Theme, app, tag-manager, and custom JSON-LD do not conflict or duplicate entities.
- [ ] Every property is verified, visible when required, current, and correctly formatted.
- [ ] Dynamic Shopify product/variant states output correct price, currency, availability, URL, and identifiers.
- [ ] Reviews and ratings are genuine, visible, attributable, and policy-eligible.
- [ ] Local-business details match the visible page and real location.
- [ ] FAQ or Q&A types match the actual publishing model and current eligibility guidance.
- [ ] Rendered JSON-LD parses successfully.
- [ ] Relevant Rich Results Test and/or Schema.org validation passes without unexplained errors.

## Responsive and dynamic states

- [ ] DOM order remains logical at mobile and desktop layouts.
- [ ] Responsive visual rearrangement does not change semantic reading order incorrectly.
- [ ] Section instances produce unique IDs.
- [ ] Empty optional settings do not render empty semantic elements.
- [ ] Long headings, translated copy, no-image states, empty lists, product variants, and unavailable data remain valid.
- [ ] JavaScript enhancement does not remove core content or usable destinations.

## Handoff

- [ ] Report affected routes, templates, sections, content, metadata, and schema.
- [ ] List validators, rendered URLs, page states, and viewports checked.
- [ ] Record skipped crawl, Search Console, analytics, production, or schema checks and why.
- [ ] Log unresolved duplicate schema, missing facts, provisional links, unverified metadata, or indexing decisions.
- [ ] Do not claim ranking improvements or rich-result eligibility without post-deployment evidence.
