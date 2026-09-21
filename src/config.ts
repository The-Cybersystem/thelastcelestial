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
  minecraftAddress: 'YOUR-DDNS-HOSTNAME',
  minecraftPort: 25565,
  minecraftVersion: '1.21.1',
  loader: 'NeoForge',

  /**
   * Live map bridge (BlueMap behind a Tailscale Funnel).
   * Set mapBaseUrl to your funnel URL once `tailscale funnel` is running,
   * e.g. "https://mc-server.my-tailnet.ts.net".
   */
  mapBaseUrl: 'https://YOUR.tailnet.ts.net',

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