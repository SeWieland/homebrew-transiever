# Transiever Homebrew Tap

Homebrew formulas for the Transiever command-line tools on Linux x64.

## Install

Install the CLI you need directly:

```bash
brew install SeWieland/transiever/msieve
brew install SeWieland/transiever/srtx
```

| Formula  | CLI                                                             | Platform  |
| -------- | --------------------------------------------------------------- | --------- |
| `msieve` | Direct ManageSieve protocol operations                          | Linux x64 |
| `srtx`   | Rule inspection, optimization, Sieve generation, and deployment | Linux x64 |

The formulas install self-contained release assets, so a separate .NET runtime is not required.
`olrx` is not available because it requires Windows and classic Outlook.

## Updates

Automation checks stable upstream GitHub releases every six hours and opens formula update pull requests.
Beta prereleases are intentionally excluded.
