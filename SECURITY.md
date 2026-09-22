# Security Policy

The Last Celestial runs a live Minecraft server and ships the source for its
community site. This policy covers the **site repository** — the code, content,
deploy workflow, and anything it renders from the live server. It does not cover
the Minecraft server runtime, the Discord community, or the separate
in-development Discord bot project (unreleased, maintained outside this repo).

## Supported versions

Only the deployed build — the latest `main` branch published to GitHub Pages —
is supported. Older static builds are never served publicly, so there is nothing
to patch outside `main`.

Dependency security for the site toolchain (npm packages) is handled by
Dependabot on the same branch. If Dependabot cannot fix something within a
reasonable window, report it through the channels below.

## Reporting a vulnerability

**Do not open a public issue** for anything that affects the live site, the
running server, or player data. Preferred channels, in order:

1. **GitHub private vulnerability reporting** — use the repo's "Security" tab
   to draft an advisory privately (enabled on this repository).
2. **Encrypted email** to `riven.thefoundation@proton.me`.

   Encrypt the report to **Riven Webster's own GPG key** — fingerprint
   `7F9348CDB8611F47` — and attach it as a file. Do **not** put report content
   in the email body; Proton Mail enforces its own transport keys, which can
   change without notice, so the message body is untrusted for this purpose.

   Key import hint:

   ```bash
   curl https://github.com/The-Cybersystem.gpg | gpg --import
   ```

   The key is also used to verify every commit in this repository's history.

If you cannot encrypt, send a plain email *mentioning only* that you have a
private report and the subject area — then complete the handoff over a channel
the maintainer proposes.

### What to include

- The affected path/URL or file + line, if known.
- Steps to reproduce, and the behavior you expected vs. observed.
- Impact: what an attacker gains, and whether you confirmed it on the live site.
- Optional: proof-of-concept artifacts attached (encrypted), staged so they can
  be tested privately.

## Scope

**In scope** — flaws in the site code and content, the build/deploy workflow,
the live-data endpoints the site renders (the live players feed, the live map
embed), the modlist generation script, and secret-handling hygiene of this
repository.

**Out of scope** — the Minecraft server runtime and world, game plugins, the
Discord community, third-party services the site integrates with, and the
separate in-development bot project.

This repository intentionally contains **no server secrets and no runtime
player data** (see `.gitignore` for the guard list). If you find any, treat it
as severe and report it privately immediately — never mention it in a public
issue.

## Handling

Coordinated, private disclosure is preferred for anything affecting the deployed
site. This is a solo-maintained project; commitments are honest rather than
promised:

- Acknowledgement: within **72 hours**.
- Triage status, if not already resolved: within **one week**.
- No guaranteed timeline for fixes — severity, scope, and availability of the
  maintainer decide it.

Low-severity, non-sensitive findings (documentation, cosmetic issues, broken
links) are fine as normal issues or pull requests with no sensitivity — apply
the usual contribution flow.

## Contributing safely

Contributors are expected to follow the same rules as the maintainer:

- Never commit secrets, keys, tokens, runtime files, or player/ops data —
  see the guard list in `.gitignore`.
- Keep server addresses out of commit messages and issue text where they are
  not functionally required.
- Prefer private reporting channels for anything you would not post publicly.

## Maintainer

Riven Webster — <riven.thefoundation@proton.me> · GPG `7F9348CDB8611F47`