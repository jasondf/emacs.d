
(custom-set-faces
 '(eshell-ls-archive ((t (:foreground "Orchid" :weight normal))))
 '(eshell-ls-clutter ((t (:foreground "OrangeRed" :weight normal))))
 '(eshell-ls-directory ((t (:foreground "SkyBlue" :weight normal))))
 '(eshell-ls-executable ((t (:foreground "Green" :weight normal))))
 '(eshell-ls-missing ((t (:foreground "Red" :weight normal))))
 '(eshell-ls-special ((t (:foreground "Magenta" :weight normal))))
 '(eshell-ls-symlink ((t (:foreground "blue" :weight normal))))
 '(eshell-prompt ((t (:foreground "DarkOrange" :slant normal :weight normal :width condensed))))
 )

(setq eshell-prompt-function
      (lambda ()
        (concat
         (propertize "\n" 'face `(:foreground "green"))
         (propertize "┌─" 'face `(:foreground "RoyalBlue")) ;"┌─["
        ; (propertize (format-time-string "%H:%M" (current-time)) 'face `(:foreground "gray40"))
         (propertize "─(" 'face `(:foreground "RoyalBlue")) ;"]-("
         (propertize (user-login-name) 'face `(:foreground "firebrick"))
         (propertize "@" 'face `(:foreground "chocolate"))
         (propertize (system-name) 'face `(:foreground "firebrick"))
         (propertize ")-[" 'face `(:foreground "RoyalBlue"))
         ;(propertize (concat (eshell/pwd)) 'face `(:foreground "DarkGrey"))
         (propertize (replace-regexp-in-string (getenv "HOME") "~" (eshell/pwd)) 'face `(:foreground "DarkGrey"))
         (propertize "]\n" 'face `(:foreground "RoyalBlue"))
         (propertize "└─" 'face `(:foreground "RoyalBLue")) ;"└─>"
         (propertize (if (= (user-uid) 0) " #" " $") 'face `(:foreground "ForestGreen"))
         (propertize " " 'face `(:foreground "DarkGrey")))))


(defun eshell/cls ()
  "clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; (set-face-attribute 'eshell-ls-directory nil :weight 'normal :foreground "firebrick")


;;      (eshell-prompt ((t (:inherit zenburn-strong-1-face))))
;;      (eshell-ls-archive ((t (:foreground ,zenburn-red-1 :weight bold))))
;;      (eshell-ls-backup ((t (:inherit font-lock-comment))))
;;      (eshell-ls-clutter ((t (:inherit font-lock-comment))))
;;      (eshell-ls-directory ((t (:foreground ,zenburn-blue+1 :weight bold))))
;;      (eshell-ls-executable ((t (:foreground ,zenburn-red+1 :weight bold))))
;;      (eshell-ls-unreadable ((t (:foreground ,zenburn-fg))))
;;      (eshell-ls-missing ((t (:inherit font-lock-warning))))
;;      (eshell-ls-product ((t (:inherit font-lock-doc))))
;;      (eshell-ls-special ((t (:inherit zenburn-strong-1-face))))
;;      (eshell-ls-symlink ((t (:foreground ,zenburn-cyan :weight bold))))

(provide 'set-eshell)
