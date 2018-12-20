(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-startup-screen t)

(setq visible-bell 1)
(global-hl-line-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq initial-frame-alist '((fullscreen . maximized)))
(setq default-frame-alist '((fullscreen . maximized)))

;; Line numbers
(setq-default display-line-numbers-type 'visual
              display-line-numbers-current-absolute t
              display-line-numbers-width 4
              display-line-numbers-widen t)

(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; ** Sentence spacing
(setq sentence-end-double-space nil)

;; Updates the buffer if the file changes outside of emacs
(global-auto-revert-mode t)

;; Do not generate backup or autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq shell-file-name "/usr/local/bin/fish")

;; Do not use tabs
(setq-default indent-tabs-mode nil)

;; Ensure finding of applicatoins from homebrew
(add-to-list 'exec-path "/usr/local/bin/")

;; undo for window
(winner-mode)

;; Shortcuts
;; Useful shortcut when used with ivy is C-M-j when wanting to use the typed
;; input, not the completed input.
(global-set-key (kbd "C-x C-j") 'dired-jump)
(global-set-key (kbd "M-i") 'imenu)

;; custom file
(setq custom-file "~/.emacs.d/custom.el")

;; Package configuration
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))



(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/org.el")
(load "~/.emacs.d/programming.el")
;; Load custom must always be at the end
(load custom-file)
