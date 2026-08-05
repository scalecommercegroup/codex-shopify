# Shopify storefront reference

## Contents

1. Architecture
2. Merchant editability
3. Global storefront systems
4. Collection and product systems
5. Search, cart, and forms
6. Content, SEO, and structured data
7. Localization and markets
8. Performance
9. API and deployment safety

## 1. Architecture

- Use Online Store 2.0 JSON templates for page composition where the theme supports them.
- Use sections for merchant-arrangeable page modules.
- Use blocks for repeatable or nestable items.
- Use snippets for reusable markup with explicit parameters.
- Use shared assets for global tokens and component behavior; avoid one giant unstructured stylesheet when the theme has a component architecture.
- Use locale files for interface strings.
- Use products, collections, pages, blogs, navigation, metafields, and metaobjects as the content model.
- Preserve the theme editor's block attributes and live-preview behavior.
- Do not duplicate a complete section for each route when schema and blocks can express the variation safely.

## 2. Merchant editability

- Expose content, links, resources, media, alignment modes, approved color schemes, and approved spacing modes.
- Prefer Shopify resource pickers to handles or free-text URLs.
- Limit settings to choices that preserve accessibility, hierarchy, and responsive behavior.
- Cap dangerous inputs such as hero height, columns, autoplay, animation intensity, and text width.
- Provide useful defaults, but never production-looking fake content.
- Render optional content only when both its meaningful label/content and required destination exist.
- Keep relationships structured. Use metafields/metaobjects when content repeats across products, collections, or pages.

## 3. Global storefront systems

### Header and navigation

- Build navigation from Shopify menus rather than hardcoded link lists.
- Keep utility bar, logo/search/actions row, and primary navigation logically separated when needed.
- Ensure search, account, and cart controls have accessible names and consistent hit areas.
- Treat the cart count as a live interface state; verify that it updates after all add paths.
- Keep mega-menu grouping stable across top-level categories so customers learn the pattern.
- Add an editorial or buying-guide slot only when real content exists.
- Build a purpose-designed mobile drawer with clear back navigation or accordions.

### Footer

- Use navigation resources for link columns and settings/resources for verified company facts.
- Keep policies canonical and avoid duplicate pages with conflicting text.
- Include physical store information only when address, hours, and contact details are verified.
- Use real payment icons from Shopify/payment settings when possible.

### Design tokens

- Extend theme settings or the existing CSS variable layer rather than hardcoding section-specific colors and typography.
- Prefer merchant-selectable color schemes containing an approved surface and all compatible foreground tokens. Avoid separate unrestricted text and background pickers.
- If merchants can choose colors independently, test every permitted foreground/background pair and state or add validation/fallback behavior that prevents failing combinations.
- Confirm light sections render dark text and dark sections render light text across headings, body copy, links, buttons, badges, forms, icons, borders, and focus indicators. Do not depend on inherited colors when sections can be reordered.
- Store spacing modes as named options such as compact, standard, and spacious, mapped to tokens.

## 4. Collection and product systems

### Collection pages

- Preserve collection filtering and sorting behavior supported by Shopify Search & Discovery.
- Show active filters, removal controls, clear-all, result count, and empty results.
- Use real product counts and disable or hide zero-result options according to the product strategy.
- Keep the short collection introduction above products and long editorial/SEO content below products.
- Avoid duplicate breadcrumbs and synthetic category levels that do not match the navigation model.
- Keep buying-guide and FAQ content contextual to the collection.

### Product cards

- Use one card system for homepage collections, collection grids, search results, recommendations, and related products unless a clear context requires a smaller variant.
- Handle long titles, vendor display, price ranges, compare-at prices, unit prices, discounts, sold-out, unavailable, and missing-image states.
- Do not show a working-looking quick-add button if required variants cannot be selected. Open a functional picker or link to the product.
- After quick add, update cart state and open the configured cart surface consistently.

### Product pages

- Use variant-aware pricing, availability, media, URL, quantity rules, selling plans, and add-to-cart state.
- Do not infer delivery promises from generic availability. Use verified inventory and lead-time data.
- Label tax presentation clearly when B2C and B2B customers share the storefront.
- Put structured specifications in metafields rather than embedding inconsistent label/value text in descriptions.
- Keep service cross-links and buying guides relevant to product type.
- Ensure product JSON-LD matches visible price, availability, variant, brand, image, and review data.

## 5. Search, cart, and forms

### Predictive search

- Use Shopify predictive search or the store's approved search provider.
- Show a useful hierarchy of products, collections, pages/articles, and queries according to business needs.
- Design loading, no results, keyboard selection, escape, focus return, and full-results navigation.
- Keep desktop input width balanced with the header; do not use all remaining space by default.

### Cart

- Respect the merchant's configured cart mode: drawer, page, or notification.
- Verify every add path: product form, quick add, recommendations, bundles, and sticky add-to-cart.
- Verify count, line items, variant details, quantity, removal, discounts, subtotal, shipping note, error recovery, and checkout handoff.
- Localize cart strings and dynamic errors.
- Keep checkout CTA visible without trapping or covering cart content.

### Forms

- Use Shopify forms where their behavior meets requirements.
- Do not claim native contact forms provide file storage, tailored confirmation email, or advanced routing unless they actually do.
- Use an app/backend when uploads, retention, conditional routing, custom confirmation, or spam controls exceed native behavior.
- Record provisional form limitations and destination emails.

## 6. Content, SEO, and structured data

- Use exactly one useful H1 per page.
- Keep heading order logical and do not choose headings for visual size.
- Set unique, truthful titles and descriptions; do not repeat boilerplate shipping claims across every record without an SEO reason.
- Keep canonical URLs aligned to the intended collection/product/page.
- Generate breadcrumbs from real hierarchy and avoid duplicated synthetic levels.
- Use JSON-LD only when its facts are visible, current, and supported by the page.
- Validate Product, BreadcrumbList, Organization, LocalBusiness, Article, and FAQPage where applicable.
- Do not add FAQPage markup to hidden, duplicated, or non-question content.
- Keep policy content in Shopify policy resources or one canonical page per policy.
- Never use review schema for testimonials that do not meet platform/search requirements.

## 7. Localization and markets

- Put every UI string in locale files, including empty states, errors, filters, sorting, quick add, cart, account, forms, and accessibility labels.
- Test missing translation keys and fallback locale behavior.
- Verify money filters, currency, tax wording, number formatting, dates, and pluralization.
- Do not mix translated theme text with hardcoded English JavaScript messages.
- Test long translated labels before finalizing fixed control widths.

## 8. Performance

- Treat the likely LCP image as high priority and do not lazy-load it.
- Lazy-load below-fold media and supply responsive width candidates.
- Provide width/height or an aspect ratio to prevent layout shift.
- Prefer AVIF/WebP where quality and compatibility are appropriate; use SVG for logos/icons.
- Avoid upscaling small product images into full-width editorial media.
- Load only required font files and weights; preload only critical fonts.
- Avoid global JavaScript for a component used on one template.
- Defer noncritical scripts and guard component initialization by DOM presence.
- Use event delegation or custom elements when they reduce repeated listeners.
- Measure rendered behavior; file size alone does not prove good performance.

## 9. API and deployment safety

- Confirm store, theme ID/name, theme role, and environment before writing.
- Default to a duplicate or unpublished theme.
- Pull or export the current target before broad changes when practical.
- Preserve unrelated merchant changes in dirty themes/worktrees.
- For bulk Admin API changes:
  1. export the affected IDs and fields;
  2. generate an exact-match dry run;
  3. save a rollback backup;
  4. apply narrow field-level mutations;
  5. inspect top-level and user errors;
  6. re-export and compare;
  7. record source-of-truth drift that could reintroduce the issue.
- Never place credentials in repository files, shell history, screenshots, logs, or final responses.
- Run Theme Check and any project-specific tests before upload.
- Verify the uploaded theme or resource, not only the local file.
- Do not publish, delete products/pages/themes, change checkout behavior, or modify live navigation without explicit authorization.
