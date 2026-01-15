# Changelog

All notable changes to **Varhammer** will be documented in this file.  
Varhammer is a portable, offline-ready Common Lisp environment for Windows.

The format is based on [Keep a Changelog](https://keepachangelog.com/).  
Project licensed under **GPLv3+**.

## [1.0.0] — 2026-01-15

### Added
- **Fully portable Common Lisp IDE** for Windows (no installation, no admin rights)
- Bundled components:
  - GNU Emacs 30.2 (with GUI, no console window)
  - SBCL 2.6.0 (public domain implementation)
  - SLIME 2.32 (Superior Lisp Interaction Mode for Emacs)
  - Quicklisp (MIT) with preinstalled libraries:
    - `cl-ppcre` (BSD 2-Clause) — Perl-compatible regular expressions
    - `bordeaux-threads` (MIT) — threading support
    - `local-time` (BSD 3-Clause) — date/time handling
- **Offline-first design**: works without internet
- **Dual launchers**:
  - `run-emacs.exe` — clean GUI (no command window)
  - `run-emacs.bat` — for debugging or CLI use
- **Automatic build system** (`build-varhammer.ps1`):
- Full license compliance:
  - Project licensed under **GPLv3+**
  - Includes `LICENSE`, `THIRD-PARTY-LICENSES.txt`, and proper attribution
- Documentation:
  - `README.md` with component list and usage instructions
  - Ready for GitHub repository and Releases

### Fixed
- Resolved PowerShell parsing errors caused by non-ASCII characters (e.g., long dash `—`)
- Ensured `.sbclrc` loads Quicklisp automatically in both REPL and SLIME
- Corrected SLIME path resolution in `init.el` for portable use

### Changed
- Replaced hardcoded paths with dynamic root detection in `.sbclrc` and `init.el`
- Adopted `root-metadata/` directory for all top-level files (`LICENSE`, `README.md`, etc.)

### Known Limitations
- Windows-only (no Linux/macOS support planned at this time)
- Libraries must be preinstalled for true offline use

---

> ℹ️ This changelog starts with the first public release of Varhammer.