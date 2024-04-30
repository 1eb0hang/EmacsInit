(load-file "./share.el")

;; Put cursor on "mode-line-format" and enter C-h v for more help
(setq-default mode-line-format
	      '("%e"
		(:eval 
		  (format "BUFFER: %s" (propertize (buffer-name) 'face 'error)))
		))

;; To get text faces(colours) type M-x list-faces-display
(propertize (buffer-name) 'face 'error)

;; #############################################################
;; THIS IS THE DEFAULT MODELINE
(setq mode-line-format 
      '("%e"
	mode-line-front-space
	mode-line-mule-info
	mode-line-client
	mode-line-modified
	mode-line-remote
	mode-line-frame-identification
	mode-line-buffer-identification
	" "
	mode-line-position
	(vc-mode vc-mode)
	" "
	mode-line-modes mode-line-misc info mode-line-end-spaces))

;; %b is the same as buffer-name
;; The modeline setting below shows the file name of the buffer,
;;   and when mouse hovers over, buffer-file-name is shown in mini buffer
(setq mode-line-format
      (list
       '(:propertize "%b" help-echo (buffer-file-name))
       ))

(setq mode-line-format
      '(:eval
       (list
	'(:propertize "%b" help-echo (buffer-file-name))
       )))

;; setq only effects  current buffer
;; to set all buffers automatically use "setq-default"

;; Modeline info
;;   - file icon (coloured if modified)
;;   - current file name
;;   - filel inmber and column
;;   - Major-mode
;;   - git branch

(setq mode-line-format
	      '("%e"
		" " ;; TODO : icon
		"%b"
		"  "
		"%l"
		":"
		;; (:eval 
		;;  (number-to-string (+ (string-to-number "%c") 1)))
		"%c"
		"  "
		mode-name
		"  "
		(vc-mode vc-mode)
))


