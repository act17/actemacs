;;An attempt at an EMacs Config
;;Made by act, July 28th, 2022
;;Updated on January 15th, 2023
;;Under the GNU GPL 3.0
;;Version 1.5.0
;;github.com/act17/actemacs

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)		;;Thanks emacswiki.org
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

;;Enabling numbers for buffers:
(global-display-line-numbers-mode 1)

;;Creating an... operator? Value?
(setq lines 1)

;;Setting a Theme
(load-theme 'deeper-blue t)

;;Emacs, please stop making new backups. It's an actual problem and it screws me up most of the time.
(setq make-backup-files nil)

;;Key-Binding
(define-key global-map (kbd "C-c C-c") 'act/working-directory)
(define-key global-map (kbd "C-c m") 'act/menubar)
(define-key global-map (kbd "C-x M-l") 'act/lineswitch)
(define-key global-map (kbd "TAB") 'act/insert-tab)
(define-key global-map (kbd "C-z") 'act/petty)
(define-key global-map (kbd "C-x p") 'act/packagelist)
(define-key global-map (kbd "C-x M-p") 'act/packagerefresh)
(define-key global-map (kbd "C-x g") 'act/magitopen)
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c b") 'org-switchb)
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c o") 'act/orgopen)

;;Open the Menu Bar
(defun act/menubar ()
  "Opens the menu bar."
  (interactive)
  (menu-bar-open)
)

;;Org Configuration
(setq org-agenda-files (directory-files-recursively "~/.emacs.d/org" "\\.org"))
(defun act/orgopen()
  "Goes to the Org directory."
  (interactive)
  (dired "~/.emacs.d/org")
)
(setq org-agenda-include-diary t)

;;Open Magit
(defun act/magitopen()
  "Opens Magit."
  (interactive)
  (magit-status)
)

;;List Packages.
(defun act/packagelist()
  "Lists the packages."
  (interactive)
  (list-packages)
)

;;Package Refreshing
(defun act/packagerefresh()
  "Refreshes the packages."
  (interactive)
  (package-refresh-contents)
  (message "Package contents refreshed.")
)

;;Creating some sort of command
(defun act/working-directory ()
  "Goes to the working directory.";;This is for my working directory.
  (interactive)
  (dired "~/c/.git")
)

;;This switches lines on and off.
(defun act/lineswitch ()
  "Turns lines on/off"
  (interactive)
  (if (= lines 0) (act/lineon) (act/lineoff) )
)

(defun act/lineon ()
  (global-display-line-numbers-mode 1)
  (setq lines 1)
  (message "Lines are turned on.")
)

(defun act/lineoff ()
  (global-display-line-numbers-mode 0)
  (setq lines 0)
  (message "Lines are turned off.")
)

;;This is for ensuring 'TAB' enters two spaces.
(defun act/insert-tab ()
  "Inserts a tab."
  (interactive)
  (insert "  ")
)

;;This is petty
(defun act/petty ()
  "Not this time you bahstid."
  (interactive)
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (rust-mode magit ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
