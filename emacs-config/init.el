;; init.el — portable varhammer: Emacs 30.2 + SBCL 2.6.0 +
;; SLIME 2.32

(let* ((init-dir (file-name-directory (or load-file-name
                                          (buffer-file-name)
                                          default-directory)))
       (root-dir (file-name-directory
                  (directory-file-name init-dir))))

  ;; Debug: show root directory
  (message "ROOT DIR: %s" root-dir)

  ;; Add SLIME paths to load-path
  (add-to-list 'load-path (expand-file-name "slime" root-dir))
  (add-to-list 'load-path (expand-file-name "slime/lib" root-dir))

  ;; Set SBCL as inferior Lisp program
  (let ((sbcl-path (expand-file-name "sbcl/bin/sbcl.exe" root-dir)))
    (if (file-exists-p sbcl-path)
        (setq inferior-lisp-program sbcl-path)
        (message "ERROR: SBCL not found at %s" sbcl-path)))

  ;; Load and initialize SLIME
  (condition-case err
                  (progn
                    (require 'slime)
                    (slime-setup '(slime-repl))
                    (message "✓ SLIME ready"))
                  (error
                   (message "SLIME error: %s" err))))

;; Disable startup screen and package system
(setq inhibit-startup-screen t)
(setq package-enable-at-startup nil)