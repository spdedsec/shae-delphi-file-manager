# DESIGN.md — shae-delphi-file-manager

SHAE Field Manual Design System applied to the Free Pascal file manager
(console / text UI).

## Color palette (conceptual, mapped to terminal)

| Token | Value | Use |
|-------|-------|-----|
| Warm paper | `#F2EEE5` | Terminal page/ground (default background) |
| Ink | `#191712` | Primary text |
| Oxide signal | `#B3341B` | App header, command prompts, action labels |

One oxide-red signal per view: the application header (`SHAE File Manager`).
No gradients, glows, glass cards, shadows, or pills — appropriate for a text
UI, which is inherently flat and ink-on-paper.

## Layout & geometry

- `0px` radius; flat physical presentation (text UI has no chrome).
- 1px-equivalent hairline rules drawn with dashes (`----------------------------------------`).
- Border-defined "cards": directory listing block framed by dash rules.
- 4px spacing base expressed as blank-line separation between sections.
- 1280px max container concept → lines kept within a readable measure
  (62–68ch for prose; data columns aligned).
- 44px touch targets → in a console app this maps to generously padded,
  clearly separated command targets; commands are full-line, easy to hit.
- No horizontal overflow; output wrapped to terminal width.

## Typography

- Body/data: monospace (JetBrains Mono concept) — aligned columns for
  NAME / SIZE / TYPE, tabular numerals for file sizes.
- Short labels uppercase: `NAME`, `SIZE`, `TYPE`, `Directory`, `File`.
- Header uses display emphasis (uppercase, letter-spaced equivalent via
  spacing).

## Motion

- Text UI: state changes are instant screen redraws; conceptually
  140–240ms transitions reduced to a single frame. No animation libraries.
- Reduced motion: no animated spinners or progress indicators.

## Accessibility

- WCAG AA contrast equivalent: high-contrast ink-on-paper terminal colors.
- Focus/selection: the current directory path is always printed at the
  prompt (`/home/spdedsec/tier3>`), giving clear keyboard context.
- Complete keyboard paths: every action reachable by typing a command and
  Enter; no mouse required.
- No reliance on color alone: file type is shown as text (`Directory` /
  `File`), not only by color.

## Files

- `src/filemanager.pas` — the entire application, written in authentic
  Free Pascal / Delphi Object Pascal syntax.
- `DESIGN.md` — this document.
