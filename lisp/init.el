;; (add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; Add all first level sub-directories under "lisp", "site-lisp" and "elpa"
;; to load-path, that's where packages will be located. Thus I don't have to
;; set the variable 'load-path' everytime in init-xxx.el file.
(dolist (dirname '("lisp" "site-lisp" "elpa"))
  ;Add "top" level
  (let ((tdir (concat user-emacs-directory dirname)))
    (add-to-list 'load-path tdir) 
    ;Add first level under "top"
    (setf default-directory tdir) ;Must set this, check: emacswiki.org/emacs/LoadPath#toc2
    (dolist (d (directory-files tdir))
      (when (and (file-directory-p d)
                 (not (equal d ".."))
                 (not (equal d ".")))
        (add-to-list 'load-path (concat tdir "/" d))))))

(require 'set-default)

(require 'set-font)

(require 'set-hotkey)

(require 'set-env-var)

(require 'set-eshell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 功能模块 ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-smex) ;使用M-x输入命令时进行匹配

(require 'init-tabbar) ;以tab列表的方式显示buffer

(require 'init-melpa) ;包管理工具

(require 's) ;字符串操作工具包

(require 'init-highlight-parentheses) ;高亮显示匹配括号

(require 'init-highlight-current-line) ;在neotree中使用，标示当前位置

(require 'init-neotree) ;文件目录导航栏

(require 'init-org) ;Org模式

(require 'init-web-mode) ;Web开发相关语言的模式，html、js等

(require 'init-typescript-mode) ;typescript模式

(require 'init-clojure-mode) ;Clojure语言主模式

(require 'init-cider) ;Clojure Interactive Development Environment that Rocks

;(require 'init-yasnippet) ;代码编辑的模板管理

(require 'init-emms) ;音乐播放


;pkg-info ;CIDER需要

;epl ;pkg-info需要

;queue ;CIDER需要

;seq ;CIDER需要

;spinner ;CIDER需要

;macrostep ;slime需要

;paredit ;编辑Lisp语言时自动维护括号的一致性

;exec-path-from-shell ;设置emacs的可执行目录时使用，不需要额外配置

;htmlize ;M-x htmlize-buffer时使用，将在新buffer中显示转为html的文档，不需要额外配置

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init)
