(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.html.eex\\'" . web-mode)
         )
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t))

;; * Rails
(use-package projectile-rails
  :config
  (projectile-rails-global-mode))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode 1))

(use-package enh-ruby-mode
  :mode (("\\.rb$" . enh-ruby-mode)
         ("Vagrantfile$" . enh-ruby-mode)
         ("Gemfile$" . enh-ruby-mode)
         ("\\.rake$" . enh-ruby-mode)
         ("\\.rabl$" . enh-ruby-mode)
         ("Capfile$" . enh-ruby-mode)
         ("\\.gemspec$" . enh-ruby-mode)
         ("\\.builder$" .
  :config
  (progn
    ;; Ruby has a lot of camel case
    (add-hook 'enh-ruby-mode-hook 'subword-mode)
    (setq enh-ruby-use-encoding-map nil)
    (custom-set-faces
     '(erm-syn-errline ((t (:box nil))))
     '(erm-syn-warnline ((t (:box nil))))
     '(enh-ruby-op-face ((t (:inherit default))))
     '(enh-ruby-string-delimiter-face ((t (:foreground "#dc322f" :background nil))))
     '(enh-ruby-regexp-delimiter-face ((t (:foreground "#dc322f" :background nil))))
     '(enh-ruby-heredoc-delimiter-face ((t (:foreground "#dc322f" :background nil)))))))

(use-package robe
  :init
  (progn
    (require 'company)
    (add-to-list 'company-backends 'company-robe))
  :config
  (progn (add-hook 'enh-ruby-mode-hook 'robe-mode)))

(use-package rspec-mode
  :commands rspec-mode
  :config
  (progn (inf-ruby-switch-setup)
         (setq compilation-scroll-output t)))

(use-package bundler
  :defer t)

;; * Docker

(use-package dockerfile-mode ;; something
  :mode "\\Dockerfile\\'")


;; Haskell

(use-package haskell-mode)
(use-package intero
  :config
  (intero-global-mode 1))

(use-package alchemist)
