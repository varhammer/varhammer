# Varhammer — Portable Common Lisp Environment

![GitHub repo size](https://img.shields.io/github/repo-size/varhammer/varhammer?style=flat)
![License](https://img.shields.io/github/license/varhammer/varhammer?style=flat)
![Release](https://img.shields.io/github/v/release/varhammer/varhammer?style=flat)

> **Emacs 30.2 + SBCL 2.6.0 + SLIME 2.32 + Quicklisp**  
> Fully offline, USB-ready, no installation required.  
> Works even without internet (e.g., in regions with limited connectivity).

![Portable](https://img.shields.io/badge/Portable-Yes-green?logo=windows)
![Offline](https://img.shields.io/badge/Offline-Ready-blue)
![License](https://img.shields.io/badge/License-GPLv3+-red)

---

## ✨ Features

- ✅ **No admin rights needed**
- ✅ **No installation** — just extract and run
- ✅ **No command window** — clean GUI via `run-emacs.exe`
- ✅ **Preinstalled libraries**: `cl-ppcre`, `alexandria`, `uiop`, `bordeaux-threads`, `local-time`
- ✅ **Works from USB flash drive**
- ✅ **Fully offline after initial setup**

---

## 🚀 Quick Start

1. Extract `varhammer-portable.zip` to any folder (e.g., `D:\Varhammer\`)
2. Double-click **`run-emacs.exe`**
3. In Emacs, press `M-x slime` to start the REPL
4. Use Common Lisp with full library support — **no internet required!**

> 💡 Prefer CLI? Run `run-emacs.bat` (shows console window).

---

## 🛠️ Build from source

If you want to customize or rebuild Varhammer:

1. Place your builds in `emacs-source/`, `sbcl-source/`, etc.
2. Run `varhammer-build.bat`
3. Get your own `varhammer-portable.zip`

---

## 📦 Included Components

| Component | Version | License | Official Project |
|----------|--------|--------|------------------|
| **GNU Emacs** | 30.2 | GPLv3+ | [gnu.org/software/emacs](https://www.gnu.org/software/emacs/) |
| **SBCL** | 2.6.0 | Public Domain (+ MIT/BSD) | [sbcl.org](https://sbcl.org/) |
| **SLIME** | 2.32 | GPLv2+ | [github.com/slime/slime](https://github.com/slime/slime) |
| **Quicklisp** | latest | MIT | [quicklisp.org/beta](https://www.quicklisp.org/beta/) |
| **cl-ppcre** | — | BSD 2-Clause | [edicl.github.io/cl-ppcre](https://edicl.github.io/cl-ppcre/) |
| **Bordeaux-Threads** | — | MIT | [github.com/sionescu/bordeaux-threads](https://github.com/sionescu/bordeaux-threads) |
| **Local-Time** | — | BSD 3-Clause | [github.com/dlowe-net/local-time](https://github.com/dlowe-net/local-time) |

> 🔍 Full license details: [`THIRD-PARTY-LICENSES.txt`](THIRD-PARTY-LICENSES.txt)

---

## ⚖️ Licensing

**Varhammer** is free software: you can redistribute it and/or modify  
it under the terms of the **GNU General Public License v3.0 or later**.

This program comes with ABSOLUTELY NO WARRANTY.  
See the GNU General Public License for more details.

- Full license: [`LICENSE`](LICENSE)
- Third-party licenses: [`THIRD-PARTY-LICENSES.txt`](THIRD-PARTY-LICENSES.txt)

---

## 📬 Contact

- **Author**: [@varhammer](https://github.com/varhammer)
- **Email**: upfire@gmail.com

> ℹ️ This project is not affiliated with GNU, SBCL, Quicklisp, or CL-PPCRE teams.