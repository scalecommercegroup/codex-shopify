# Storefront QA checklist

Use the relevant checks before handoff. Mark anything untested as a verification limit, not a pass.

## 1. Scope and content

- [ ] Correct store, theme, branch, environment, routes, and templates were changed.
- [ ] Approved brief/wireframe order and functionality are preserved.
- [ ] Primary audience, task, CTA, and next destination are clear.
- [ ] No fabricated facts, reviews, prices, guarantees, hours, stock, or delivery claims.
- [ ] No placeholder/demo content, dead CTA, empty modal, duplicate section, or provisional link left unlogged.
- [ ] One H1 per page; headings follow a logical outline.
- [ ] Customer-facing language is consistent and localized.
- [ ] Business, contact, policy, and service details agree across header, footer, pages, metadata, and structured data.

## 2. Design system

- [ ] Existing tokens are reused or a coherent token layer was added.
- [ ] Containers and major left/right edges align across sections.
- [ ] Section and internal spacing use the approved scale.
- [ ] No accidental huge gaps, collapsed gaps, double borders, double underlines, or one-off negative margins.
- [ ] Fonts, weights, line-height, letter spacing, and type roles are consistent.
- [ ] Buttons use approved variants and consistent dimensions.
- [ ] Cards use consistent image ratios, content order, height strategy, and CTA alignment.
- [ ] Action colors are reserved for meaningful actions/states.
- [ ] Long and short real content does not break the composition.

## 3. Responsive layouts

- [ ] 360px or smallest supported mobile width.
- [ ] 375px mobile acceptance width.
- [ ] 390px larger mobile width.
- [ ] 768px tablet transition.
- [ ] 1024px small laptop/tablet landscape transition.
- [ ] 1280px or 1366px laptop width, including about 768px viewport height.
- [ ] 1440px desktop.
- [ ] 200% zoom remains usable without loss of content/function.
- [ ] No horizontal page overflow.
- [ ] No clipped, overlapping, obscured, off-screen, or hidden essential content.
- [ ] Sticky/fixed elements do not cover controls, errors, consent, cart, or footer content.
- [ ] Media crops remain relevant at every breakpoint.
- [ ] Touch targets and adjacent-control spacing are usable.

## 4. Accessibility

- [ ] Normal text contrast is at least 4.5:1.
- [ ] Qualifying large text and meaningful UI/icon contrast are at least 3:1.
- [ ] All interactive elements are keyboard reachable in logical order.
- [ ] Visible `:focus-visible` is present and not clipped.
- [ ] Links navigate and buttons act; no fake button/link semantics.
- [ ] Icon-only controls have accessible names.
- [ ] Forms have visible labels, instructions, errors, and confirmation.
- [ ] Dialog/drawer/menu focus is managed; Escape closes; focus returns to the trigger.
- [ ] Images have meaningful alt text or empty alt when decorative.
- [ ] Heading, list, table, landmark, details/summary, and dialog semantics are appropriate.
- [ ] Motion respects `prefers-reduced-motion`.
- [ ] Color is not the only carrier of status or error information.

## 5. Header, navigation, search, and footer

- [ ] Utility bar wording is short, valuable, accurate, and mobile-safe.
- [ ] Header row padding, logo clear space, search width, and action spacing look intentional.
- [ ] Main navigation uses stable gaps and does not spread awkwardly across the viewport.
- [ ] Secondary links are in their intended region, not squeezed beside search.
- [ ] Mega-menu fits the viewport, keeps text visible, supports keyboard use, and scrolls internally if needed.
- [ ] Mobile menu has clear open, back, close, and view-all paths.
- [ ] Predictive search opens, updates, supports keyboard selection, handles loading/no results, and links to full results.
- [ ] Footer columns, newsletter, policies, contact details, icons, and mobile accordions work.

## 6. Collection and product

- [ ] Breadcrumbs reflect one real hierarchy without duplication.
- [ ] Collection H1/introduction is concise and products appear early.
- [ ] Result count, sort, filters, filter counts, chips, clear-all, and empty states work.
- [ ] Mobile filters open and close correctly and expose result count/action.
- [ ] Product cards handle long names, price ranges, discounts, sold out, unavailable, and missing images.
- [ ] Required variants can be selected; unavailable combinations are clear.
- [ ] Quick add either adds directly or opens a populated functional variant picker.
- [ ] Product price, tax, stock, lead time, quantity, and shipping/trust messages are accurate.
- [ ] Product gallery, zoom, thumbnails, and variant media work.
- [ ] Specifications, description, reviews, related products, and guides are correctly associated.
- [ ] Sticky mobile purchase UI appears at the intended point and does not obstruct content.

## 7. Cart and conversion flows

- [ ] Product-form add-to-cart succeeds.
- [ ] Quick add succeeds.
- [ ] Cart count updates immediately.
- [ ] Configured cart drawer/page/notification opens as expected.
- [ ] Correct product, variant, quantity, price, and discounts appear.
- [ ] Quantity update, removal, empty cart, and recoverable errors work.
- [ ] Checkout CTA works and is not obscured.
- [ ] Account/login, B2B, contact, application, newsletter, and store-location destinations work when affected.
- [ ] Form success in the UI corresponds to a real submission/notification result.

## 8. SEO and structured data

- [ ] Title, meta description, canonical, robots behavior, Open Graph, and social image are appropriate.
- [ ] Product and collection metadata is unique enough to be useful.
- [ ] Structured data parses and matches visible verified facts.
- [ ] FAQ schema is emitted only for visible FAQ content.
- [ ] LocalBusiness includes verified name, address, phone, hours, and geo when used.
- [ ] Internal links point to canonical, existing destinations.
- [ ] Redirect requirements, old URLs, missing pages, and possible 404s are recorded.

## 9. Performance and technical checks

- [ ] Theme/framework validation passes.
- [ ] Browser console has no new errors.
- [ ] Likely LCP image is sharp, correctly sized, and not lazy-loaded.
- [ ] Below-fold images are lazy-loaded with dimensions/aspect ratios.
- [ ] Responsive image widths avoid oversized downloads.
- [ ] Fonts use limited files/weights and do not cause severe layout shift.
- [ ] New scripts are scoped, guarded, and do not attach duplicate listeners.
- [ ] No obvious cumulative layout shift from media, fonts, banners, or dynamic content.
- [ ] Critical interaction remains understandable if enhancement JavaScript is delayed or fails.

## 10. Handoff record

- [ ] List changed routes, templates, components, resources, and data.
- [ ] List device sizes and flows actually tested.
- [ ] Record validation output and rendered-preview status.
- [ ] Record blockers, deliberate omissions, missing content, missing schemas, provisional links, and why each remains.
- [ ] Record exact next action and owner when known.
- [ ] Do not mark complete if a required rendered or live verification was blocked.
