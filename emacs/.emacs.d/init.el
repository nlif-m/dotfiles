;; The default is 800 kilobytes.  Measured in bytes.  -*- lexical-binding: t; -*-
(setq gc-cons-threshold (* 50 1000 1000))

(add-to-list 'load-path "~/.emacs.d/packages/")
;; Disable GUI components
(setq inhibit-startup-screen t)
(tooltip-mode      -1)
(menu-bar-mode     -1) ;; отключаем графическое меню
(tool-bar-mode     -1) ;; отключаем tool-bar
(scroll-bar-mode   -1) ;; отключаем полосу прокрутки
(blink-cursor-mode -1) ;; курсор не мигает
(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал
(message default-directory)
;; Disable backup/autosave files
(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil) ;; я так привык... хотите включить - замените nil на t

;; Language
(set-language-environment 'UTF-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq-default coding-system-for-read    'utf-8)
(setq file-name-coding-system           'utf-8)
(set-selection-coding-system            'utf-8)
(set-keyboard-coding-system        'utf-8-unix)
(set-terminal-coding-system             'utf-8)
(prefer-coding-system                   'utf-8)

;; Display file size/time in mode-line
(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode          t) ;; размер файла в %-ах


(global-display-line-numbers-mode t)
(menu-bar--display-line-numbers-mode-relative)
(load-theme 'wombat)
(setq frame-title-format "GNU Emacs: %b")
(show-paren-mode t)
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()
(setq require-final-newline    t) ;; добавить новую пустую строку в конец файла при сохранении
;; Clipboard settings
(setq x-select-enable-clipboard t)

;; Highlight search resaults
(setq search-highlight        t)
(setq query-replace-highlight t)

;; Scrolling settings
(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы
(setq scroll-conservatively 10000)

;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

(require 'electric)
(electric-pair-mode 1)
(electric-indent-mode 1)

;; Delete selection
(delete-selection-mode t)

(require 'imenu)
(setq imenu-auto-rescan t)
(setq imenu-use-popup-menu nil)

;; IDO plugin
(require 'ido)
(ido-mode                       t)
(icomplete-mode                 t)
(ido-everywhere                 t)
(setq ido-vitrual-buffers       t)
(setq ido-enable-flex-matching  t)

;; Buffer Selection and ibuffer settings
(require  'bs)
(require  'ibuffer)
(defalias 'list-buffers 'ibuffer) ;; отдельный список буферов при нажатии C-x C-b
(global-set-key (kbd "<f2>") 'bs-show) ;; запуск buffer selection кнопкой F2

;; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode             t) ;; включено с версии Emacs-22. На всякий...
(setq font-lock-maximum-decoration t)

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load  "~/.emacs.d/packages/lsp")
(load  "~/.emacs.d/packages/mygolang.el")

(use-package org
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((latex . t)
     (emacs-lisp . t)
     (lisp . t))))

(use-package company
  :ensure t
  :init 
  (global-company-mode t))

(use-package magit
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"))

(use-package counsel
  :ensure t
  :demand t
  :bind (("M-x" . counsel-M-x)
	 ;("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-x b" . counsel-switch-buffer)
         ("C-M-l" . counsel-imenu)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

(use-package ivy
  :ensure t
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-f" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t))

(use-package ivy-rich
  :ensure t
  :after counsel
  :init
  (ivy-rich-mode t))

(use-package prescient
  :after counsel
  :config
  (prescient-persist-mode 1))

(use-package ivy-prescient
  :ensure t
  :after prescient
  :config
  (ivy-prescient-mode t))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "~/org-roam"))
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n g" . org-roam-graph)
	 ("C-c n c" . org-roam-capture)
	 ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i" . completion-at-point))
  :config
  (org-roam-db-autosync-mode))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode t))


(use-package yasnippet-snippets
  :ensure t)

(use-package ivy-yasnippet
  :ensure t
  :after yasnippet)

; (global-set-key (kbd "C-h v") #'helpful-variable)
(use-package helpful
  :ensure t
  :config
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable)
  :bind (("C-h f"	. helpful-callable)
	 ("C-h F"	. helpful-function)
	 ("C-h v"	. helpful-variable)
	 ("C-h k"	. helpful-key)
	 ("C-c C-d"	. helpful-at-point)
	 ("C-h C"	. helpful-command)))

(use-package drag-stuff
  :ensure t
  :bind (("M-<up>" . drag-stuff-up)
	 ("M-<down>" . drag-stuff-down)))



;; (use-package auctex)
(global-set-key (kbd "C-c C-c") 'compile)

;; emacs-python-mode
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/.*\.py\'" . python-mode)) auto-mode-alist))

(message "%s" (emacs-init-time))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-pyright drag-stuff yasnippet-snippets xml+ which-key use-package slime restart-emacs python-mode org-roam-ui org-gtd magit lsp-ui ivy-yasnippet ivy-rich ivy-prescient helpful haskell-mode go-snippets go-complete flymake-shellcheck flymake-shell flymake-cursor flycheck-pos-tip flycheck-inline fish-mode emmet-mode counsel company-ctags auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
