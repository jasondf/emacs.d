
(require 'neotree)

(setq neo-theme 'nerd) ;classic, ascii, arrow, nerd

(setq neo-show-hidden-files t)

(setq neo-smart-open t)

(setq neo-dont-be-alone t)

(set-face-attribute 'neo-root-dir-face nil :weight 'normal :foreground "firebrick")

(set-face-attribute 'neo-file-link-face nil :foreground "DimGrey")

(set-face-attribute 'neo-dir-link-face nil :foreground "SteelBlue4");cyan4

(set-face-attribute 'neo-expand-btn-face nil :foreground "RoyalBlue3")

(set-face-attribute 'neo-header-face nil :foreground "RoyalBlue3")

(set-face-attribute 'neo-root-dir-face nil :foreground "dark red" :weight 'normal)

(setq default-directory "~/")

(global-set-key [(f8)] 'neotree-toggle)

;; (defadvice neo-buffer--create (after enable-hl-cur-line activate)
;;   (highlight-current-line-minor-mode t)
;;   (setq cursor-type 'bar));

(add-hook 'neo-after-create-hook
          '(lambda (window)
             (highlight-current-line-minor-mode t)
             (setq cursor-type '(bar . 2)))) 	;(setq cursor-type '(bar . 4)) bar width
                                        ;nil, no cursor

(defadvice neo-buffer--get-nodes
    (after neo-buffer--get-nodes-new-sorter activate)
  (setq ad-return-value
        (let ((nodes ad-return-value)
              (comparator (lambda (s1 s2) (string< (downcase s1)
                                              (downcase s2)))))
          (apply 'cons (mapcar (lambda (x) (sort (apply x (list nodes))
                                            comparator))
                               '(car cdr))))))

(provide 'init-neotree)

 
