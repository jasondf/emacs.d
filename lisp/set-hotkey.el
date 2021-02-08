 
;移动至本行第一个非空字符，而不是至行首
(global-set-key (kbd "C-a") 'back-to-indentation)

;移动至行首。将C-a与M-m所绑定的命令互换了一下
(global-set-key (kbd "M-m") 'move-beginning-of-line)

;删除至行首
(global-set-key (kbd "C-<backspace>") (lambda()
                                        (interactive)
                                        (kill-line 0)))

;删除至当前mode的行首缩进位置
(global-set-key (kbd "C-j") (lambda()
                              (interactive)
                              (kill-line 0)
                              (indent-according-to-mode)))

;重新读取文件至buffer
(defun refresh-file ()  
  (interactive)  
  (revert-buffer t (not (buffer-modified-p)) t))  
  
(global-set-key [(f5)] 'refresh-file)

;保存最近打开文件列表
(recentf-mode 1)
;设置F7为列示最近打开的文件
(global-set-key (kbd "<f7>") 'recentf-open-files)

;使用滚轮或触摸板滑动缩放字体。
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;;鼠标滚轮，默认的滚动太快，这里改为1行
(defun up-slightly () (interactive) (scroll-up 1))
(defun down-slightly () (interactive) (scroll-down 1))
(global-set-key [wheel-up] 'down-slightly)
(global-set-key [wheel-down] 'up-slightly)

;使用EMMS播放音乐列表
(global-set-key (kbd "C-x m") 'emms-play-playlist)

;如果你正在编辑一个东西（在位置A），突然想到别的某处（位置B）要修改或查看或别的，总之你要过去看看，你可以用C-.来在当前位置做个标记，然后去你想去的地方B，看了一会你觉的我可以回A去了，用C-,就回到刚才做标记的地方A，再用C-,又会回到B 
(global-set-key (kbd "C-.") 'ska-point-to-register) ;(kbd "C->") was [(control ?.)]
(global-set-key (kbd "C-,") 'ska-jump-to-register) ;[(control ?\,)]

(defun ska-point-to-register() 
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position." 
  (interactive) 
  (setq zmacs-region-stays t) 
  (point-to-register 8)) 

(defun ska-jump-to-register() 
  "Switches between current cursorposition and position 
that was stored with ska-point-to-register." 
  (interactive) 
  (setq zmacs-region-stays t) 
  (let ((tmp (point-marker))) 
    (jump-to-register 8) 
    (set-register 8 tmp))) 


;智能注释。使用M-;进行注释操作。如果有选中区域则注释／反注释选中区域；如果没有选中区域，且光标不在行尾，则注释／反注释当前行；如果处于行尾，则在行尾添加注释。
(defun smart-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'smart-comment-dwim-line)

;回到之前的窗口布局设置 C-c <-（左箭头）
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings))

;代码格式化
;(defun indent-buffer ()
;"Indent the whole buffer."
;(interactive)
;(save-excursion
;(indent-region (point-min) (point-max))))

;(global-set-key [f7] 'indent-buffer)


;设置eshell激活快捷键
(global-set-key (kbd "C-z") 'eshell)
;使eshell可以进行tab补全
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

(setq eshell-cmpl-cycle-completions nil)

;; (global-set-key (kbd "M-p") 'comint-previous-matching-input-from-input)
;; (global-set-key (kbd "M-n") 'comint-next-matching-input-from-input)


(provide 'set-hotkey)
