---
title: Getting Started
description: How to apply, install the modpack, and get into the world.
layout: ../../layouts/BaseLayout.astro
import { siteConfig } from '../../config';
---

The world is a small, whitelist-style community: connection is by invite, and
honesty about the modpack matters more than skill.

1. **Join the community** — the server runs through the community Discord.
   Ask any member (or the admin) for an invite, get whitelisted, and receive
   the join address. The address is on the [home page](../).
2. **Install the modpack** — the pack is distributed **directly to whitelisted
   players as an archive** (`.zip` of the exact client). Do **not**
   hand-assemble mods or reuse an older folder: the server's integrity service
   verifies your client modlist against the blessed baseline and kicks any
   deviation at login.
3. **Follow the rules** — the ruleset is being revised; the current draft is
   on [the rules page](../rules/).
4. **Claim your lore** — every player character has a page under
   [Lore](../../lore/). Write yours and open a pull request.

{siteConfig.discordInvite && `**Looking for the Discord?** Join here: ${siteConfig.discordInvite}`}