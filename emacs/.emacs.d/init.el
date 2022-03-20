




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
(electric-indent-mode -1)

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
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package company
  :ensure t
  :init
  (global-company-mode 1))

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
  :config
  (setq inferior-lisp-program "sbcl"))

(emacs-init-time)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(fish-mode restart-emacs python-mode slime which-key flycheck-pos-tip use-package magit haskell-mode flymake-shellcheck flymake-shell flymake-cursor flycheck-inline company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
