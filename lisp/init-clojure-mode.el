

; 定义符号绑定，输入符号时不必切换输入法
; 编写程序的时候基本不需要汉字标点符号
(defun my-key-bindings ()
  (local-set-key "＊" (kbd "*"))
  (local-set-key "－" (kbd "-"))
  (local-set-key "＋" (kbd "+"))
  (local-set-key "｜" (kbd "|"))
  (local-set-key "／" (kbd "/"))
  (local-set-key "＃" (kbd "#"))
  (local-set-key "＝" (kbd "="))
  (local-set-key "——" (kbd "_"))
  (local-set-key "％" (kbd "%"))
  (local-set-key "［" (kbd "["))
  (local-set-key "］" (kbd "]"))
  (local-set-key "｛" (kbd "{"))
  (local-set-key "｝" (kbd "}"))
  (local-set-key "（" (kbd "("))
  (local-set-key "）" (kbd ")"))
  (local-set-key "“" (kbd "\""))
  (local-set-key "”" (kbd "\""))
  (local-set-key "‘" (kbd "'"))
  (local-set-key "’" (kbd "'"))
  (local-set-key "｀" (kbd "`"))
  (local-set-key "～" (kbd "~"))
  ;; (local-set-key "，" (kbd ","))
  ;; (local-set-key "。" (kbd "."))
  ;; (local-set-key "《" (kbd "<"))
  ;; (local-set-key "》" (kbd ">"))
  ;; (local-set-key "——" (kbd "_"))
  ;; (local-set-key "！" (kbd "!"))
  ;; (local-set-key "？" (kbd "?"))
  ;; (local-set-key "¥" (kbd "$"))
  ;; (local-set-key "：" (kbd ":"))
  ;; (local-set-key "；" (kbd ";"))
  ;; 在CIDER中,"@"和"&"这两个符号不能重定义
  ;; 实际上也没必要,因为汉字和英文的两个符号是一样的
  ;; (local-set-key "&"  (kbd "&"))
  ;; (local-set-key "@"  (kbd "@"))
  )

; Enable paredit for Clojure
(add-hook 'clojure-mode-hook #'paredit-mode)
; 定义符号键绑定(clojure-mode会使用CIDER模式中的键绑定，此处其实不会生效)
(add-hook 'clojure-mode-hook 'my-key-bindings)

; Enable paredit for Emacs Lisp
(add-hook 'emacs-lisp-mode-hook #'paredit-mode)
; 定义符号键绑定
(add-hook 'emacs-lisp-mode-hook 'my-key-bindings)

; Enable paredit for Lisp
(add-hook 'lisp-mode-hook #'paredit-mode)
; 定义符号键绑定
(add-hook 'lisp-mode-hook 'my-key-bindings)

(require 'clojure-mode-extra-font-locking)

; 设置高亮颜色
(defun clojure-font-settings ()
  (set-face-foreground 'clojure-interop-method-face "red") ;不起作用
  (set-face-foreground 'clojure-keyword-face "MediumAquamarine") 
  (set-face-foreground 'clojure-character-face "DarkSalmon")
  )

(add-hook 'clojure-mode-hook 'clojure-font-settings)

; "("之后的作为keyword处理
;; (add-hook 'clojure-mode-hook
;;           '(lambda ()
;;              (font-lock-add-keywords
;;                 nil
;;                 '(("(\\(\\w+\\)\\s-+" 1 font-lock-keyword-face)))))

;; Use clojure mode for other extensions
;; (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
;; (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
;; (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
;; (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

(provide 'init-clojure-mode)


