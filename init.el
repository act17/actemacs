;;An attempt at an EMacs Config
;;Made by act, July 28th, 2022
;;Released on July 30th, 2022
;;Under the GNU GPL 3.0
;;Version 1.1
;;Released on July 31st, 2022
;;github.com/act17/actemacs


;;Enabling numbers for buffers:
(global-display-line-numbers-mode 1)

;;Creating an... operator? Value?
(setq lines 1)

;;Setting a Theme
(load-theme 'deeper-blue t)

;;Key-Binding
(define-key global-map (kbd "C-c c") 'act/working-directory)
(define-key global-map (kbd "C-x M-l") 'act/lineswitch)
(define-key global-map (kbd "TAB") 'act/insert-tab)
  
;;Creating some sort of command
(defun act/working-directory ()
  "Goes to the working directory.";;This is for my working directory.
  (interactive)
  (dired "~/c/")
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
