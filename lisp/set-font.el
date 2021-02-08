
;分别设置中英文字体的大小，让一个中文字符所占的宽度等于两个英文字符的宽度
;从而避免org-mode中英文混编时表格对齐问题
(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

;根据屏幕分辨率设置字体(此方法仅在启动时有效，在显示屏间拖动frame的时候无效)
;Display Resolution: MBP 13" 2560*1600 / MBP 15" 2880*1800
;MBP 15": (x-display-pixel-height)=>2130; (x-display-pixel-width)=>1920
;MBP 13": (x-display-pixel-height)=>800; (x-display-pixel-width)=>1280
;所以设置为：只要有一个像素值超过2000，即采用大字体
(when window-system
  (if (or
       (> (x-display-pixel-height) 2000)
       (> (x-display-pixel-width) 2000)) 
      (set-font "Monaco" "STFangSong" 16 20)
    (set-font "Monaco" "STFangSong" 14 16)))

;新建frame时候的颜色设置
(setq default-frame-alist  (append '((background-color . "gray15") (foreground-color . "DarkGrey") (cursor-color . "Green") (mouse-color . "DarkGrey")) default-frame-alist))

;设置文字与背景颜色
(set-foreground-color "DarkGrey")
(set-background-color "gray15")
(set-cursor-color "Green")
(set-mouse-color "DarkGrey")

;高亮时
(set-face-foreground 'highlight "DarkGrey")
(set-face-background 'highlight "green")

;选中文字时
(set-face-foreground 'region "GhostWhite")
(set-face-background 'region "slate gray")

;按住Meta键选择第二个块。
(set-face-foreground 'secondary-selection "GhostWhite")
(set-face-background 'secondary-selection "steel blue")

;设置编程常用颜色
(set-face-foreground 'font-lock-keyword-face "SteelBlue") 
(set-face-foreground 'font-lock-function-name-face "CornflowerBlue") 
(set-face-foreground 'font-lock-variable-name-face "goldenrod")
(set-face-foreground 'font-lock-builtin-face "ForestGreen")
(set-face-foreground 'font-lock-string-face "DarkSalmon")
(set-face-foreground 'font-lock-type-face "DarkOliveGreen")

(provide 'set-font)
