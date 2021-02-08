(require 'tabbar)

(tabbar-mode 1)

; 为了防止按键绑定被覆盖，采用针对tabbar-mode的方式进行绑定
(define-key tabbar-mode-map (kbd "M-j") 'tabbar-backward)
(define-key tabbar-mode-map (kbd "C-M-j") 'tabbar-backward-group)
(define-key tabbar-mode-map (kbd "M-k") 'tabbar-forward)
(define-key tabbar-mode-map (kbd "C-M-k") 'tabbar-forward-group)

;(global-set-key [(meta j)] 'tabbar-backward)
;(global-set-key [(control meta j)] 'tabbar-backward-group)
;(global-set-key [(meta k)] 'tabbar-forward)
;(global-set-key [(control meta k)] 'tabbar-forward-group)

;;set group strategy
(defun tabbar-buffer-groups ()
  "tabbar group"
  (list
   (cond
    ((memq major-mode '(shell-mode sh-mode eshell-mode cider-mode cider-repl-mode))
     "shell"
     )
    ((memq major-mode '(c-mode c++-mode))
     "cc"
     )
    ((memq major-mode '(dired-mode ibuffer-mode))
     "files"
     )
    ((eq major-mode 'python-mode)
     "python"
     )
    ((eq major-mode 'ruby-mode)
     "ruby"
     )
    ((memq major-mode
	   '(web-mode nxml-mode nxhtml-mode typescript-mode))
     "WebDev"
     )
    ((eq major-mode 'emacs-lisp-mode)
     "EmacsLisp"
     )
    ((eq major-mode 'lisp-mode)
     "Lisp"
     )
    ((eq major-mode 'clojure-mode)
     "Clojure"
     )
    ((memq major-mode
	   '(tex-mode latex-mode text-mode snippet-mode org-mode moinmoin-mode markdown-mode))
     "Text"
     )
    ((string-equal "*" (substring (buffer-name) 0 1))
     "emacs"
     )
    (t
     "other"
     )
    )))
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

;;;; 设置tabbar外观
;; 设置默认主题: 字体, 背景和前景颜色，大小
(set-face-attribute 'tabbar-default nil
                    :family "Menlo";"Comic Sans MS"
                    :background "gray30"
                    :foreground "#dcdccc"
                    :height 0.8;1.0
                    )

;; 设置左边按钮外观：外框框边大小和颜色
(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :box '(:line-width 1 :color "gray25")
                    )
(set-face-attribute 'tabbar-separator nil
                    :inherit 'tabbar-default
                    :foreground "blue"
                    :background "red"
                    :box '(:line-width 1 :color "red" :style 'released-button)
                    )
(setq tabbar-separator-value " ")
(setq tabbar-separator (list 0.5))

;; 设置当前tab外观：颜色，字体，外框大小和颜色
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :foreground "gray77" 
                    :background "gray38"
                    :box '(:line-width 2 :color "gray38" :style 'pressed-button)
                    :weight 'normal;'bold
                    )
;; 设置非当前tab外观：外框大小和颜色
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :foreground "grey55"
                    :background "gray22"
                    :box '(:line-width 2 :color "gray32" :style 'released-button)
                    )

(set-face-attribute 'tabbar-modified nil
                    :inherit 'tabbar-default
                    :foreground "OrangeRed4"
                    :slant 'italic
                    :background "gray22"
                    :box '(:line-width 2 :color "gray32" :style
                    'released-button) )

(set-face-attribute 'tabbar-selected-modified nil
                    :inherit 'tabbar-default
                    :foreground "DarkOrange3" ;
                    :slant 'italic
                    :background "gray38"
                    :box '(:line-width 2 :color "gray38" :style 'pressed-button)
                    :weight 'normal
                    )


;; cancel grouping
;;(setq tabbar-buffer-groups-function
;;    (lambda (b) (list “All Buffers”)))
;;(setq tabbar-buffer-list-function
;;    (lambda ()
;;        (remove-if
;;          (lambda(buffer)
;;             (find (aref (buffer-name buffer) 0) ” *”))
;;          (buffer-list))))
;; -------------------- tabbar --------------------


(provide 'init-tabbar)
 
