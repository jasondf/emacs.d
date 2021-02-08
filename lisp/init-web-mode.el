;(add-to-list 'load-path (expand-file-name "site-lisp/web-mode" user-emacs-directory))


(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))

(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("angular" . "\\.js\\'")
	    ("angular" . "\\.html\\'")))

;(setq web-mode-engines-alist '(("php" . "\\.html\\'")))
;To load php engine when open a html file.
;e.g. make a php block syntax highlight in a html file



;php faces
(set-face-attribute 'web-mode-keyword-face nil :foreground "DarkTurquoise")
(set-face-attribute 'web-mode-variable-name-face nil :foreground "DarkKhaki")
(set-face-attribute 'web-mode-block-string-face nil :foreground "Chocolate")
(set-face-attribute 'web-mode-function-call-face nil :foreground "LightGreen")
(set-face-attribute 'web-mode-function-name-face nil :foreground "LightGreen")
(set-face-attribute 'web-mode-comment-face nil :foreground "DimGray")
(set-face-attribute 'web-mode-block-delimiter-face nil :foreground "DarkRed")

;html faces
(set-face-attribute 'web-mode-html-tag-face nil :foreground "SlateGray")
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "SlateGray")
(set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "SlateGray")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "Brown")
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "Sienna")

;web-mode-html-tag-custom-face
;web-mode-html-entity-face
;web-mode-html-attr-engine-face
;web-mode-html-attr-custom-face

;(setq web-mode-comment-style 2)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-indent-style 2)

;Enable auto expanding
;; (eval-after-load "web-mode"
;;   '(setq web-mode-enable-auto-expanding t))

(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-auto-pairing t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;For Yasnippet, set correct mode before press 'tab' to expand snippets.
(defadvice yas-expand-from-trigger-key (before web-mode-before-yas-expand activate)
  (run-hooks 'web-mode-cur-language-mode-hook))

(add-hook 'web-mode-cur-language-mode-hook
          '(lambda ()
             (let ((web-mode-cur-language
                    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
                   (yas-activate-extra-mode 'php-mode)
                 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "html")
                    (yas-activate-extra-mode 'html-mode)
                  (yas-deactivate-extra-mode 'html-mode))
               )))

(setq web-mode-enable-current-element-highlight t)

(provide 'init-web-mode)
 
