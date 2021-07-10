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
 '(blink-cursor-mode nil)
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" default))
 '(package-selected-packages
   '(helm-ag helm-projectile helm ido-vertical-mode eglot rust-mode json-mode ack company-php key-chord keychord company evil ivy ivy-explorer php-mode gruber-darker-theme smex magit projectile use-package evil-visual-mark-mode))
 '(projectile-globally-unignored-directories '("*vendor/magento*" "*vendor/magento"))
 '(scroll-bar-mode nil))
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
(use-package projectile :ensure t)
(use-package ido-vertical-mode :ensure t)
(use-package helm :ensure t)
(use-package helm-projectile :ensure t)
(use-package helm-ag :ensure t)
(use-package company :ensure t)
(use-package key-chord :ensure t)
(use-package php-mode :ensure t)
(use-package toml-mode :ensure t)
(use-package rust-mode :ensure t)
(use-package json-mode :ensure t)
(use-package magit :ensure t)
(use-package smex :ensure t)
(use-package gruber-darker-theme :ensure t)

; Evil mode >:D
; (require 'evil)
; (evil-mode t)

; Let's configure!
(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(column-number-mode 1)
(show-paren-mode 1)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(setq vc-suppress-confirm t)

; Exit insert mode by pressing j and then j quickly
; (setq key-chord-two-keys-delay 0.5)
; (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
; (key-chord-mode 1)

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
(global-set-key (kbd "s-p") 'helm-projectile-find-file)
(global-set-key (kbd "M-p") 'helm-projectile-find-file)
(global-set-key (kbd "s-P") 'helm-projectile-switch-project)
(global-set-key (kbd "C-p") 'helm-projectile-find-file)
(global-set-key (kbd "C-c C-p") 'projectile-command-map)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

; Rust-mode
;; Make sure Rust is on the path
(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.cargo/bin")))
(setq exec-path (append exec-path (expand-file-name "~/.cargo/bin")))
(require 'rust-mode)
(setq rust-format-on-save t)

; Company-mode
(add-hook 'after-init-hook 'global-company-mode)
