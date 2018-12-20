;; * Package configuration

(require 'use-package)

(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; ** exec-path-from-shell
;; This ensures that applications like ag can work
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; ** Visual
(use-package which-key
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

(use-package all-the-icons :defer t)

(use-package doom-themes
  :init
  (load-theme 'doom-one t)
  :config
  (progn
    (doom-themes-visual-bell-config)
    (doom-themes-org-config)))

;; (use-package doom-modeline
;;   :init (doom-modeline-init))

;; Whitespace handling
(use-package whitespace
  :diminish whitespace-modeq
  :init
  (add-hook 'prog-mode-hook 'whitespace-mode)
  :config
  (setq-default whitespace-style '(face tabs spaces trailing
                                        lines-tail space-before-tab newline
                                        indentation empty space-after-tab space-mark tab-mark newline-mark)))
(add-hook 'before-save-hook 'whitespace-cleanup)

;; ** Window navigation

(use-package ace-jump-mode
  :bind ("C-c j" . ace-jump-mode))

(use-package ace-window
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-scope 'frame)
  (global-set-key (kbd "C-x o") 'ace-window))

;; ** Source control
(use-package magit
  :demand t
  :bind (("C-x g" . magit-status)))

(use-package diff-hl
  :defer t
  :hook ((prog-mode . diff-hl-mode)
         (org-mode . diff-hl-mode)
         (dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

(use-package git-timemachine
  :defer t)

;; ** Snippets
;; (use-package yasnippet
;;   :defer 2
;;   :diminish yas-minor-mode
;;   :config
;;   (setq yas-snippet-dirs
;;         '("~/.emacs.d/snippets"
;;           "~/.emacs.d/yasnippet-snippets"))
;;   (yas-global-mode 1))

;; ** Searching and projects
(use-package ag
  :commands (ag ag-regexp ag-project))
(use-package smex)

(use-package projectile
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (setq projectile-enable-caching t
        projectile-completion-system 'ivy)
  (projectile-mode +1))

;; ** Dashboard

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner nil)
  (setq show-week-agenda-p t)
  (setq dashboard-items '((agenda . 10)
                          (projects . 10)
                          (recents . 10))))

;; ** Completion
(use-package company
  :defer t
  :config (global-company-mode t))

;; ** Lynting
(use-package flycheck
  :config
  (global-flycheck-mode))

;; ** Spelling
(use-package flyspell
  :init
  (progn
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
    (add-hook 'text-mode-hook 'flyspell-mode)))

(use-package erc-image
  :config
  (add-to-list 'erc-modules 'image)
  (erc-update-modules))

(use-package erc
  :custom
  (erc-autojoin-channels-alist '(("freenode.net" "#emacs")))
  :config
  (setq erc-echo-notices-in-minibuffer-flag t)
  (setq erc-auto-reconnect nil)
  (setq erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
  (setq erc-lurker-threshold-time 3600)
  (setq erc-input-line-position -2))

(defun erc-connect ()
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "peirama"))

(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode 1))

(use-package swiper
  :bind ("C-s" . swiper))

(use-package counsel
  :config
  (counsel-mode 1))
