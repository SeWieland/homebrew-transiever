# Transiever Homebrew Tap

Homebrew formulas for the Transiever command-line tools on Linux x64.

## Install

Install the CLI you need directly:

```bash
brew install SeWieland/transiever/msieve
brew install SeWieland/transiever/srtx
brew install SeWieland/transiever/tbrx
```

| Formula  | CLI                                                             | Platform  |
| -------- | --------------------------------------------------------------- | --------- |
| `msieve` | ManageSieve client to list, download, upload, and activate Sieve scripts | Linux x64 |
| `srtx`   | Create Sieve scripts from rule files; inspect, optimize, preview, and deploy | Linux x64 |
| `tbrx`   | Experimental Thunderbird filter export for Sieve generation and server sync | Linux x64 |

The formulas install self-contained release assets, so a separate .NET runtime is not required.
`olrx` is not available because it requires Windows and classic Outlook.

## Updates

Each upstream release updates its corresponding formula after the Linux asset has been published.
Formula update pull requests are validated by `brew test-bot` and merged automatically after the required checks pass.
Beta prereleases are intentionally excluded except for the unstable `tbrx` beta.
`tbrx` temporarily tracks prereleases under its permanent name and actively requests [redacted tester reports](https://github.com/SeWieland/Transiever.ThunderbirdResiever/issues).

## AI usage

Transiever is a personal hobby project created to solve practical problems I have encountered myself.

AI is used heavily throughout its development. It supports research, design exploration, implementation, debugging, and documentation.

The project is developed using test-driven development and reviewed by a human, me. Its direction, behavior, and quality remain guided by the problems it is intended to solve.
