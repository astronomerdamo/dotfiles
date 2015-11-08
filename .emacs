(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(defun ensure-package-installed (&rest packages)
    "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
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

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'evil
			  'helm
			  'color-theme-solarized
			  'sublime-themes
			  'markdown-mode
			  'magit)

;; Required for VIM keybindings
(require 'evil)
(evil-mode t)

;; Set solarized theme
;;(load-theme 'solarized t)
;;(set-frame-parameter nil 'background-mode 'dark)
;;(set-terminal-parameter nil 'background-mode 'dark)
;;(custom-set-variables
;; '(solarized-termcolors 256))
;;(custom-set-faces
;; '(default ((t (:background nil)))))

(defun run-term-solarized()
    (load-theme 'solarized t)
    (set-frame-parameter nil 'background-mode 'dark)
    (set-terminal-parameter nil 'background-mode 'dark)
    (custom-set-variables
     '(solarized-termcolors 256))
    (custom-set-faces
     '(default ((t (:background nil))))))

(require 'sublime-themes)
;;(require 'solarized)
(if (display-graphic-p)
    (load-theme 'brin t)
  (run-term-solarized))
  
;;(require 'sublime-themes)
;;(load-theme 'brin t)

;; Display column number along with line number
(column-number-mode t)

;; Set line numbering
;;(global-linum-mode t)
;;(global-column-number-mode t)

;; Turn on bracket matching
(show-paren-mode 1)

