# ClearDMARC Email Source Logos

Public repository of SVG logos for email sending domains, used by the ClearDMARC UI.

## Usage

Fetch a logo by domain name directly from GitHub raw content:

```
https://raw.githubusercontent.com/<org>/<repo>/main/logos/{domain}.svg
```

**Example:**
```
https://raw.githubusercontent.com/<org>/<repo>/main/logos/gmail.com.svg
```

Check `index.json` to see all available domains before fetching:

```
https://raw.githubusercontent.com/<org>/<repo>/main/index.json
```

## Structure

```
logos/
  gmail.com.svg
  google.com.svg
  microsoft.com.svg
  outlook.com.svg
  ...
index.json          # list of all available domains
scripts/
  add-logo.sh       # helper to add a new logo
```

## Adding a Logo

Use the helper script to add a logo for a new domain:

```bash
./scripts/add-logo.sh <domain> <simple-icons-slug> [hex-color]
```

**Example:**
```bash
./scripts/add-logo.sh klaviyo.com klaviyo 231F20
```

- `domain` — the sending domain (e.g. `klaviyo.com`)
- `simple-icons-slug` — slug from [Simple Icons](https://simpleicons.org) (e.g. `klaviyo`)
- `hex-color` — brand hex color without `#` (e.g. `231F20`); optional if the icon from the CDN already includes a fill color

After adding, run the script to regenerate `index.json`:

```bash
./scripts/update-index.sh
```

## Sources

SVG icons are sourced from [Simple Icons](https://simpleicons.org) and colored with official brand hex values.
Logos remain the property of their respective owners and are used for identification purposes only.
