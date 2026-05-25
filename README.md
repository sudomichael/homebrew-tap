# sudomichael/homebrew-tap

Homebrew tap for [Continuum](https://getcontinuum.dev) and other tools by [@sudomichael](https://github.com/sudomichael).

## Usage

```bash
brew install sudomichael/tap/continuum
continuum connect
```

That's it. Re-running `brew upgrade` will pick up new releases automatically — the formula is auto-bumped by the [release workflow](https://github.com/sudomichael/continuum/blob/main/.github/workflows/homebrew.yml) in the main repo on every tag push.

## Available formulae

| Formula | Description |
| --- | --- |
| `continuum` | Continuum CLI — pairs Claude Code & Codex sessions to your Continuum brain |

## Source

Each formula points at native binaries published to GitHub Releases (no Homebrew bottling needed for Go binaries). SHA256SUMS are verified in the formula.
