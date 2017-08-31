;;; Tyler Parker emacs config

;; -------- bug fixes --------
(setenv "GNOME_DESKTOP_SESSION_ID" "1")	; fixes browse-url-can-use-xdg-open

;; -------- package repos --------
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa" . 1)))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

;; -------- use-package --------
;; (use-package evil
;;   :init (global-unset-key (kbd "C-z"))
;;   :config (evil-mode 1))
(use-package ivy
  :config (ivy-mode 1)
  :bind ("C-s" . swiper))
(use-package smex
  :bind ("M-x" . smex))

(use-package counsel
  :bind (("C-x C-f" . counsel-find-file)))

(use-package magit
  :config (setq magit-completing-read-function 'ivy-completing-read)
  :bind (:bind magit-mode-map
	       ("C-x g" . magit-status)))
(use-package company
  :config (progn
	    (add-hook 'lisp-mode-hook #'company-mode)))
(use-package projectile
  :config (progn
	    (setq projectile-completion-system 'ivy)
	    (projectile-global-mode)))
(use-package atom-one-dark-theme
  :config (load-theme 'atom-one-dark t))
;; (use-package skewer-mode
;;   :bind (:map skewer-mode-map
;; 	      ("C-x C-e" . skewer-eval-last-expression))
;;   :config (add-hook 'js2-mode-hook 'skewer-mode))

;; (use-package web-mode
;;   :config (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package js2-mode
  :config (progn (add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))))

(use-package zencoding-mode
  :config (add-hook 'html-mode-hook 'zencoding-mode))
(use-package paredit
  :config (add-hook 'lisp-mode-hook 'paredit-mode))
(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
	 :bind mc/keymap
	 ("<return>" . nil))
  :config (define-key mc/keymap (kbd "<return>") nil))
(use-package indium
  :config (add-hook 'js-mode-hook indium-interaction-mode))
(use-package exec-path-from-shell
  :config (when (memq window-system '(mac ns x))
	    (exec-path-from-shell-initialize)))


;; -------- Global keybindings --------
;;(global-unset-key (kbd "C-z"))
(define-key global-map (kbd "RET") 'newline-and-indent)

;; -------- global modes --------
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-auto-revert-mode t)

;; -------- global settings --------
(setq auto-save-default nil)
(setq make-backup-files nil)


(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smex ivy-smex indium js2-mode exec-path-from-shell paredit highlight-chars company company-mode lispy ivy-hydra zencoding-mode zencoding use-package skewer-mode projectile magit evil counsel atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; -------- mode-settings --------
(setq js-indent-level 2)
