;;; init.el --- Simple Emacs configuration

;;; Commentary:

;;; Code:

;; Package Management

(require 'package)

(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
		    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

;; Activate installed packages
(package-initialize)

;; Configure use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-verbose t)
(setq use-package-always-ensure t)

(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;; User Package Management

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
  (global-flycheck-mode)
  :bind
  ("C-c a" . org-agenda)
  :config
  (progn
    (add-to-list 'flycheck-disabled-checkers 'python-flake8)
    (add-hook 'python-mode-hook (lambda () (flycheck-select-checker 'python-pylint)))
    ;; Dirty hack to get around starscream pylintrc colour code escapes
    ;; Copy repo pylintrc file to tmp and change:
    ;;   output-format=colorized -> output-format=parseable
    (setq flycheck-pylintrc "tmp/pylintrc")))

(use-package flymake
  :disabled t)

(use-package org
  :ensure org-plus-contrib
  :mode ("\\.org\\'" . org-mode)
  :config
  (progn
    (setq org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(p)" "BLOCKED(b)" "WAITING(w)" "|" "CANCELLED(c)" "DONE(d)")))
    (setq org-log-done t)
    (setq org-agenda-files '("~/Sync/Shopify/org/roadmapping/risk-roadmapping.org"
			     "~/Sync/Shopify/org/roadmapping/logistics-roadmapping.org"))))

;; User Environment Settings

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

;; User key bindings

;;; init.el ends here
