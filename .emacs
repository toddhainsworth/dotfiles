(package-initialize)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

; Variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" default))
 '(package-selected-packages
   '(eglot haskell-mode flycheck-rust toml-mode rust-mode json-mode graphql-mode geben ack company-php key-chord keychord company evil ivy ivy-explorer php-mode gruber-darker-theme smex magit projectile use-package evil-visual-mark-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package evil :ensure t)
(use-package ack :ensure t)
(use-package eglot :ensure t)
(use-package projectile :ensure t)
(use-package company :ensure t)
(use-package key-chord :ensure t)
(use-package php-mode :ensure t)
(use-package toml-mode :ensure t)
(use-package rust-mode :ensure t)
(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  :ensure t)
(use-package graphql-mode :ensure t)
(use-package haskell-mode :ensure t)
(use-package json-mode :ensure t)
(use-package magit :ensure t)
(use-package smex :ensure t)
(use-package gruber-darker-theme :ensure t)

; Evil mode >:D
(require 'evil)
(evil-mode t)

; Let's configure!
(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(column-number-mode 1)
(show-paren-mode 1)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(setq vc-suppress-confirm t)

; Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

; Ido mode
(require 'ido)
(ido-mode t)
(ido-everywhere 1)

; Smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

; Projectile
(projectile-mode +1)	
(global-set-key (kbd "s-p") 'projectile-command-map)
(global-set-key (kbd "C-c C-p") 'projectile-command-map)
(global-set-key (kbd "C-x C-g") 'projectile-find-file)

; Graphql-mode
(add-to-list 'auto-mode-alist '("\\.graphqls\\'" . graphql-mode))

; Rust-mode
(require 'rust-mode)
(setq rust-format-on-save t)

; Company-mode
(add-hook 'after-init-hook 'global-company-mode)

; Eglot
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'ruby-mode-hook 'eglot-ensure)
(add-hook 'php-mode-hook 'eglot-ensure)
(add-hook 'haskell-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'elixir-mode-hook 'eglot-ensure)
