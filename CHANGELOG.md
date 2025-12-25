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
