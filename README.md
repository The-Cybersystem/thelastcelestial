# The Last Celestial

A provisional Minecraft world — NeoForge 1.21.1 — and the source for its
community site.

Live site: <https://the-cybersystem.github.io/thelastcelestial/>

## What's here

```
src/pages/   Astro pages (docs, lore, mods, archive — all markdown)
src/components/  layout, live player widget, live map embed
src/config.ts    the ONE file to change for server addresses
public/assets/   images, maps, logos, version.json
```

## Run locally

```bash
npm install
npm run dev      # http://localhost:4321/thelastcelestial/
npm run build    # static output in dist/
```

## Deploy

Push to `main` — a GitHub Actions workflow builds and publishes to Pages.
No manual steps.

## Contributing

Lore, rules, and changelog are all markdown. Edit, open a pull request, done.

## Security

See [`SECURITY.md`](SECURITY.md) for the full policy — supported versions,
scope, and how to report. For anything affecting the live site, server, or
player data, use **private** reporting (the repo's private vulnerability
reporting, or email encrypted to Riven's GPG key `7F9348CDB8611F47`) rather than
a public issue. Never open a public issue for sensitive findings.