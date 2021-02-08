
;org mode自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
                                        ;visual-line-mode
                                        ;word-wrap
                                        ;truncate-lines
                                        ;global-visual-line-mode




;保留单个换行（导出至其它格式时不必要两个换行符才表示换行）
(setq org-export-preserve-breaks t)

;可以直接打开和显示图片
(setq auto-image-file-mode t)
;自动在文档中显示图片
(setq org-startup-with-inline-images t)

;按已有语言高亮方案显示代码(在emacs中)
(add-hook 'org-mode-hook (lambda () (setq org-src-fontify-natively t)))

;导出为html文件中的代码片段采用emacs中的高亮方案(在浏览器中)
(require 'htmlize)

;文档按大纲缩进显示
(setq org-startup-indented t)
;启动时显示全部内容
;(setq org-startup-folded nil)

;导出文档时对'^'和'_'后面'{}'中的内容进行上下角标转义，即，H_{2}O会输出为水的分子式，而H_2O保持原样输出；'^'转义操作相同。
(setq org-export-with-sub-superscripts '{})

;导出设置
;导出为html5格式
(setq org-html-doctype "html5")
;不生成XML头信息
(setq org-html-xml-declaration nil)
;不生成末尾的文档信息
(setq org-html-postamble nil)
;默认引用存储在rawgit上的css
;(setq org-html-head "<link rel='stylesheet' type='text/css' href='https://cdn.rawgit.com/jasondf/emacs.d/a2444d2c/css/org-mode.css' />")
;jsDelivr
(setq org-html-head "<link rel='stylesheet' type='text/css' href='https://cdn.jsdelivr.net/gh/jasondf/emacs.d@a2444d2c2a186c53572760fdf6bca332c9d39aa2/css/org-mode.css' />")
;加载本目录下的css
;(setq org-html-head "<link rel='stylesheet' type='text/css' href='./org-mode.css'/>")

;设置导出文件的默认语言为简体中文
(setq org-export-default-language "zh-CN")

;强制导出为utf-8
(setq org-export-coding-system 'utf-8)

;设置导出目录为两层
;(setq org-export-with-section-numbers 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;将当前位置保存为链接，在之后使用“C-c C-l”创建链接的操作中可以直接使用
(global-set-key (kbd "C-c l") 'org-store-link)

;显示日程列表操作
(global-set-key (kbd "C-c a") 'org-agenda)

;Org capture
(global-set-key (kbd "C-c c") 'org-capture)

;在org模式的buffer之间切换
(global-set-key (kbd "C-c b") 'org-iswitchb)

; C-c [，将当前org文件加入待办事项文件列表
; C-c ]，将当前org文件从待办事项文件列表中删除



(defun my-key-bindings ()
  ;定义章节、列表项或表格时不必切换输入法
  (define-key org-mode-map (kbd "＊") (kbd "*"))
  (define-key org-mode-map (kbd "－") (kbd "-"))
  (define-key org-mode-map (kbd "＋") (kbd "+"))
  (define-key org-mode-map (kbd "｜") (kbd "|"))
  (define-key org-mode-map (kbd "／") (kbd "/"))
  (define-key org-mode-map (kbd "＃") (kbd "#"))
  (define-key org-mode-map (kbd "＝") (kbd "="))
  (define-key org-mode-map (kbd "——") (kbd "_"))
  (define-key org-mode-map (kbd "&") (kbd "&"))
  (define-key org-mode-map (kbd "％") (kbd "%"))
  (define-key org-mode-map (kbd "@") (kbd "@"))
  (define-key org-mode-map (kbd "（") (kbd "("))
  (define-key org-mode-map (kbd "）") (kbd ")"))
  (define-key org-mode-map (kbd "［") (kbd "["))
  (define-key org-mode-map (kbd "］") (kbd "]"))
  (define-key org-mode-map (kbd "｛") (kbd "{"))
  (define-key org-mode-map (kbd "｝") (kbd "}"))
  (define-key org-mode-map (kbd "｀") (kbd "`"))
  (define-key org-mode-map (kbd "～") (kbd "~"))
  ;删除至当前mode的行首缩进位置，之前被绑定为org-return-indent
  (define-key org-mode-map (kbd "C-j") (lambda()
                                         (interactive)
                                         (kill-line 0)
                                     (indent-according-to-mode)))
  )

(add-hook 'org-mode-hook 'my-key-bindings)

;在org模式下直接截图并插入文档中
(defun my-org-screenshot (basename)
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive "sScreenshot name: ")
  (if (equal basename "")
      (setq basename (format-time-string "%Y%m%d_%H%M%S")))
  (setq filename
        (concat (file-name-directory (buffer-file-name))
                ;"imgs/"
                (file-name-base (buffer-file-name))
                "_"
                basename
                ".png"))
  (call-process "screencapture" nil nil nil "-s" filename)
  (insert "#+CAPTION:")
  (insert basename)
  (insert "\n")
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))

;将截图功能绑定至F10键 
(global-set-key [(f10)] 'my-org-screenshot)

;; (set-face-attribute 'org-level-1 nil :height 1.6 :bold t)
;; (set-face-attribute 'org-level-2 nil :height 1.4 :bold t)
;; (set-face-attribute 'org-level-3 nil :height 1.2 :bold t)

(provide 'init-org)

 
