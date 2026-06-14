
(defun killb ()
  (interactive)
  (mapc #'kill-buffer (delq (current-buffer) (buffer-list))))
