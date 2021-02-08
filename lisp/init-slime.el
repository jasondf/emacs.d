;设置clisp位置
(setq inferior-lisp-program "/usr/local/Cellar/clisp/2.49/bin/clisp")

;加载slime
;(add-to-list 'load-path (expand-file-name "site-lisp/slime-2.13" user-emacs-directory))

;(require 'slime)

;使用M-x slime的时候自动加载
(require 'slime-autoloads)

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

(slime-setup)



(provide 'init-slime)
