

;; The deafualt mode line
;; Put cursor on "mode-line-format" and enter C-h v for more help
(setq-default mode-line-format
	      '("%e"
		(:eval 
		  (format "BUFFER: %s" (propertize (buffer-name) 'face 'error)))
		))

;; To get text faces(colours) type M-x list-faces-display
(propertize (buffer-name) 'face 'error)
