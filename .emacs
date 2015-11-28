(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(defun ensure-package-installed (&rest packages)
    (mapcar
     (lambda (package)
       (if (package-installed-p package)
	   nil
	 (if (y-or-n-p (format "Package %s is missing. Install it? " package))
	     (package-install package)
	   package)))
     packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed
 'helm
 'evil
 'zenburn-theme
 'color-theme-solarized)

;; Required for VIM keybindings
;;(require 'evil)
;;(evil-mode t)

;; Set the theme
;; Zenburn for the emacs GUI
;; Solarized Dark for the emacs in terminal
(defun run-term-solarized()
  (load-theme 'solarized t)
  (set-frame-parameter nil 'background-mode 'dark)
  (set-terminal-parameter nil 'background-mode 'dark)
  (custom-set-variables
   '(solarized-termcolors 256))
  (custom-set-faces
   '(default ((t (:background nil))))))

(if (display-graphic-p)
    (load-theme 'zenburn t)
  (run-term-solarized))

;; Display column number along with line number
(column-number-mode t)

;; Set line numbering
;;(global-linum-mode t)

;; Turn on bracket matching
(show-paren-mode 1)

