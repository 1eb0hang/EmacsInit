; sets emacs to start at full screen

;; TODO: Get actual file-path

(add-to-list 'load-path "~/Dev/emacs/EmacsInit/Packages")

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)
(defun my-minibuffer-setup ()
       (set (make-local-variable 'face-remapping-alist)
            '((default :height 1.2))))

(electric-indent-mode -1)

(cua-mode 1)

(remove-hook 'minibuffer-setup-hook 'my-minibuffer-setup)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'earth-light t)

; ################  VARIABLES  ##########################

(defvar new-all-icons-new-loadup nil)

(setq inhibit-startup-message t)
(tool-bar-mode -1)			; Disable tool bar
(tooltip-mode -1)			; Disable tooltips
(scroll-bar-mode -1)
(set-fringe-mode 10)		; Breathing room

;; Set visual bell
(setq visual-bell t)

(set-face-attribute 'default nil :font "Cascadia Mono" :height 100)


;; ;; ###############  KEYBINDINGS  #####################

;; Make ECS quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-S-c") 'eshell)
(global-set-key (kbd "C-x C-g") 'goto-line)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

; Display line numer and column number 
(display-line-numbers-mode)
(column-number-mode)

;; ; Remove line numbers in shell mode
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		echell-mode-hook))
  (add-hook mode (lambda ()(display-line-numbers-mode 0))))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(require 'package)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))


;; ; ############################ GET PACKAGES ##############################

;; ; install use-package
;; (unless (package-installed-p 'use-package)
;; 	(package-install 'use-package))

;; (require 'use-package)
;; (setq use-package-always-ensure t)

;; (use-package command-log-mode)

; install ivy
(unless (package-installed-p 'ivy)
  (package-install 'ivy))
(ivy-mode 1)


;; ; install counsel
(unless (package-installed-p 'counsel)
  (package-install 'counsel))
(when (member 'ivy package-activated-list)
  (counsel-mode 1))

(unless (package-installed-p 'all-the-icons)
  (setq  new-all-icons-new-loadup t))


(unless (package-installed-p 'all-the-icons)
  (package-install 'all-the-icons))

(unless (equal new-all-icons-new-loadup nil)
  (all-the-icons-install-fonts)
  (nerd-icons-install-fonts)
)

;; (use-package all-the-icons-dired
;;   :hook (dired-mode . (lambda () (all-the-icons-dired-mode t)
;; 	)
;;     )
;;   )

(unless (package-installed-p 'all-the-icons-dired)
  (package-install 'all-the-icons-dired))
(add-hook 'dired-mode-hook '(lambda () (all-the-icons-dired-mode t)))

(setq org-support-shift-select t)


(makunbound  'new-all-icons-new-loadup)


(unless (package-installed-p 'doom-modeline)
  (package-install 'doom-modeline))
(doom-modeline-mode 1)
(setq doom-modeline-height 35)

;(use-package rainbow-mode
;  :hook org-mode prog-mode)
;(rainbow-mode)

(unless (package-installed-p 'rainbow-mode)
  (package-install 'rainbow-mode))
(rainbow-mode 1)


(unless (package-installed-p 'ivy-rich)
  (package-install 'ivy-rich))
(ivy-rich-mode 1)


(unless (package-installed-p 'glsl-mode)
  (package-install 'glsl-mode))
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))


;; Projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(projectile-mode 1)


;; Dashboard
(unless (package-installed-p 'dashboard)
  (package-install 'dashboard))

(setq initial-buffer-choice 'dashboard-open)
(setq dahsboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-banner-logo-title "More Than a Text Editor")
(setq dashboard-starup-banner 'logo)
;;(setq dashboard-startup-banner "path to pickture") ;; use custon banner
(setq dashboard-center-content nil)
(setq dashbboard-items '(
  (recents . 5)
  (agenda . 5)
  (bookmarks . 3)
  (projects . 5)))


(dashboard-setup-startup-hook)

(unless (package-installed-p 'magit)
  (package-install 'magit))

(use-package company
  :defer 2
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (gloabl-company-mode t))

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))
(company-mode 1)

;; ; ESHELL 
(setq eshell-rc-script (concat user-emacs-directory "eshell/profile")
      eshell-aliases-file (concat user-emacs-directory "eshell/aliases")
      eshell-scoll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t)

;; (use-package markdown-mode
;;   :ensure t
;;   :mode ("README\\.md\\" . gfm-mode)
;;   :init (setq markdown-command "multimarkdown"))

;; ###################################### PACKAGE KEYBINDINGS ########################################

(global-set-key (kbd "C-x C-f") 'find-file)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-s") 'swiper)
