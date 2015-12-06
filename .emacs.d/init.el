;;
;; Simple emacs config
;;

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Activate installed packages
(package-initialize)

;; Make sure to have downloaded archive description.
(when (not package-archive-contents)
  (package-refresh-contents))

;;
;; User Package Management
;;

;; Define personalized packages and install
(defun ensure-package-installed (&rest packages)
  (mapcar
  (lambda (package)
  (if (package-installed-p package)
     nil
   (if (y-or-n-p (format "Package %s is missing. Install it? " package))
       (package-install package)
     package)))
  packages))

(ensure-package-installed
 'auto-complete
 'evil
 'guide-key
 'helm
 'helm-projectile
 'projectile
 'color-theme-solarized
 'sublime-themes
 'zenburn-theme)

;;
;; Utilities
;;

;; Required for VIM keybindings
(require 'evil)
(evil-mode t)

;; Use projectile and helm
(require 'helm-projectile)
(projectile-global-mode)
(helm-projectile-on)
;;(setq projectile-completion-system 'helm)

;; Turn helm on globally
;;(require 'helm)
;;(setq helm-buffers-fuzzy-matching t)
;;(helm-mode 1)

;; Turn on Guide-Key
;; Add:
;;; Projectile
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-c p"))
(guide-key-mode 1)

;; Turn on auto-complete
(require 'auto-complete-config)
(ac-config-default)

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
  (load-theme 'solarized t)
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

;; Fix janky scrolling with trackpad/mouse
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;;
;; User key bindings
;;

;; Toggle evil-mode on/off
(global-set-key (kbd "C-x e") 'evil-mode)
