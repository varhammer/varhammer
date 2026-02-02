;;; varhammer-theme.el --- Minimal version of varhammer theme

(deftheme varhammer
  "Dark theme with deep blue background and vibrant accents")

(let ((bg "#1B2845")          ; deep blue background
      (fg "#E6E8FF")          ; light foreground text
      (magenta "#D72483")     ; magenta for keywords and cursor
      (green "#9CEC5B")       ; green for function names
      (blue "#5899E2")        ; blue for types and lazy highlight
      (blue-alt "#335C81")    ; muted blue for comments
      (cyan "#94C9FF")        ; cyan for strings
      (highlight "#2A3655")   ; subtle background highlight
      )

  (custom-theme-set-faces
   'varhammer

   `(default ((t (:background ,bg :foreground ,fg))))
   `(cursor ((t (:background ,magenta))))
   `(region ((t (:background ,highlight))))
   `(hl-line ((t (:background ,highlight))))

   ;; Syntax highlighting
   `(font-lock-comment-face ((t (:foreground ,blue-alt
                                 :slant italic))))
   `(font-lock-keyword-face ((t (:foreground ,magenta
                                 :weight bold))))
   `(font-lock-string-face ((t (:foreground ,cyan))))
   `(font-lock-function-name-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,blue))))
   `(font-lock-warning-face ((t (:foreground ,green
                                 :weight bold)))) ; for warnings

   ;; UI elements
   `(mode-line ((t (:background "#274060"
                    :foreground ,fg))))
   `(mode-line-inactive ((t (:background "#1B1F36"
                             :foreground ,blue-alt))))
   `(line-number ((t (:foreground ,blue-alt))))
   `(line-number-current-line ((t (:foreground ,magenta
                                   :weight bold))))

   ;; Search & navigation
   `(isearch ((t (:background ,green
                  :foreground "white"
                  :weight bold))))
   `(lazy-highlight ((t (:background ,blue
                         :foreground "white"))))

   ;; Parentheses matching
   `(show-paren-match ((t (:background ,magenta
                           :foreground "white"
                           :weight bold))))
   `(show-paren-mismatch ((t (:background ,green
                              :foreground "white"
                              :weight bold))))))

(provide-theme 'varhammer)

;;; varhammer-theme.el ends here


