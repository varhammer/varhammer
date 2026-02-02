;; init.el — portable varhammer development environment:
;; Emacs 30.2 + SBCL 2.6.0 + SLIME 2.32

(let* ((init-dir (file-name-directory (or load-file-name
                                          (buffer-file-name)
                                          default-directory)))
       (root-dir (file-name-directory
                  (directory-file-name init-dir))))

  ;; Debug: show root directory
  (message "ROOT DIR: %s" root-dir)

  ;; Add SLIME paths to load-path
  (add-to-list 'load-path (expand-file-name "slime" root-dir))
  (add-to-list 'load-path (expand-file-name "slime/lib"
                                            root-dir))

  ;; Set SBCL as inferior Lisp program
  (let ((sbcl-path (expand-file-name "sbcl/bin/sbcl.exe"
                                     root-dir)))
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

;; Quick SLIME launch keybinding
(global-set-key (kbd "C-c s") 'slime)

;; Friendly REPL welcome message
(defun varhammer-slime-welcome ()
  "Show welcome message in SLIME REPL after connection."
  (when (and (featurep 'slime)
             (get-buffer "*slime-repl sbcl*"))
    (slime-eval
     `(swank:interactive-eval
       ,(format (concat
                 "\"\n;; Welcome to varhammer REPL (SBCL %s)"
                 "\n;; Theme: varhammer | Font: Cascadia Code"
                 "\n;; Ready for hacking... NOW!\n\"")
                (slime-lisp-version))))))
(add-hook 'slime-connected-hook 'varhammer-slime-welcome)

;; Delay UI setup until full startup (avoids 'Beginning of buffer')
(add-hook 'emacs-startup-hook
          (lambda ()
            ;; Set monospace font (fallback chain)
            (cl-loop for font in '("Cascadia Code" "CascadiaCode"
                                   "Noto Mono" "Courier New")
                     when (member font (font-family-list))
                     do (progn
                          (set-face-attribute 'default nil
                                              :family font
                                              :weight 'normal
                                              :height 140)
                          (message "✓ Font: %s @ 14pt" font)
                          (cl-return)))

            ;; Load theme after frame creation
            (add-to-list 'custom-theme-load-path
                         "~/.emacs.d/themes/")
            (load-theme 'varhammer t)

            ;; Friendly first-start reminder
            (unless (or (get-buffer "*slime-repl*")
                        (get-buffer "*inferior-lisp*"))
              (message 
              "➤ Start Lisp: M-x slime RET  |  Quick: C-c s"))

            ;; Theme toggle keybinding
            (global-set-key (kbd "C-c t v")
                            'varhammer-theme-toggle)))

;; Minimal startup
(setq inhibit-startup-screen t)
(setq package-enable-at-startup nil)
