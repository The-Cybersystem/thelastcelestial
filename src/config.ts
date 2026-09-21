/**
 * Central site configuration.
 *
 * Everything that talks to the live server lives here so contributors only
 * ever edit ONE file to point the site at a new address.
 */
export const siteConfig = {
  name: 'The Last Celestial',
  tagline: 'A provisional world, NeoForge 1.21.1.',
  repo: 'https://github.com/The-Cybersystem/thelastcelestial',

  /** Address players type into Minecraft to join. */
  minecraftAddress: 'exploringfoundation.ddns.net',
  minecraftPort: 25564,
  minecraftVersion: '1.21.1',
  loader: 'NeoForge',

  /** Live map bridge (BlueMap behind a Tailscale Funnel). */
  mapBaseUrl: 'https://riven-webster-dev.saiga-saturation.ts.net',

  /** BlueMap map id for the Overworld (generated on first BlueMap boot). */
  mapId: 'world',

  /** How often the player widget refreshes the live feed (ms). */
  updateIntervalMs: 30000,

  get livePlayersUrl(): string {
    return `${this.mapBaseUrl}/maps/${this.mapId}/live/players.json`;
  },
  get mapEmbedUrl(): string {
    return `${this.mapBaseUrl}/#/`;
  },
  get mcAddressDisplay(): string {
    return `${this.minecraftAddress}:${this.minecraftPort}`;
  },
};