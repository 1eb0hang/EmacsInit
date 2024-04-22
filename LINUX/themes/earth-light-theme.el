;;; earth-light-theme.el --- earth-light
;;; Version: 1.0
;;; Commentary:
;;; A theme called earth-light
;;; Code:

(deftheme earth-light "DOCSTRING for earth-light")
  (custom-theme-set-faces 'earth-light
   '(default ((t (:foreground "#0b0b0b" :background "#fffcef" ))))
   '(cursor ((t (:background "#000000" ))))
   '(fringe ((t (:background "#f5f5f5" ))))
   '(mode-line ((t (:foreground "#635f52" :background "#bbb783" ))))
   '(region ((t (:background "#cccccc" ))))
   '(secondary-selection ((t (:background "#efeb89" ))))
   '(font-lock-builtin-face ((t (:foreground "#dc0090" ))))
   '(font-lock-comment-face ((t (:foreground "#acb0ac" ))))
   '(font-lock-function-name-face ((t (:foreground "#1b7a4f" ))))
   '(font-lock-keyword-face ((t (:foreground "#358f0c" ))))
   '(font-lock-string-face ((t (:foreground "#df7400" ))))
   '(font-lock-type-face ((t (:foreground "#1c23ed" ))))
   '(font-lock-constant-face ((t (:foreground "#456b48" ))))
   '(font-lock-variable-name-face ((t (:foreground "#b38014" ))))
   '(minibuffer-prompt ((t (:foreground "#e75900" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
   )

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'earth-light)

;;; earth-light-theme.el ends here
