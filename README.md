# App Tools

Simple command-line tools for Flutter/Dart projects.

Repository: https://github.com/GeceGibi/app_tools.git

## Installation

```bash
dart pub global activate --source git https://github.com/GeceGibi/app_tools.git
```

## Commands

- atbuild — versioning and tag/ENV generation
- atclean — project cleaning and regeneration tasks

### atbuild
Generates version info, finds/increments the latest matching git tag and writes to `.env`.

```bash
# Help
atbuild --help

# First-time setup (creates versioning.yaml)
atbuild --init

# Examples
atbuild -p ios -s staging --patch
atbuild -p android -s prod -f main --minor

# Dry run (no file write)
atbuild -p ios -s dev --dry-run

# Disable auto bumping of versionCode
atbuild -p android -s prod --no-auto-bump-version-code
```

Parameters:
- -p, --platform: Platform name (e.g. `ios`, `android`) — required
- -s, --stage: Stage name (e.g. `dev`, `staging`, `prod`) — required
- -f, --flavor: Flavor name (optional)
- --patch / --minor / --major: `versionName` bump type
- --auto-bump-version-code: Auto-increment `versionCode` (default: true)
- --dry-run: Compute only, do not write
- --init: Create `versioning.yaml`
- --verbose, --help

Outputs:
- Writes these variables into `.env`:
  - `VERSION_NAME`, `VERSION_CODE`
  - Tag variable named by `export-env-name` (default: `VERSION_TAG`)
- Prints platform/version info and the generated tag.

Version/Tag rules:
- Finds the latest matching git tag and parses it; if none, starts with `1.0.0/1`.
- `versionName`: bumped by `--patch | --minor | --major`. Correctly resets lower segments (e.g., `1.2.5` + `--minor` = `1.3.0`).
- `versionCode`: date-based; if not greater than current or if `versionName` has changed, increments by at least 1.
- All rules are configurable via `versioning.yaml`.
- Strict tag parsing: Ensures the latest tag matches the defined template exactly.

`versioning.yaml` example:

```yaml
export-env-name: VERSION_TAG
formats:
  tag: v{versionName}-{flavor}-{stage}-{platform}-{versionCode}
  version-name:
    - any: d.d.d
  version-code:
    - any: 1yyMMdd
    - android: 1yyMMddHH
```

Notes:
- Tag template variables: `{versionName}`, `{versionCode}`, `{platform}`, `{stage}`, `{flavor}`.
- Operates with git tags in the repo; uses the pattern to get the latest tag.

### atclean
Cleans the project and regenerates required artifacts. Stops execution if any step fails.

```bash
# Default flow (clean, pub get, iOS pods if present, l10n and freezed)
atclean

# Verbose output
atclean -v

# Also remove lock files (includes .flutter-plugins cleaning)
atclean -lf
```

Flags:
- -c, --clean (default: true)
- -i, --ios (default: true; runs pod steps if `ios` folder exists)
- -f, --freezed (default: true; generates models via build_runner)
- -n, --l10n (default: true; runs if `l10n.yaml` exists)
- -l, --lock-files (optional; removes `pubspec.lock` and `Podfile.lock`)
- -v, --verbose; -h, --help

## Features

- Automatic version and tag generation
- Writes to `.env`
- Project cleaning and dependency management
- Colored, readable terminal output

## Requirements

- Dart SDK 3.8.1+
