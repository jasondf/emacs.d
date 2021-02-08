

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

; 定义符号键绑定
(add-hook 'cider-repl-mode-hook 'my-key-bindings)

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
;; (setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook #'paredit-mode)

; 设置高亮颜色
(defun cider-font-settings ()
  (set-face-foreground 'cider-repl-prompt-face "DarkGoldenrod")
  )

(add-hook 'cider-repl-mode-hook 'cider-font-settings)







(provide 'init-cider)
