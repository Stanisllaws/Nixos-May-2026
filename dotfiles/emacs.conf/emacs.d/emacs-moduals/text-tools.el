;; Ensure pdf-tools is initialized (install/compile handled elsewhere)




(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))

(with-eval-after-load 'pdf-view
  (add-to-list 'pdf-view-incompatible-modes 'display-line-numbers-mode))
(pdf-tools-install)

(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))

(with-eval-after-load 'pdf-view
  (add-to-list 'pdf-view-incompatible-modes 'display-line-numbers-mode))
