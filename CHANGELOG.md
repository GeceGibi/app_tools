## 1.2.0
- Refactor: Moved core logic from `bin/` to `lib/src/` (VersionManager, CleanManager) for better architecture.
- Feature: Added execution duration timer to `atclean` and individual tasks.
- Fix: Improved `.env` parsing to handle values containing `=` characters correctly.
- Fix: Updated `Worker` to use proper UTF-8 stream decoding to prevent character split issues.
- Fix: Resolved linter warnings and code style issues.

## 1.1.2
- Internal updates.

## 1.1.1
- Improved `atbuild`: Fixed SemVer logic for major/minor increments (resetting lower segments).
- Improved `atbuild`: Fixed version code logic to ensure it increments when the version name changes.
- Improved `atbuild`: Reverted tag parsing to strict mode for reliability.
- Improved `atclean`: Added error handling to stop execution on failure.
- Improved `atclean`: Added more thorough cleanup for iOS and Flutter plugin files.
- Refactored: Updated all inline comments to English.

## 1.1.0
- Added versioning and cleaning tools.
- Initial release of atbuild and atclean.
