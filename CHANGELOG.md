# Changelog

All notable changes to **varhammer** will be documented in this
file. varhammer is a portable, offline-ready Common Lisp
development environment for Windows.

The format is based on [Keep a Changelog](https://keepachangelog.com/).
Project licensed under **GPLv3+**.

## [1.1.0] — 2026-02-02 — "Midnight"

### Added
- Custom `varhammer` theme ("Midnight"):
  - Deep blue background (#1B2845) for reduced eye strain
  - Vibrant syntax accents: magenta (keywords), green
    (functions), cyan (strings)
  - Optimized for bracket-heavy Lisp development
- Font fallback chain for portability:
  - Cascadia Code → Noto Mono → Courier New (all 14pt)
  - Regular weight prioritized for long-session comfort
- REPL welcome message showing environment details on connect
- Keybindings for workflow acceleration:
  - `C-c s` — launch SLIME REPL instantly
  - `C-c t v` — toggle varhammer theme
- Startup UX improvements:
  - Clean echo area messages without buffer artifacts
  - Friendly first-start reminder for new users

### Changed
- All configuration lines strictly ≤69 characters (Emacs
  Lisp style guide compliance)
- Theme loading moved to `emacs-startup-hook` for smoother
  visual initialization
- Font selection now happens after frame creation (avoids
  fallback to Courier New on slow machines)

### Fixed
- Eliminated "Beginning of buffer" artifacts during startup
- Corrected indentation in multi-line face definitions
- Resolved font-family detection edge cases on clean Windows
  installs

## [1.0.0] — 2025-12-15 — "Genesis"

### Added
- Portable Common Lisp environment for Windows:
  - GNU Emacs 30.2 (GUI launcher without console window)
  - SBCL 2.6.0 (fully self-contained binary)
  - SLIME 2.32 (local build, internet-independent)
  - Quicklisp with preinstalled libraries:
    * cl-ppcre (regex)
    * bordeaux-threads (concurrency)
    * local-time (date/time)
- Dual launchers:
  - `run-emacs.exe` — silent GUI mode
  - `run-emacs.bat` — CLI mode with console
- Automatic build system (`build-varhammer.ps1`)
- Full license compliance (GPLv3+ project + third-party
  attributions)
- USB-portable design (works from any drive letter,
  no registry writes)

### Known Limitations (all versions)
- Windows-only (NTFS file system required)
- Offline operation requires preinstalled libraries
- Not tested on Windows versions older than 10

---

> ℹ️ "Genesis" established the portable foundation.  
> "Midnight" refined the visual experience for focused Lisp
> development.