;(add-to-list 'load-path (expand-file-name "elpa/smex" user-emacs-directory))

(require 'smex)

(smex-auto-update 60)

(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))

(smex-initialize) 

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(provide 'init-smex)

 
