;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/auto-indent-mode")
(add-to-list 'load-path "~/.emacs.d/emacs-powerline")
(require 'powerline)
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(require 'auto-indent-mode)
(require 'autopair)
(require 'powerline)
(require 'sr-speedbar)
(ido-mode t)
(menu-bar-mode -1)
(normal-erase-is-backspace-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)
(setq inhibit-startup-screen t)
(auto-indent-global-mode)

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-h" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(load "js-config.el")
(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; -------------------------------
;; -- nxhtml Mode configuration --
;; -------------------------------
(load "~/.emacs.d/nxhtml/autostart.el")

;; Workaround the annoying warnings:
;; Warning (mumamo-per-buffer-local-vars):
;; Already 'permanent-local t: buffer-file-name
(when (and (>= emacs-major-version 24)
(>= emacs-minor-version 2))
(eval-after-load "mumamo"
'(setq mumamo-per-buffer-local-vars
(delq 'buffer-file-name mumamo-per-buffer-local-vars))))

;; ------------------------
;; -- PHP quick doc help --
;; ------------------------
(load "php-documentation-lookup.el")

;; ---------------
;; -- yasnippet --
;; ---------------
;; (add-to-list 'load-path
;;              "~/.emacs.d/yasnippet")
;;(require 'yasnippet)
;;(yas-global-mode 1)

;; --------------------------------
;; Auto-complete mode configuration
;; --------------------------------
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

;; ----------------------
;; -- php-autocomplete --
;; ----------------------
(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)))

(add-hook  'php-mode-hook
           (lambda ()
             (when (require 'auto-complete nil t)
               (make-variable-buffer-local 'ac-sources)
               (add-to-list 'ac-sources 'ac-source-php-completion)
;     if you like patial match,
;;    use `ac-source-php-completion-patial' instead of `ac-source-php-completion'.
               (add-to-list 'ac-sources 'ac-source-php-completion-patial)
               (auto-complete-mode t))))

(load "auto-find-tags.el")
(load "auto-complete-etags.el")

;; ----------------------
;; -- Custom functions --
;; ----------------------

(defun select-text-in-quote ()
  "Selects the text in quotes like () {} \"\" '' "
  (interactive)
  (let (p1)
    (skip-chars-backward "^<>({\'\"")
    (setq p1 (point))
    (skip-chars-forward "^<>)}\'\"")
    (set-mark p1)))

(global-set-key (kbd "M-*") 'select-text-in-quote)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mumamo-background-chunk-major ((t nil)))
 '(mumamo-background-chunk-submode1 ((t nil)))
 '(mumamo-background-chunk-submode2 ((t nil)))
 '(mumamo-background-chunk-submode3 ((t nil)))
 '(mumamo-background-chunk-submode4 ((t nil))))

(setq default-tab-width 4)
(setq tab-width 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(autopair-global-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(global-linum-mode t)
 '(ido-mode (quote both) nil (ido))
 '(make-backup-files nil)
 '(nxml-child-indent 4)
 '(speedbar-show-unknown-files t)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))))
