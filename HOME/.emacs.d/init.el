;;
;; Simple emacs config
;;

;;
;; Package Management
;;

(require 'package)

(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
		    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

;; Activate installed packages
(package-initialize)

;; Make sure to have downloaded archive description.
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;;
;; User Package Management
;;

(use-package exec-path-from-shell
  :ensure t
  :if window-system
  :config
  (exec-path-from-shell-initialize))

(use-package evil
  :ensure t
  :bind ("C-x e" . evil-mode))

(use-package python-mode
  :ensure t
  :mode "\\.py\\'"
  :interpreter "python")

(use-package php-mode
  :ensure t
  :mode "\\.php\\'"
  :interpreter "php")

(use-package scala-mode
  :ensure t
  :mode "\\.scala\\'"
  :interpreter "scala")

(use-package ensime
  :ensure t
  :pin melpa-stable)

(use-package helm
  :ensure t
  :config
  (helm-mode 1))

(use-package helm-projectile
  :ensure t
  :config
  (projectile-global-mode)
  (helm-projectile-on))

(use-package vimish-fold
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode t)
  (which-key-setup-side-window-bottom))

(use-package sublime-themes
  :ensure t
  :demand)

(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'"
  :interpreter "ya?ml")

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  :config
  (setq flycheck-pylintrc "pylintrc")
  (setq-default flycheck-disabled-checkers '(python-flake8))
  ;;(defcustom pylint-options (pylint-options '("--output-format=parseable")))
  ;;(flycheck-define-checker python-pylint
  ;;  :command ("pylint" "--output-format=parseable" source))
  )

(use-package flymake :disabled t)

;;
;; User Environment Settings
;;

;; Set emacs environment based on GUI or terminal use
(defun setup-gui-env()
  (load-theme 'brin t)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

(defun setup-term-env()
  (menu-bar-mode -1)
  (load-theme 'solarized-dark t)
  (set-frame-parameter nil 'background-mode 'dark)
  (set-terminal-parameter nil 'background-mode 'dark)
  (custom-set-variables
    '(solarized-termcolors 256))
  (custom-set-faces
    '(default ((t (:background nil))))))

(if window-system
    (setup-gui-env)
  (setup-term-env))

;; Display column number along with line number
(column-number-mode t)

;; Set line numbering
(global-linum-mode t)

;; Turn on bracket matching
(show-paren-mode t)

;; Skip the splash screen
(setq inhibit-splash-screen t)

;; Text selection and overwriting easier
(delete-selection-mode t)

;; Never insert tabs
(setq indent-tabs-mode nil)

;; Turn off backup files and auto-save
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Make yes/no options accept y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Reduce wait for keystokes
(setq echo-keystrokes 0.1)

;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Fix janky scrolling with trackpad/mouse and keyboard
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse t)
(setq scroll-step 1)

;;
;; User key bindings
;;

;;; init.el ends here
