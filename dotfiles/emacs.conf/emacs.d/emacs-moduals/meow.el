(add-to-list 'load-path "~/.emacs.d/emacs-moduals/meow") 
;;<define your meow-setup>
(require 'meow)
;;(meow-setup)
(meow-global-mode 1)

;; MEOW KEY MAPING
(global-set-key (kbd "C-c i") 'meow-insert)
(global-set-key (kbd "C-c v") 'meow-visual-line)
(global-set-key (kbd "C-c e") 'eval-last-sexp)

;; MEOW AUTO DEFUALT INSERT MODE
(setq meow-usecursor-position-hack t)
(add-hook 'find-file-hook 'meow-insert)

 
 
 
																		
