# AGENTS.md

## Project Boundary

`homebrew-transiever` owns stable Homebrew formulas for Transiever command-line tools.
It contains distribution metadata and validation automation only.

Source code, release asset production, CLI behavior, and release versioning remain in the owning source repositories.
Do not add beta formulas or publish Homebrew bottles.

## Layout

```text
Formula/                 Homebrew formulas
.github/workflows/       Formula CI and update automation
```

## Formula Policy

Track stable GitHub releases only.
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
```

Beta prereleases are intentionally excluded.
`olrx` is intentionally excluded because it requires Windows and classic Outlook.

