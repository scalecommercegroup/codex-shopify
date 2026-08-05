# Ecommerce design-system reference

## Contents

1. Principles
2. Tokens
3. Layout and spacing
4. Typography
5. Color and surfaces
6. Components
7. Sections and page hierarchy
8. Header, navigation, and footer
9. Responsive design
10. Visual anti-patterns

## 1. Principles

- Make the interface feel like one system, not a collection of page-specific designs.
- Use hierarchy to answer: where am I, what can I do, why should I trust this, and what happens next?
- Keep the strongest visual emphasis for the primary customer action.
- Use whitespace to group related items and separate ideas. Do not use it as empty decoration.
- Prefer clear alignment, rhythm, and repetition over novelty.
- Let real content determine component constraints. Test long names, discounts, variants, translated strings, and missing images.
- Make services, education, B2B, stores, or other differentiators visible when they are meaningful parts of the business; do not let the product catalog erase them.

## 2. Tokens

Use existing project tokens first. If no coherent system exists, create semantic tokens rather than scattering raw values.

### Spacing

Recommended base scale:

| Token | Value | Typical use |
| --- | ---: | --- |
| `space-1` | 4px | Icon adjustment, tight inline detail |
| `space-2` | 8px | Icon/text gap, compact control gap |
| `space-3` | 12px | Dense metadata, small card padding |
| `space-4` | 16px | Mobile gutter, field gap |
| `space-5` | 24px | Card padding, component gap |
| `space-6` | 32px | Grid gap, subsection separation |
| `space-7` | 48px | Compact section separation |
| `space-8` | 64px | Standard section spacing |
| `space-9` | 96px | Spacious desktop section |
| `space-10` | 128px | Rare editorial break |

Use tokens through CSS custom properties or theme settings. Do not create 18px, 27px, 53px, or other one-off spacing because a single screenshot appears to need it.

### Other token groups

- color roles: page, surface, elevated surface, text, muted text, border, action, action hover, success, warning, error;
- typography roles: display, H1–H4, body, small, label, price, button;
- container roles: full, page, reading, narrow form;
- radii: control, card, pill, dialog;
- border and shadow levels;
- motion duration/easing;
- z-index layers: base, sticky, header, menu, drawer, modal, toast.

## 3. Layout and spacing

### Containers

- Use one page container across header rows, breadcrumbs, content sections, and footer columns.
- Typical ecommerce page width is 1200–1440px. Choose one project token based on catalog density and brand tone.
- Use 16px mobile gutters, 24px tablet gutters, and 32–48px desktop gutters unless an existing system is stronger.
- Allow full-bleed background sections, but align their inner content to the common container.
- Use narrower reading widths for long copy and FAQ answers.

### Section rhythm

- Standard: 48–64px mobile, 64–96px desktop.
- Compact: 32–48px for related sections or utility bands.
- Editorial: up to 128px only when it creates a deliberate transition.
- Keep section heading-to-content spacing smaller than section-to-section spacing.
- Avoid margin stacking. Let the section own its outer spacing and the component own its internal spacing.

### Grids

- Define column count, gap, and collapse behavior once per component.
- Use equal-width tracks for peer cards; use asymmetric grids only when content priority is intentionally different.
- Align repeated titles, prices, stock labels, and CTAs where it improves scanning.
- Never let a single long card stretch its row without a defined content strategy.

## 4. Typography

- Use no more than two font families: one brand/display family and one reading/interface family, or one family for everything.
- Load only the weights actually used and prefer WOFF2.
- Use a shared responsive scale; do not set headings per page.
- Use `clamp()` when appropriate, with restrained minimum and maximum values.
- Body text should normally be at least 16px. Small supporting text should remain legible and high-contrast.
- Recommended line-height: 1.45–1.7 for body; 1.05–1.25 for large headings.
- Keep prose around 60–75 characters per line.
- Avoid excessive uppercase, wide letter spacing, and centered long paragraphs.
- Keep labels, eyebrows, badges, and metadata visually subordinate to the heading.
- Test Swedish, German, and other long strings when localization is possible.

## 5. Color and surfaces

- Use semantic color roles, not names such as `red-2` inside components.
- Limit neutral surfaces. Page, surface, and border are normally sufficient; many near-identical grays make a storefront look accidental.
- Reserve the primary action color for buttons, active states, meaningful links, and commercial emphasis.
- Meet WCAG 2.2 AA for the final rendered pair: 4.5:1 for normal text; 3:1 for text at least 24px regular or about 18.66px bold; and 3:1 for meaningful UI boundaries, focus indicators, and icons.
- Treat color as approved pairs, not independent swatches. Every light surface needs explicit dark foreground tokens, and every dark surface needs explicit light foreground tokens.
- Define compatible primary text, muted text, link, link-hover, icon, border, input, button, badge, and focus-ring colors for each page, surface, brand, inverse, and overlay scheme.
- Test every permitted pairing and state. A color that passes on the page background may fail inside a card, button, announcement bar, footer, drawer, or selected filter.
- Do not rely on `color: inherit`, browser defaults, or a component's previous context when the component can move between light and dark sections.
- Validate text over the darkest or lightest real image area, not an average background.
- Compute the final composited colors when opacity, alpha colors, gradients, blend modes, or overlays are used. Raw token contrast is insufficient when the rendered pixels differ.
- Give hover, focus, selected, error, disabled, and success states explicit approved pairs.

| Rendered content | Minimum contrast |
| --- | ---: |
| Normal text, including muted copy and placeholders | 4.5:1 |
| Qualifying large text | 3:1 |
| Meaningful icons, control boundaries, selected states, and focus indicators | 3:1 |

Disabled controls are exempt from the WCAG contrast requirement, but keep them legible and clearly distinguishable when practical. Color must not be the only way to communicate state.

## 6. Components

### Buttons and links

- Use primary, secondary, and text-link variants only unless the project explicitly defines more.
- Use buttons for actions and links for navigation.
- Keep labels specific: `Lägg i varukorg`, `Visa alla frisörsaxar`, `Boka rådgivning`.
- Maintain 44×44px minimum target size and visible focus.
- Do not add a permanent underline to a text link if a parent border or pseudo-element creates a second underline.

### Cards

- Use a fixed media ratio within each row or carousel.
- Make the content layout a column so price/CTA can align consistently.
- Keep hover effects subtle and avoid layout movement.
- If the whole card is a link, avoid nested links/buttons or use a safe stretched-link pattern.
- Show real missing-image behavior; do not substitute unrelated images.

### Forms

- Keep visible labels; placeholders are examples, not labels.
- Group fields logically and show requirements before submission.
- Render errors adjacent to fields and provide a summary when forms are long.
- Preserve entered values after recoverable errors.
- Explain consent, file constraints, response expectations, and the result after submission.

### Accordions, tabs, drawers, and dialogs

- Prefer native semantics where suitable.
- Define opening, closing, escape, outside-click, focus trap, and focus-return behavior.
- Do not hide critical product or legal information behind interactions that fail without JavaScript.
- Keep dialog content within the viewport and provide internal scrolling.

### Carousels

- Use only when horizontal browsing materially helps.
- Never autoplay product grids.
- Autoplaying editorial media must pause on hover/focus and respect reduced motion.
- Provide controls, status, swipe, keyboard operation, and visible partial-card affordance when relevant.

## 7. Sections and page hierarchy

### Shared section set

Most storefronts benefit from reusable versions of:

- hero: image, split, and compact modes;
- card or puff grid;
- collection/product grid;
- USP or trust row;
- editorial split section;
- process steps;
- comparison table;
- CTA band;
- FAQ;
- reviews/testimonials;
- anchor navigation;
- form;
- newsletter;
- store/location block.

Each section should define schema fields, content limits, missing-content behavior, responsive behavior, and accessibility states.

### Hero

- Default maximum: about 70vh desktop and 60vh mobile; use smaller caps for compact/information pages.
- Let part of the next section remain discoverable when possible.
- Use one primary CTA for editorial slides. Use two only when paths are genuinely distinct.
- Prefer real editorial images or product-in-use imagery. Do not upscale small catalog cutouts into photographic heroes.
- Protect text contrast with composition, a solid text panel, or a reliable overlay.
- Check the weakest real text/background area at every responsive crop. If a reliable minimum cannot be maintained, move the copy to a solid surface instead of increasing shadow effects until it appears readable.

### Homepage

- Answer within seconds: what is sold, what differentiates the business, and why it is trustworthy.
- Use the homepage as a routing surface, not a dumping ground for campaigns.
- Introduce primary categories early, then differentiators/services, products, proof, physical location/B2B when relevant, education, and newsletter/footer.
- Avoid repeating the same CTA, trust claim, or brand row in adjacent sections.

### Collection page

- Keep H1 and short introduction concise; show products early.
- Show result count, sort, filters, active removable chips, clear-all, and empty states.
- Put long SEO copy, buying-guide links, and FAQ after the grid.
- Keep product cards consistent and avoid layout shifts when badges or prices differ.

### Product page

- Prioritize media, product identity, price/tax, availability, variants, quantity, primary add-to-cart, delivery/trust information, and service links.
- Do not show an add-to-cart action until a required variant is valid.
- Treat variant errors, sold-out states, backorders, and lead time as designed states.
- Keep specifications structured and scannable.
- Use sticky mobile purchase UI only after the main purchase block scrolls away, and prevent it from covering content or consent UI.

## 8. Header, navigation, and footer

### Header

- Separate utility information, core header content, and primary navigation when content density requires it.
- Keep logo, search, account, and cart visually balanced. Cap desktop search width instead of allowing it to squeeze everything else.
- Put secondary informational links in a secondary row or footer, not beside the primary search field by accident.
- Keep row padding deliberate and allow logos their intended clear space.

### Primary navigation and mega-menu

- Limit top-level choices to meaningful customer mental models.
- Use consistent 20–32px gaps instead of `space-between` across the full width.
- Keep mega-menu panels within the viewport and set a maximum height with internal scrolling.
- Use predictable columns: category/product type, brand, relevant facet, shortcuts, and optional editorial content.
- Show `View all` prominently when a menu also exposes subcategories.
- On mobile, prioritize customer tasks and use a level-by-level drawer or clear accordions rather than compressing the desktop menu.

### Announcement/utility bar

- Keep to one to three strong messages with short mobile-safe wording.
- Use links only when they have clear value. A phone number should be callable.
- Do not distribute sparse items across excessive width; group them within the page container.

### Footer

- Put newsletter signup in a distinct, modern block with clear consent copy.
- Group shop, services, help/policies, company, and contact/location information by user intent.
- Show only real payment, shipping, review, and social icons.
- On mobile, accordions are appropriate; keep the most useful contact/store group open when relevant.

## 9. Responsive design

- Start with 360–390px and real content, not a desktop layout squeezed smaller.
- Verify 768px and 1024px transition states; many defects appear between mobile and desktop breakpoints.
- Verify 1280/1366px laptop width and 768px height.
- Stack or reorder based on task priority, not visual symmetry.
- Use horizontal scrolling only for patterns that users understand as browseable; never for the page itself.
- Prevent fixed/sticky UI from covering controls, cart checkout buttons, cookie consent, or error messages.
- Preserve readable tap targets, control labels, media crops, and text measure at every breakpoint.

## 10. Visual anti-patterns

Reject or fix:

- arbitrary gaps that make related content look unrelated;
- `justify-content: space-between` used to spread a short navigation across a wide viewport;
- oversized search fields that crush logos or account/cart actions;
- full-screen heroes that hide the page's purpose;
- double borders or underlines caused by overlapping link and container decoration;
- multiple nearly identical gray or beige surfaces without semantic roles;
- decorative use of the action color;
- mixed font systems or isolated heading styles;
- inconsistent card media ratios and CTA positions;
- placeholder icons, testimonials, policies, destinations, or empty dialogs;
- desktop-only mega-menus reused unchanged on mobile;
- content hidden or clipped merely to make a screenshot look aligned.
