(setq inhibit-startup-screen t)
(setq column-number-mode t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0) 
;;tabstop
(setq-default tab-width 4)

;; undo tree
(global-undo-tree-mode)

;; window split
(setq split-width-threshold 1)

;; display startup screen
(require 'dashboard)
(dashboard-setup-startup-hook)

;; Set the title
(setq dashboard-banner-logo-title "Emacs: One editor to rule them all.")

(setq dashboard-banner-max-width 600)
(setq dashboard-startup-banner "/home/johannes/Emacs/logo.png")
(setq dashboard-icon-type 'all-the-icons) ;; use `all-the-icons' package
(setq dashboard-display-icons-p t) ;; display icons on both GUI and terminal
(setq dashboard-icon-type 'nerd-icons) ;; use `nerd-icons' package
(setq dashboard-set-navigator t)
(setq dashboard-items '((recents . 5) (projects . 5)))
(setq dashboard-show-shortcuts nil)
(setq dashboard-items '((recents . 5) (projects . 5)))
(require 'format)
(use-package all-the-icons)

(setq dashboard-navigator-buttons
      `(
        ;; line1
        ((,(all-the-icons-octicon "file-zip" :height 1.1 :v-adjust 0.0)
          "Go to recent files"
          "recent-buffer"
          (lambda (&rest _) (recentf-open-files)))
         ("⚑" nil "Show flags" (lambda (&rest _) (message "Restarting...") (save-buffers-kill-emacs)) error)
         )))


;;recent files
(recentf-mode 1)

;; line numbers

;;encryption
(setq epg-gpg-program "gpg2")

;; cursor color
(setq evil-default-cursor       '("DodgerBlue1" box)
    evil-normal-state-cursor  '("#C3A30E" box)
    evil-emacs-state-cursor   '("yellow" box)
    evil-motion-state-cursor  '("SeaGreen1" box)
    evil-insert-state-cursor  '(box)
    evil-visual-state-cursor  '(box)
    evil-replace-state-cursor '(x))

;;use-package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;;lsp-mode
(use-package lsp-mode
  :ensure t
  :commands lsp)

;; pyright
(require 'lsp-mode)
(add-hook 'python-mode-hook #'lsp-deferred)
(add-hook 'python-mode-hook #'lsp) 

;; java
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)

;; Set the Pyright language server as the backend for Python
(setq lsp-python-ms-executable "pyright-langserver")

(setq lsp-pyls-server-command "/home/johannes/.local/bin/pylsp")

(global-company-mode t)
(push 'company-lsp company-backends)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(airline-cursor-colors nil)
 '(column-number-mode t)
 '(custom-safe-themes
   '("d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" default))
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(nerd-icons-completion all-the-icons-completion projectile dashboard nerd-icons all-the-icons powerline-evil airline-themes lsp-java undo-tree ivy lsp-pyright company-jedi company use-package el-search treeview gruvbox-theme eglot))
 '(tool-bar-mode nil)
 '(warning-suppress-types '((emacs) (emacs) (emacs) (emacs) (emacs) (emacs) (emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 100 :width normal))))
 '(line-number ((t (:background "gray15" :foreground "yellow"))))
 '(minibuffer-prompt ((t (:background "gray13" :foreground "forest green" :box nil :weight bold)))))

;;evil
(add-to-list 'load-path "~/.emacs.d/evil/")
(require 'evil)
(evil-mode 1)

;;clangd
(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

;;emacs theme
(load-theme 'gruvbox-dark-hard t)

;;emacs airline
;; (require 'airline-themes)
;; (load-theme 'airline-light t)
;; (load-theme 'airline-base16_gruvbox_dark_hard t)


(require 'use-package)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :commands (lsp lsp-deferred)
  :hook
  (python-mode . lsp-deferred)
  :config
  (setq lsp-idle-delay 0.500
        lsp-log-io nil
        lsp-enable-file-watchers nil)
  :bind (:map lsp-mode-map
              ("M-RET" . completion-at-point)))

(setq lsp-python-ms-executable "python-lsp-server")
(setq lsp-pyls-server-command "/home/johannes/.local/bin/pylsp")
(add-hook 'python-mode-hook 'company-mode)

;; mail
(setq smtpmail-smtp-server "Johannes.Elsing@gmx.de"
	  smtpmail-smtp-service 465
	  smtpmail-stream-type 'ssl)
;; configure the function to use for sending mail
(setq message-send-mail-function 'smtpmail-send-it)

;; fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;set font
(set-frame-font "JetBrains Mono  15")

