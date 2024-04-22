; sets emacs to start at full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)
(defun my-minibuffer-setup ()
       (set (make-local-variable 'face-remapping-alist)
            '((default :height 1.2))))

(electric-indent-mode -1)

(cua-mode 1)

(remove-hook 'minibuffer-setup-hook 'my-minibuffer-setup)

(add-to-list 'exec-path "c:/Apps/ProgramFiles/node-v20.10.0-win-x64")
(add-to-list 'exec-path  "c:/Apps/ProgramFiles/Portable Python-3.10.5 x64/App/Python")
(add-to-list 'exec-path  "c:/Apps/ProgramFiles/Portable Python-3.10.5 x64/App/Python/Scripts")
;(add-to-list 'exec-path  "c:/msys64/ucrt64/bin")
(add-to-list 'exec-path  "c:/Docs/Ref/zeal-0.7.0-portable-windows-x64")
(add-to-list 'exec-path  "c:/Apps/Bin/emacs-29.3/bin")
(add-to-list 'exec-path  "c:/Apps/ProgramFiles/GitIgnore")
(add-to-list 'exec-path  "c:/Apps/ProgramFiles/apache-maven-3.9.6/bin")
(add-to-list 'exec-path  "c:/msys64/usr/bin")
(add-to-list 'exec-path  "c:/msys64/home/Lebo/apps/micro/micro-2.0.11")
(add-to-list 'exec-path  "c:/Apps/ProgramFiles/kotlin/kotlinc-1.9.20/bin")
(add-to-list 'exec-path  "c:/Apps/ProgramFiles/jdk-17.0.9/bin")
(add-to-list 'exec-path  "c:/Apps/ProgramFiles/PortableGit/bin")

(setq python-shell-exec-path "c:/Apps/ProgramFiles/Portable Python-3.10.5 x64/App/Python/")

(add-to-list 'custom-theme-load-path "c:/Apps/ProgramData/Emacs/themes")
(load-theme 'Madrid-pop-dark t)
; ################# FUNCTIONS  ##########################

; ################  VARIABLES  ##########################

(defvar new-all-icons-new-loadup nil)

(setq inhibit-startup-message t)
(tool-bar-mode -1)			; Disable tool bar
(tooltip-mode -1)			; Disable tooltips
(scroll-bar-mode -1)
(set-fringe-mode 10)		; Breathing room

;; Set visual bell
(setq visual-bell t)

(set-face-attribute 'default nil :font "Cascadia Code" :height 100)


;; ###############  KEYBINDINGS  #####################

;; Make ECS quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x C-g") 'goto-line)
(global-set-key (kbd "C-S-c") 'eshell)

;; (Require 'Packages)

; Display line numer and column number 
(display-line-numbers-mode)
(column-number-mode)

; Remove line numbers in shell mode
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



; ############################ GET PACKAGES ##############################

; install counsel
(unless (package-installed-p 'counsel)
  (package-install 'counsel))

; install use-package
(unless (package-installed-p 'use-package)
	(package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

; install ivy
(use-package ivy
	     :diminish
	     :bind(("C-s" . swiper)
	     :map ivy-minibuffer-map
	     ("TAB" . ivy-alt-done)
	     ("C-l" . ivy-alt-done)
	     ("C-j" . ivy-next-line)
	     ("C-k" . ivy-previous-line)
	     :map ivy-switch-buffer-map
	     ("C-k" . ivy-previous-line)
	     ("C-l" . ivy-done)
	     ("C-d" . ivy-switch-kill-buffer)
	     :map ivy-reverse-i-search-map
	     ("C-k" . ivy-previous-line)
	     ("C-d" . ivy-reverse-i-serach-kill))
	     :config
	     (ivy-mode 1)
)

(unless (package-installed-p 'all-the-icons)
  (setq  new-all-icons-new-loadup t))

(unless (equal new-all-icons-new-loadup nil)
  (nerd-icons-install-fonts)
  (all-the-icons-install-fonts)
)

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t)
	)
    )
  )

(setq org-support-shift-select t)

(makunbound  'new-all-icons-new-loadup)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(setq doom-modeline-height 35)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :hook org-mode prog-mode)
(rainbow-mode)

;; (unless (package-installed-p 'ivy-rich)
;;   (package-install 'ivy-rich))
;; (ivy-rich-mode 1)

(use-package glsl-mode)
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))

;; Projectile
(use-package projectile
  :config
  (projectile-mode 1))

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
  (projects . 3)))

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


;; # Eshell 
(use-package eshell-syntax-highlighting)


(setq eshell-rc-script (concat user-emacs-directory "eshell/profile")
      eshell-aliases-file (concat user-emacs-directory "eshell/aliases")
      esehll-history-size 200
      eshell-buffer-maximum-lines 5000
      esehll-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands '("bash", "fish", "htop", "ssh", "top","zsh"))

(setq shell-file-name "c:/Apps/Bin/emacs-29.3/libexec/emacs/29.3/x86_64-w64-mingw32/cmdproxy.exe"); "C:/WINDOWS/system32/cmd.exe" 

(add-hook 'eshell-preoutput-filter-functions 'ansi-color-apply)
