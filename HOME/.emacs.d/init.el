;;; init.el --- Simple Emacs configuration

;;; Commentary:

;;; Code:

;; Package Management

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa"           . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable"    . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu"             . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org"             . "http://orgmode.org/elpa/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package evil
  :ensure t
  :defer t
  :bind ("C-c e" . evil-mode))

(use-package counsel
  :ensure t
  :demand
  :diminish ivy-mode
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t
        ivy-display-style "fancy"))

(use-package swiper
  :ensure t
  :bind (("C-s"       . swiper)
	 ("C-r"       . swiper)
	 ("C-c s b"   . swiper-all)
	 ("C-c s r"   . swiper-query-replace)
	 ("C-c s R"   . swiper-all-query-replace)))

(use-package counsel-projectile
  :ensure t
  :defer t
  :bind (("C-c p SPC" . counsel-projectile)
	 ("C-c p p"   . counsel-projectile-switch-project)
	 ("C-c p f"   . counsel-projectile-find-file)
	 ("C-c p b"   . counsel-projectile-switch-to-buffer)
	 ("C-c p s s" . counsel-projectile-ag)
	 ("C-c p d"   . counsel-projectile-find-dir))
  :config
  (counsel-projectile-on))

(use-package python-mode
  :ensure t
  :mode "\\.py\\'"
  :interpreter "Python")

(use-package php-mode
  :ensure t
  :mode "\\.php\\'"
  :interpreter "php")

(use-package scala-mode
  :ensure t
  :mode "\\.scala\\'"
  :interpreter "Scala")

(use-package ensime
  :ensure t
  :pin melpa-stable)

(use-package vimish-fold
  :ensure t
  :defer t)

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init (setq which-key-idle-delay 1.5)
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (which-key-declare-prefixes
    "C-c o" "org"
    "C-c p" "projectile"
    "C-c s" "swiper"))

(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'"
  :interpreter "YAML")

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (global-flycheck-mode)
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (progn
    (add-to-list 'flycheck-disabled-checkers 'python-flake8)
    (add-hook 'python-mode-hook (lambda () (flycheck-select-checker 'python-pylint)))
    ;; Dirty hack to get around starscream pylintrc colour code escapes
    ;; Copy repo pylintrc file to tmp and change:
    ;;   output-format=colorized -> output-format=parseable
    ;; module: `starscream_list` breaks flycheck, remove from pylintrc
    (setq flycheck-pylintrc "tmp/pylintrc")))

(use-package flymake
  :disabled t)

(use-package org
  :ensure org-plus-contrib
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c o a" . org-agenda)
	 ("C-c o l" . org-store-link))
  :config
  (setq org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(p)" "BLOCKED(b)" "WAITING(w)" "|" "CANCELLED(c)" "DONE(d)"))
        org-log-done t
        org-hide-leading-stars t
        org-agenda-files '("~/Sync/Shopify/org/roadmapping/risk.org"
                           "~/Sync/Shopify/org/roadmapping/logistics.org"
                           "~/Sync/Shopify/org/roadmapping/shipping.org"
                           "~/Sync/Shopify/org/roadmapping/general.org")))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

(use-package lua-mode
  :ensure t
  :mode "\\.lua\\'"
  :interpreter "Lua")

(use-package company
  :ensure t
  :diminish company-mode
  :defer t
  :config
  (global-company-mode))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

(use-package magit
  :ensure t
  :pin melpa-stable
  :bind ("C-x g" . magit-status))

(use-package smartparens
  :ensure t)

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

;;; init.el ends here
