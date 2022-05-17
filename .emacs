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
 '(ansi-color-names-vector
   ["#181818" "#ab4642" "#a1b56c" "#f7ca88" "#7cafc2" "#ba8baf" "#7cafc2" "#d8d8d8"])
 '(custom-safe-themes
   (quote
    ("5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" default)))
 '(package-selected-packages
   (quote
    (cider fzf fzf\.el magit-todos web-mode neotree flycheck exec-path-from-shell undo-fu graphql-mode base16-theme ivy counsel-projectile counsel use-package toml-mode rust-mode php-mode magit key-chord json-mode ivy-explorer ido-vertical-mode helm-projectile helm-ag evil-visual-mark-mode eglot company))))
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

(use-package evil :ensure t
  :init (setq evil-undo-system 'undo-fu)
  :config (define-key evil-normal-state-map (kbd "B") 'evil-beginning-of-line)
	  (define-key evil-normal-state-map (kbd "E") 'evil-end-of-line))
(use-package undo-fu :ensure t)
(use-package ido-vertical-mode :ensure t)
(use-package ivy :ensure t
  :config (setq ivy-use-virtual-buffers t)
	  (setq ivy-use-selectable-prompt t)
	  (setq enable-recursive-minibuffers t)
	  (define-key global-map "\C-s" 'swiper)
	  (define-key global-map (kbd "C-c C-r") 'ivy-resume)
	  (define-key global-map (kbd "<f6>") 'ivy-resume)
	  (define-key global-map (kbd "M-x") 'counsel-M-x)
	  (define-key global-map (kbd "C-x C-f") 'counsel-find-file)
	  (define-key global-map (kbd "C-x b") 'counsel-switch-buffer)
	  (define-key ivy-minibuffer-map (kbd "C-<return>") 'ivy-immediate-done))
(use-package fzf :ensure t)
(use-package counsel :ensure t)
(use-package projectile :ensure t
;; So why doesn't this unignored change seem to work? :(
  :config (add-to-list 'projectile-globally-unignored-directories "*vendor*")
	  (define-key global-map (kbd "s-p") 'fzf-find-file)
	  (define-key global-map (kbd "s-P") 'counsel-projectile-switch-project)
	  (define-key global-map (kbd "C-p") 'counsel-projectile-find-file)
	  (define-key global-map (kbd "C-c C-p") 'projectile-command-map)
	  (setq projectile-project-search-path '("~/src/"))
	  (projectile-discover-projects-in-search-path)
	  (setq projectile-completion-system 'counsel))
(use-package counsel-projectile :ensure t)
(use-package company :ensure t
  :config (setq company-dabbrev-downcase 0)
	  (setq company-idle-delay 0))
(use-package key-chord :ensure t
  :init (key-chord-mode 1)
  :config (setq key-chord-two-keys-delay 0.5)
	  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state))
(use-package php-mode :ensure t)
(use-package web-mode :ensure t)
(use-package toml-mode :ensure t)
(use-package rust-mode :ensure t
  :config (setq rust-format-on-save t))
(use-package json-mode :ensure t)
(use-package graphql-mode :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.graphqls$" . graphql-mode)))
(use-package magit :ensure t
  :config (define-key global-map (kbd "C-x g") 'magit-status))
(use-package base16-theme :ensure t :config (load-theme 'base16-default-dark t))
(use-package exec-path-from-shell :ensure t :init (exec-path-from-shell-initialize))
(use-package flycheck :ensure t :init (global-flycheck-mode))

;; Evil mode >:D
(require 'evil)
(evil-mode t)

;; Let's configure!
(setq inhibit-startup-screen t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

;; Relative numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq vc-suppress-confirm t)
(setq vc-follow-symlinks t)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
;; Window move with <S-<arrow>>
(windmove-default-keybindings)
;; No wrapping please
(set-default 'truncate-lines t)
;; Escape everywhere
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Projectile + Ivy/Counsel
(defun projectile-project-vcs (&optional dir)
  "Ignoring DIR - Do not treat anything as a VCS root, for some reason the unignored dirs feature doesn't work?"
  'none)

;; Company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; Org-mode
(setq org-agenda-files (list "~/orgs/work.org" "~/orgs/home.org"))
