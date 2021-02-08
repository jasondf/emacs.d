(menu-bar-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;去掉Emacs和gnus启动时的引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)
(setq inhibit-startup-echo-area-message "Jason Daifei")

;设置shell的位置
                                        ;(setq shell-file-name "/bin/bash")
(setq shell-file-name "/bin/zsh")


                                        ;设置标题栏
(setq frame-title-format
      (list                ;"[" '(:eval (projectile-project-name)) "]"
                                        ;" ψωETωψ ◎ "
       '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;设置用户信息
(setq user-full-name "Jason Daifei")
(setq user-mail-address "jason.daifei@iCloud.com")

;设置为中文简体语言环境
(setenv "LANG" "zh_CN.UTF-8")
(prefer-coding-system 'utf-8)
;(set-language-environment 'Chinese-gbk)
(set-language-environment 'utf-8) 
;(prefer-coding-system 'utf-8-auto)
(prefer-coding-system 'utf-8) 
;设置emacs使用 utf-8
(setq locale-coding-system 'utf-8)
;设置键盘输入时的字符编码
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
;文件默认保存为 utf-8
(set-buffer-file-coding-system 'utf-8)
(set-default buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;解决中文粘贴出现乱码的问题
(set-clipboard-coding-system 'utf-8)
;设置终端编码
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
;解决文件目录的中文乱码
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)

;解决Shell Mode下中文乱码问题
;; (defun change-shell-mode-coding ()
;;  (progn
;;    (set-terminal-coding-system 'utf-8)
;;    (set-keyboard-coding-system 'utf-8)
;;    (set-selection-coding-system 'utf-8)
;;    (set-buffer-file-coding-system 'utf-8)
;;    (set-file-name-coding-system 'utf-8)
;;    (modify-coding-system-alist 'process "*" 'utf-8)
;;    (set-buffer-process-coding-system 'utf-8 'utf-8)
;;    (set-file-name-coding-system 'utf-8)))
;; (add-hook 'shell-mode-hook 'change-shell-mode-coding)
;; (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
;; (setq ansi-color-for-comint-mode t)


;显示行号
(global-linum-mode t)

;显示列号
(setq column-number-mode t)

;不产生备份文件
(setq make-backup-files nil)

;不产生临时文件
(setq-default make-backup-files nil) 

;; 取消自动保存
(auto-save-mode 1)

;设置行距，5像素。
;(setq-default line-spacing 5)
(defun set-bigger-spacing ()
  (setq-local default-text-properties '(line-spacing 0.25 line-height 1.25)))
(add-hook 'text-mode-hook 'set-bigger-spacing)
(add-hook 'prog-mode-hook 'set-bigger-spacing)


;设置tab为4个空格
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
;HTML tab
(setq sgml-basic-offset 4)
(setq-default tab-width 4)
(setq tab-width 4)
;(setq default-tab-width 4)
;(setq indent-line-function 'insert-tab)
(setq tab-stop-list (number-sequence 4 200 4))

;设置日历
;设置所在地方的经纬度，calendar里有个功能是日月食的预测，和经纬度相联系的。
(setq calendar-latitude +31.22)
(setq calendar-longitude +121.48)
(setq calendar-location-name "Shanghai")
;;下面两个是设置年份为中国年，好像默认的是用英文写的，由王垠修改的。
(setq chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])
;在日历中突出标记节日和生日
;(setq mark-holidays-in-calendar t)
;打开calendar自动打开节日和生日列表
;(setq view-calendar-holidays-initially t)
;日历不和日记相连，我不用Calendar自带的diary记日记
(setq mark-diary-entries-in-calendar nil)

;设置时间显示格式
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 1)
(setq display-time-format "%02H:%02M %A %Y-%02m-%02d")

;设置默认主模式
(setq default-major-mode 'text-mode)

;自动换行时保持单词的完整
 ;(setq-default word-wrap t)
;visual-line-mode更合适一些
(global-visual-line-mode 1)

;设置subword模式
;即，调用M-b或C-<left>之类按词移动光标的命令时
;光标可以在驼峰式命名的词中按子词移动
(global-subword-mode 1) ; 1 for on, 0 for off

;使用ibuffer作为列示缓冲区的默认命令(C-x C-b)
(defalias 'list-buffers 'ibuffer) 

;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)

;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了
;个人感觉这个功能反倒会造成干扰，还是关闭吧
;(mouse-avoidance-mode 'animate)

;当指针到一个括号时，自动显示所匹配的另一个括号
(show-paren-mode 1)

;滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
	scroll-margin 3
	scroll-conservatively 10000)

;指针不要闪，我得眼睛花了
(blink-cursor-mode -1)

;显示临时选中区域
(transient-mark-mode 1)

;所有的问题用y/n方式，不用yes/no方式。有点懒，只想输入一个字母
(fset 'yes-or-no-p 'y-or-n-p)

;启用部分补全功能，如输入M-x q r r相当于M-x query-replace-regexp
;(partial-completion-mode 1)

;去掉烦人的警告铃声
(setq visible-bell t)

;没有提示音也不闪屏
(setq ring-bell-function 'ignore)

;语法高亮
(global-font-lock-mode t)

;使用aspell做拼写检查
;需要先安装"aspell": "$ brew install aspell"
;aspell 0.60.6.1能正常工作，而0.60.7-20170129不行
(setq-default ispell-program-name "aspell")
(setq ispell-dictionary "en_US")
(setq-default ispell-local-dictionary "en_US")
;(setq-default ispell-personal-dictionary "path/to/your/.ispell")

;设置buffer左右边缘的宽度，在.emacs中设置了其背景色。
(set-fringe-mode '(1 . 1))

;;禁止光标进入minibuffer的提示符内 don't let the cursor go into minibuffer prompt
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

; 设置窗口半透明
;; transform window
;; Anchor: March Liu (刘鑫) <march.liu@gmail.com>
;;
;; This is a script to set emacs window's alpha value.
;; It work well on windows xp and vista with EmacsWin32
;; useage: add below line in your .emacs
;;
;; you can define your alpha-list to set the transform combine
;; bind key with below code:
;;
(global-set-key [(f12)] 'loop-alpha)

(setq alpha-list '((92 86) (86 80) (80 74) (100 100) (98 92)))

(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
)
; 启动时为半透明窗口
(set-frame-parameter (selected-frame) 'alpha(list 98 92))

; 新建frame的时候为半透明窗口 
(add-hook 'after-make-frame-functions 
	(lambda (arg)
	""
	(set-frame-parameter (selected-frame) 'alpha(list 98 92))) t)


(provide 'set-default)




