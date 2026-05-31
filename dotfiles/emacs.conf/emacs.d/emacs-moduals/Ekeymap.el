;; MY STANDARD STANDART EMACS KEYBINDS NO-MEOW
(global-set-key (kbd "C-c RET") 'dired )
(global-set-key (kbd "C-c w") 'write-file) 

(global-set-key (kbd "C-c W") 'save-buffer )
(global-set-key (kbd "C-c .") 'dired-jump )
(global-set-key (kbd "C-c t") 'shell-command) 
(global-set-key (kbd "C-c T") 'vterm ) 
(global-set-key (kbd "C-c f") ' find-file  ) 
(global-set-key (kbd "M-;") ' meow-keypad  ) 
(global-set-key (kbd "C-c u") ' undo)
(global-set-key (kbd "C-c n") ' redo)
(global-set-key (kbd "C-c s") 'search)
(global-set-key (kbd "M-h") ' meow-left)
(global-set-key (kbd "M-j") ' meow-next)
;;(global-set-key (kbd "M-k") ' meow-prev)
;;(global-set-key (kbd "C-;") 'meow-normal)
(global-set-key (kbd "M-l") ' meow-right)
(global-set-key (kbd "C-c R") ' recover-session)
(global-set-key (kbd "C-c c g") ' magit-status)
(global-set-key (kbd "C-c F")' make-directory)
(global-set-key (kbd "C-c y d")' copy-directory)
(global-set-key (kbd "C-c y f")' copy-file)
;; (meow-normal-definde-key

;; '(global-set-key (kbd "M-l") ' meow-right))

;; NORMAL MODE KEYS (with Meow)
(with-eval-after-load 'meow
  (define-key meow-normal-state-keymap "h" #'meow-left)
  (define-key meow-normal-state-keymap "j" #'meow-next)
  (define-key meow-normal-state-keymap "k" #'meow-prev)
  (define-key meow-normal-state-keymap "l" #'meow-right)
  (define-key meow-normal-state-keymap "," #'beginning-of-buffer)
  (define-key meow-normal-state-keymap "." #'end-of-buffer)
  (define-key meow-normal-state-keymap "gg" #'beginning-of-buffer)
  (define-key meow-normal-state-keymap "G" #'end-of-buffer)
  (define-key meow-normal-state-keymap "u" #'undo)
  (define-key meow-normal-state-keymap "n" #'undo-redo)
  (define-key meow-normal-state-keymap "v" #'meow-visual-line)
  (define-key meow-normal-state-keymap "i" #'meow-insert)
  (define-key meow-normal-state-keymap "/" #'rgrep)
 ;; (define-key meow-normal-state-keymap "d" #'dired)
  (define-key meow-normal-state-keymap "b" #'ibuffer)
  )

(with-eval-after-load 'meow
  (define-key meow-keypad-state-keymap "B" #'ibuffer)
  (define-key meow-keypad-state-keymap "K" #'kill-buffer)
  (define-key meow-keypad-state-keymap "g" #'magit-status)
  (define-key meow-keypad-state-keymap "L" #'sly-mrepl-clear-repl)
  ;;(define-key meow-keypad-state-keymap ":" #'meow-normal-state)
  )


;; MAGIT KEY BINDS
(with-eval-after-load 'magit
(define-key magit-mode-map (kbd "M-s") 'magit-stage)   
(define-key magit-mode-map (kbd "M-c") 'magit-commit)
(define-key magit-mode-map (kbd "M-u") 'magit-pull)
(define-key magit-mode-map (kbd "M-p") 'magit-push)
;(define-key magit-mode-map (kbd " c") 'magit-commit)   
)


