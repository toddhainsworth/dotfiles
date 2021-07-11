(package-initialize)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; Variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" default))
 '(package-selected-packages
   '(counsel-projectile counsel use-package toml-mode smex rust-mode php-mode magit key-chord json-mode ivy-explorer ido-vertical-mode helm-projectile helm-ag gruber-darker-theme evil-visual-mark-mode eglot company ack))
 '(projectile-globally-unignored-directories '("*vendor/magento*" "*vendor/magento")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package evil :ensure t)
(use-package ido-vertical-mode :ensure t)
(use-package ivy :ensure t)
(use-package counsel :ensure t)
(use-package projectile :ensure t)
(use-package counsel-projectile :ensure t)
(use-package company :ensure t)
(use-package key-chord :ensure t)
(use-package php-mode :ensure t)
(use-package toml-mode :ensure t)
(use-package rust-mode :ensure t)
(use-package json-mode :ensure t)
(use-package magit :ensure t)
(use-package smex :ensure t)
(use-package gruber-darker-theme :ensure t)

;; Evil mode >:D
(require 'evil)
(evil-mode t)

;; Let's configure!
(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(column-number-mode 1)
(show-paren-mode 1)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(setq vc-suppress-confirm t)
(windmove-default-keybindings)

;; key-chord mode
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;; Ido mode
(require 'ido)
(ido-mode t)
(ido-everywhere 1)

;; Smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Ivy/Counsel
(require 'ivy)
(require 'counsel)
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)

;; Projectile + Ivy/Counsel
(projectile-mode +1)	
(global-set-key (kbd "s-p") 'counsel-projectile-find-file)
(global-set-key (kbd "M-p") 'counsel-projectile-find-file)
(global-set-key (kbd "s-P") 'counsel-projectile-switch-project)
(global-set-key (kbd "C-p") 'counsel-projectile-find-file)
(global-set-key (kbd "C-c C-p") 'projectile-command-map)
(setq projectile-completion-system 'counsel)

; Rust-mode
;(setq exec-path (append exec-path (expand-file-name "~/.cargo/bin")))
(require 'rust-mode)
(setq rust-format-on-save t)

;; Company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; Sanity bits-n-pieces
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
