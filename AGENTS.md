# AGENTS.md

## Project Boundary

`homebrew-transiever` owns Homebrew formulas for Transiever command-line tools.
It contains distribution metadata and validation automation only.

Source code, release asset production, CLI behavior, and release versioning remain in the owning source repositories.
Do not add beta formulas or publish Homebrew bottles except for the explicitly approved temporary `tbrx` beta.

## Layout

```text
Formula/                 Homebrew formulas
.github/workflows/       Formula CI and update automation
```

## Formula Policy

Track stable GitHub releases only, except for the explicitly unstable `tbrx` beta.
Use the versioned, self-contained Linux x64 assets published by each source repository.
Keep platform and architecture requirements aligned with the released assets.

Every formula must define a stable-release `livecheck` and an installation test.
Hashes must be SHA-256 values for the exact published archives.
Do not add credentials, installer side effects, or source-repository build logic.

## Validation

```bash
brew style SeWieland/transiever
brew audit --strict --online SeWieland/transiever/msieve
brew audit --strict --online SeWieland/transiever/srtx
brew livecheck SeWieland/transiever/msieve
brew livecheck SeWieland/transiever/srtx
brew install --build-from-source SeWieland/transiever/msieve
brew test SeWieland/transiever/msieve
brew install --build-from-source SeWieland/transiever/srtx
brew test SeWieland/transiever/srtx
brew livecheck SeWieland/transiever/tbrx
brew install --build-from-source SeWieland/transiever/tbrx
brew test SeWieland/transiever/tbrx
```

Beta prereleases are intentionally excluded except for `tbrx`.
`tbrx` keeps its permanent formula name, displays a testers-wanted caveat, and temporarily uses prerelease-aware livecheck.
Switch it to the normal stable-only strategy at the first stable release.
`olrx` is intentionally excluded because it requires Windows and classic Outlook.

