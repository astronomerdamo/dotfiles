(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

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
 'helm
 'evil
 'color-theme-solarized
 'sublime-themes
 'zenburn-theme)

;; Required for VIM keybindings
;;(require 'evil)
;;(evil-mode t)

;; Set the theme
;; Zenburn for the emacs GUI
;; Solarized Dark for the emacs in terminal
(defun setup-gui-env()
  (load-theme 'zenburn t)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

(defun setup-term-env()
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
;;(global-linum-mode t)

;; Turn on bracket matching
(show-paren-mode t)

;; Skip the splash screen
(setq inhibit-splash-screen t)

;; Text selection and overwriting easier
(delete-selection-mode t)

;; Never insert tabs
(setq tab-width 4
      indent-tabs-mode nil)

;; Turn off backup files
(setq make-backup-files nil)

;; Make yes/no options accept y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Reduce wait for keystokes
(setq echo-keystrokes 0.1)
