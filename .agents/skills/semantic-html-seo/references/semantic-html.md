# Semantic HTML reference

Use semantic elements to express the content model and interaction model. Styling should follow the markup, not determine it.

## Page and landmark structure

| Content role | Prefer | Avoid |
| --- | --- | --- |
| Site or page banner | `header` | Repeating `header` around every visual row without a heading relationship |
| Primary navigation | `nav` with an accessible name | `div role="menu"` for ordinary site links |
| Unique primary content | one `main` | multiple visible `main` landmarks |
| Thematic region | `section` with a heading | `section` used only as a CSS wrapper |
| Self-contained entry | `article` | `article` for any generic card |
| Complementary content | `aside` | `aside` for an ordinary grid column |
| Site or section footer | `footer` | a generic `div` when the content is clearly footer information |

Use a plain `div` when an element has no semantic role beyond layout or styling.

## Shopify section wrappers

Shopify wraps each section. The section schema can set its wrapper `tag` to `article`, `aside`, `div`, `footer`, `header`, or `section`.

- Inspect the final rendered wrapper before adding another semantic container inside it.
- Use a semantic schema wrapper only when the whole section consistently has that meaning wherever merchants can place it.
- Prefer `div` when a merchant-arrangeable section may not always form a headed thematic region.
- If the schema wrapper is already `section`, do not nest another `section` solely for CSS.
- Keep section and block IDs unique by deriving accessible-name and control relationships from the Shopify section or block ID.
- Remember that merchants can reorder sections. Do not assume a fixed heading context without inspecting the template contract.

## Headings

- Use the page H1 for the page's main subject.
- Use headings to introduce sections of content, not to enlarge text.
- Keep levels sequential. An H3 normally belongs beneath an H2.
- Do not wrap logos, prices, badges, eyebrow labels, or CTA text in heading elements unless they actually introduce content.
- Do not create empty headings when a merchant setting is blank.
- If a reusable section can appear under different contexts, define a safe heading contract. Prefer a project-controlled H2/H3 choice over unrestricted H1-H6 styling controls.
- Style heading roles with classes or design tokens instead of changing semantic levels.

Multiple H1 elements are valid in modern HTML, but this project maintains one clear page-level H1 for predictable Shopify templates, accessibility review, and search-result title consistency.

## Sections, articles, and cards

A `section` should normally have an accessible heading. If the visible design omits a heading, ask whether the region truly needs section semantics.

Use `article` when content could be distributed or understood independently, such as a blog article, news item, customer story, review, or independently meaningful product card. A visual card is not automatically an article.

For a card collection:

- use `ul` and `li` when the items form a list;
- give each item a useful heading only when it introduces its own content;
- use one primary link destination rather than nested links;
- avoid making a `div` clickable with JavaScript when an anchor can cover the intended link area;
- keep separate controls, such as add-to-cart buttons, outside a covering anchor.

## Links and buttons

Use a link when activating the element changes the URL or navigates to a resource. Use a button when it changes state, submits data, opens a dialog, expands content, or performs an action.

- Every anchor must have a valid `href` unless it is deliberately not interactive.
- Do not use `href="#"` as a placeholder.
- Give repeated generic links additional visible context or accessible names.
- Use `aria-current="page"` for the current navigation destination.
- Do not apply `role="menu"` or `role="menuitem"` to normal website navigation.
- Do not nest anchors, buttons, labels, or other interactive controls inside one another.
- Preserve native keyboard behavior instead of recreating it with key handlers.

## Lists and definition pairs

- Use `ul` for unordered groups and `ol` when order or sequence matters.
- Keep direct list children as `li` elements.
- Use `dl`, `dt`, and `dd` for name/value or term/definition relationships such as specifications.
- Do not use a list solely to obtain bullets if the content is not a conceptual group.

## Tables

Use a table only for data whose meaning depends on row and column relationships.

- Add a useful `caption` when the surrounding heading does not already name the table.
- Mark header cells with `th` and the correct `scope`.
- Keep reading order meaningful on small screens.
- Do not convert a comparison table into unrelated visual cards without preserving the relationships.
- Do not use tables for layout.

## Images, figures, and icons

- Give informative images concise alt text describing their purpose in context.
- Use `alt=""` for decorative images so they are ignored by assistive technology.
- Do not repeat a nearby caption or heading verbatim in alt text.
- Avoid phrases such as “image of” unless the medium itself matters.
- Use `figure` and `figcaption` when the media and caption form a self-contained unit.
- Hide purely decorative SVG icons from assistive technology.
- Give standalone icon buttons a real accessible name derived from the action.

## Forms

- Give every input a persistent programmatic label.
- Use `fieldset` and `legend` for related radio buttons or checkboxes.
- Associate help and error text with the control.
- Use the correct input type and `autocomplete` token.
- Do not rely on placeholder text as the label.
- Keep required-state and error messages understandable without color alone.
- Use a button with the correct type for submission or local actions.

## Disclosure, dialog, and dynamic regions

- Prefer `details` and `summary` for simple disclosures when the design allows.
- For custom disclosure buttons, synchronize `aria-expanded` and `aria-controls` with visible state.
- Give dialogs an accessible name, initial focus, Escape behavior, focus containment, and focus return.
- Use live regions only for important dynamic updates and avoid unnecessarily interruptive announcements.
- Keep important indexable copy available in rendered HTML. Do not require a click solely for crawlers or screen readers to discover the section's main answer.

## Validation questions

- Does every element communicate the same meaning without CSS?
- Does the heading outline describe the page accurately?
- Can links and buttons be distinguished by behavior?
- Are all IDs unique in the final rendered page?
- Does keyboard order follow DOM and visual order?
- Does disabling JavaScript leave the core content and destinations understandable?

## Primary references

- [WHATWG HTML Living Standard](https://html.spec.whatwg.org/)
- [Shopify accessibility best practices](https://shopify.dev/docs/storefronts/themes/best-practices/accessibility)
- [Shopify section schema](https://shopify.dev/docs/storefronts/themes/architecture/sections/section-schema)
