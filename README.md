# App Tools

Simple command-line tools suite for Flutter/Dart projects.

**Repository:** https://github.com/GeceGibi/app_tools.git

## Installation

```bash
dart pub global activate --source git https://github.com/GeceGibi/app_tools.git
```

## Tools

### atbuild
Used for project version management and build operations.

```bash
# Initialize version file
atbuild --init

# For usage details
atbuild --help

# Build iOS app
atbuild -p ios -b

# Build Android App Bundle for Google Play
atbuild -p google -b

# Build APK for Huawei
atbuild -p huawei -b

# Build with specific flavor
atbuild -p ios -f staging -b

# Build without code signing (iOS)
atbuild -p ios -b -s

# Clean build with obfuscation
atbuild -p google -c -b -o
```

**Parameters:**
- **-p, --platform**: Platform to build for (`ios`, `google`, `huawei`) - **Required**
- **-f, --flavor**: Specify build flavor
- **-b, --build**: Execute build process after version update
- **-c, --clean**: Clean project before build
- **-o, --obfuscate**: Enable code obfuscation (default: true)
- **-s, --no-codesign**: Skip code signing (iOS only)
- **--production**: Production build flag
- **--init**: Initialize .versions.json file
- **--file**: Custom .versions.json file path (default: .versions.json)

### atclean
Used for project cleaning and dependency reinstallation operations.

```bash
# Clean project and reinstall dependencies
atclean

# Clean only (verbose mode)
atclean -v
```

## Features

- ✅ Automatic version management
- ✅ Project cleaning and dependency management
- ✅ Colorful terminal output
- ✅ Detailed error reporting

## Supported Platforms

- 🍎 **iOS** - Build IPA files
- 🤖 **Google Play** - Build App Bundle (*.aab) files  
- 📱 **Huawei** - Build APK files

## Requirements

- Dart SDK 3.8.1+
- Flutter (for atclean)

---

**Version:** 1.1.0+25
