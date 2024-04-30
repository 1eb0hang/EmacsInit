(load-file "./share.el")

(add-to-list 'image-load-path (concat current-dir "Fonts/Icons/fether(1)"))

;; define-icon name parent specs doc &rest keywords 
;; (define-icon outline-open button
;;   '((image "right.svg" "open.xpm" "open.pbm" :height line)
;;     (emoji "▶️")
;;     (symbol "▶" "➤")
;;     (text "open" :face icon-button))
;;   "Icon used for buttons for opening a section in outline buffers."
;;   :version "29.1"
;;   :help-echo "Open this section")

(define-icon file-icon button
  '((image "file.svg" :hieght line)
    (text "file" :face icon-button))
  "This is just an example icon made for learning purposes"
  :version "1.0"
  :help-echo "File-icon")
