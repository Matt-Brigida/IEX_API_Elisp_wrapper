(defun iex-book (ticker)
  "Right now returns an alist."
  (interactive)
  (setq the_data (with-current-buffer (url-retrieve-synchronously (concat "https://api.iextrading.com/1.0/stock/" ticker "/book"))
		   (prog1
		       (buffer-string)
		     (kill-buffer))))
  (json-read-from-string (car (last (split-string the_data "\n"))))
  )


