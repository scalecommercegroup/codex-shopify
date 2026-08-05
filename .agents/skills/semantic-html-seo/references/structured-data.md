# Structured data reference

Structured data describes visible page content to machines. It does not create facts, replace content, guarantee rich results, or justify marking up every section.

## Responsibility map

| Type | Typical owner | Use only when |
| --- | --- | --- |
| `WebSite` | global layout or dedicated SEO snippet | the site identity and URL are verified |
| `Organization` | global layout or dedicated SEO snippet | organization facts and brand assets are verified |
| `LocalBusiness` subtype | contact/location template or dedicated schema component | the page visibly contains the real location's details |
| `BreadcrumbList` | breadcrumb component or page template | the visible hierarchy and URLs are correct |
| `Product` and `Offer` | product template or established product-schema component | price, currency, availability, variants, identifiers, and URLs come from live product data |
| `Article` | article/blog template | author, dates, headline, image, and publisher data are visible and accurate |
| `Review` / `AggregateRating` | verified review integration or responsible page template | the reviews are genuine, visible, attributable, and eligible for the marked-up entity |
| `FAQPage` | page template only when justified | the page contains visible FAQs and the current search guidelines make the markup useful |

An ordinary promotional, image-and-text, card, CTA, or newsletter section should not emit page-level schema.

## Preflight audit

Before adding or editing JSON-LD:

1. Search theme layouts, snippets, templates, sections, app embeds, tracking containers, and rendered HTML for `application/ld+json`, microdata, and RDFa.
2. List existing entity types and stable `@id` values.
3. Determine which component owns the page's main entity.
4. Check whether Shopify or an installed app already supplies product, review, breadcrumb, organization, or local-business data.
5. Compare visible values with proposed properties.
6. Check the current Google documentation for the exact supported type and required properties.

Do not add a second entity simply because the first one is incomplete. Fix or extend the responsible source when possible.

## Data rules

- Prefer JSON-LD when adding Google-supported structured data.
- Use the most specific correct type.
- Include required properties and only verified recommended properties.
- Keep URLs absolute, canonical, crawlable, and consistent with the visible page.
- Keep image URLs crawlable and relevant.
- Use live Shopify values for price, currency, availability, SKU, variant, and product URL.
- Use ISO formats for dates and standards-based values for availability or condition.
- Omit unknown optional properties rather than guessing.
- Escape and serialize dynamic values safely through the platform's supported JSON mechanism.
- Keep structured data in the same language and market context as the page.

## Entity identity and duplication

- Use stable `@id` values only when the architecture needs to connect entities across graphs.
- Reuse the same identity for the same entity instead of creating competing versions.
- Do not emit multiple `Organization`, `WebSite`, `Product`, or `LocalBusiness` entities with conflicting facts.
- Do not let every merchant-arrangeable section emit schema for the page.
- Avoid mixing app-generated aggregate ratings with a second theme-generated rating count.
- If duplicates cannot be safely removed, log the owning sources and exact conflict rather than adding another workaround.

## Reviews and ratings

- Mark up only genuine reviews visible on the page.
- Keep author, rating scale, rating value, review count, and reviewed item consistent.
- Do not summarize external ratings into schema unless the use complies with the applicable feature policy and the visible page accurately represents the source.
- Never invent ratings, review counts, names, dates, or quotations.
- Do not attach a self-serving organization rating to an ineligible entity merely to seek stars in search.

## Local business

- Select the most specific appropriate subtype only when supported by the real business.
- Include name, address, phone, URL, opening hours, geo, service area, and images only when verified.
- Keep the visible contact/location page synchronized with the JSON-LD.
- Do not create location schema for areas served remotely as if they were staffed physical locations.
- Keep each physical location's identity distinct.

## FAQ and Q&A

- `FAQPage` is for a page where the publisher provides multiple questions and answers.
- `QAPage` is for a page focused on one question where users can submit answers; it is not a substitute for FAQs.
- Keep every marked question and answer visible to users.
- Do not add FAQ markup to ordinary product descriptions or hidden keyword content.
- Do not promise a FAQ rich result. Google generally shows FAQ rich results only for well-known authoritative government and health sites.

## Validation

After rendering a representative URL:

1. Inspect all JSON-LD in the final DOM.
2. Parse it as JSON and confirm dynamic values.
3. Run Google's Rich Results Test for Google-supported result types.
4. Run Schema.org's validator for broader vocabulary validation when relevant.
5. Check Search Console or URL Inspection after deployment when access and indexing are in scope.
6. Compare structured data with visible content and live Shopify data.
7. Re-test a product with variants, a sold-out product, a translated/market page, and an item without optional data when those states apply.

Passing a syntax test does not establish eligibility, accuracy, indexing, ranking, or rich-result display.

## Primary references

- [Google general structured-data guidelines](https://developers.google.com/search/docs/appearance/structured-data/sd-policies)
- [Google supported structured-data features](https://developers.google.com/search/docs/appearance/structured-data/search-gallery)
- [Google merchant-listing structured data](https://developers.google.com/search/docs/appearance/structured-data/merchant-listing)
- [Google Rich Results Test](https://search.google.com/test/rich-results)
- [Schema.org validator](https://validator.schema.org/)
