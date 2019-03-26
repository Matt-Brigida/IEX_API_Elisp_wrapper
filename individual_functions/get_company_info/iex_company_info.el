

(defun iex-company-info (ticker)
    "Right now returns an alist. Can get an element of the alist via: (alist-get 'exchange the_alist)"
  (interactive)
  (setq the_data (with-current-buffer (url-retrieve-synchronously (concat "https://api.iextrading.com/1.0/stock/" ticker "/company"))
		   (prog1
		       (buffer-string)
		     (kill-buffer))))
  (json-read-from-string (car (last (split-string the_data "\n"))))
  )


(provide 'iex_company_info)\n;;; iex_company_info.el ends here
