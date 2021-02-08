;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;;; Emacs Configuration ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;  

;(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(parseedn parseclj highlight-indentation a epl company pyvenv guess-language elpy python-mode magit clojure-snippets clojure-mode-extra-font-locking s paredit cider clojure-mode htmlize yasnippet web-mode typescript-mode tabbar smex neotree highlight-parentheses highlight-current-line exec-path-from-shell emms)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-ls-archive ((t (:foreground "Orchid" :weight normal))))
 '(eshell-ls-clutter ((t (:foreground "OrangeRed" :weight normal))))
 '(eshell-ls-directory ((t (:foreground "SkyBlue" :weight normal))))
 '(eshell-ls-executable ((t (:foreground "Green" :weight normal))))
 '(eshell-ls-missing ((t (:foreground "Red" :weight normal))))
 '(eshell-ls-special ((t (:foreground "Magenta" :weight normal))))
 '(eshell-ls-symlink ((t (:foreground "blue" :weight normal))))
 '(eshell-prompt ((t (:foreground "DarkGoldenrod" :slant normal :weight normal :width condensed))))
 '(fringe ((t (:background "grey13" :foreground "gray40"))))
 '(linum ((t (:inherit (shadow default) :foreground "gray30" :height 0.8)))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init)  

(put 'dired-find-alternate-file 'disabled nil)
