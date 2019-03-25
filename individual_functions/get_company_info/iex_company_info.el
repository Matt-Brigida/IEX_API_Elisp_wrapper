

(defun iex-company-info (ticker)
  (interactive)
  (setq the_data (with-current-buffer (url-retrieve-synchronously (concat "https://api.iextrading.com/1.0/stock/" ticker "/company"))
		   (prog1
		       (buffer-string)
		     (kill-buffer))))
  (car (last (split-string the_data "\n")))
  )
