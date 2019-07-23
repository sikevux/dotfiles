;;; init.el --- Mostly broken shit

;; Author: Patrik Greco <emacs@sikevux.se>
;; Keywords: lisp
;; Package-Requires: ((emacs "26.1"))
;; Version: 1.8

;;; Commentary:
;; Basically stuff that's needed for working
;; it's nothing magical, it's usually broken
;; everything is shit, but it's my shit.

;;; Code:
(setq load-prefer-newer t)

(setq message-log-max 16384
      gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(add-hook 'after-init-hook
	  `(lambda ()
	     (setq gc-cons-threshold 800000
		   gc-cons-percentage 0.1)
	     (garbage-collect)) t)


(setq-default indent-tabs-mode t)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(unless (file-directory-p "~/.emacs.d/lisp/")
  (make-directory "~/.emacs.d/lisp"))

(unless (file-directory-p "~/.emacs.d/tmp/")
  (make-directory "~/.emacs.d/tmp"))


(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (hcl-mode use-package))))

;; Bootstrap things
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

;; This extra when makes sure startup is not a billion years.  No real need to
;; refresh when we have shit running (when (not package-archive-contents)
;; (package-refresh-contents))

(package-install-selected-packages)

(add-hook 'after-init-hook 'global-company-mode)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(eval-when-compile
  (require 'use-package))

(require 'bind-key)


(use-package darktooth-theme :ensure t)
(use-package ac-clang :ensure t)
(use-package ansible :ensure t)
(use-package company :ensure t)
(use-package company-ansible :ensure t)
;(use-package company-go :ensure t)
(use-package company-irony :ensure t)
(use-package company-irony-c-headers :ensure t)
(use-package company-shell :ensure t)
(use-package datetime :ensure t)
(use-package flycheck :ensure t)
(use-package flycheck-cask :ensure t)
(use-package flycheck-color-mode-line :ensure t)
;(use-package flycheck-gometalinter :ensure t)
(use-package flycheck-irony :ensure t)
(use-package flycheck-package :ensure t)
(use-package flycheck-pycheckers :ensure t)
(use-package flycheck-status-emoji :ensure t)
(use-package flymake :ensure t)
(use-package flymake-cursor :ensure t)
(use-package flymake-python-pyflakes :ensure t)
(use-package flymake-shell :ensure t)
(use-package git-ps1-mode :ensure t)
(use-package gitconfig-mode :ensure t)
(use-package go-add-tags :ensure t)
(use-package go-autocomplete :ensure t)
(use-package go-errcheck :ensure t)
(use-package go-guru :ensure t)
(use-package go-mode :ensure t)
(use-package google-java-format :ensure t)
(use-package gotest :ensure t)
;(use-package highlight :ensure t)
(use-package highlight-blocks :ensure t)
(use-package highlight-indentation :ensure t)
(use-package highlight-parentheses :ensure t)
(use-package highlight-quoted :ensure t)
(use-package irony :ensure t)
(use-package markdown-mode :ensure t)
(use-package markdown-toc :ensure t)
(use-package org-edit-latex :ensure t)
(use-package powerline :ensure t)
(use-package py-autopep8 :ensure t)
(use-package pydoc :ensure t)
(use-package pyenv-mode :ensure t)
(use-package python-environment :ensure t)
(use-package python-mode :ensure t)
(use-package smartparens :ensure t)
;;; (use-package ssh-config-mode :ensure t)
(use-package time-date :ensure t)
(use-package unicode-whitespace :ensure t)
(use-package whitespace :ensure t)
(use-package datetime :ensure t)
(use-package validate :ensure t)
(use-package auto-compile :ensure t)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(use-package hcl-mode :ensure t)
(use-package terraform-mode :ensure t)


(setq ac-ignore-case nil)
;(validate-setq backup-directory-alist
;	       `((".*" . ,temporary-file-directory)))
;(validate-setq auto-save-file-name-transforms
;	       `((".*" ,temporary-file-directory t)))

(message "Deleting old backup files...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files temporary-file-directory t))
    (when (and (backup-file-name-p file)
	       (> (- current (float-time
			      (fifth (file-attributes file))))
		  week))
      (message "%s" file)
      (delete-file file))))

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;(add-hook 'go-mode-hook 'go-guru-hl-identifier-mode)
(electric-pair-mode 1)

(validate-setq fill-column 80)
(show-paren-mode t)
(column-number-mode t)
(validate-setq visible-bell t)
(validate-setq inhibit-startup-message t)
(validate-setq version-control t)
(validate-setq kept-old-versions 2)
(validate-setq kept-new-versions 3)
(validate-setq delete-old-versions t)
(validate-setq backup-by-copying t)

(validate-setq user-login-name "pgreco")
(validate-setq user-full-name "Patrik Greco")
(validate-setq user-mail-address "sikevux@sikevux.se")

(display-time-mode t)
(display-battery-mode t)
(validate-setq display-time-day-and-date t)
(validate-setq display-time-24hr-format t)

(validate-setq require-final-newline t)
(validate-setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)
(global-flycheck-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;; C/C++/Java
(setq-default c-basic-offset 2)
(global-set-key (kbd "TAB") 'tab-to-tab-stop)

;; (load "/usr/share/emacs/site-lisp/site-start.d/clang-format.el")
(require 'clang-format)
(global-set-key [C-s-tab] 'clang-format-region)

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/site-start.d/")
;; (require 'clang-include-fixer)


;; This lets me say where my temp dir is.
(validate-setq temporary-file-directory "~/.emacs.d/tmp/")

;;; Autoupdate
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))


;;; Yaml
(use-package yaml-mode                  ; YAML
	     :ensure t
	     :defer t
	     :config
	     (add-hook 'yaml-mode-hook
		       (lambda () (run-hooks 'prog-mode-hook))))

;;; JSON
(use-package json-mode                  ; JSON files
	     :ensure t
	     :defer t
	     :config
	     (add-hook 'json-mode-hook
		       ;; Fix JSON mode indentation
		       (lambda () (setq-local js-indent-level 4))))


;;; elisp
(bind-key "C-c t d" #'toggle-debug-on-error)

					; Convert regexps to RX and back
(use-package pcre2el
	     :disabled t
	     :ensure t
	     :init (rxt-global-mode))

					; Emacs Lisp REPL
(use-package ielm
	     :bind (("C-c a '" . ielm)))

					; Emacs Lisp editing
(use-package elisp-mode
	     :defer t
	     :interpreter ("emacs" . emacs-lisp-mode)
	     :bind (:map emacs-lisp-mode-map
			 ("C-c m e r" . eval-region)
			 ("C-c m e b" . eval-buffer)
			 ("C-c m e e" . eval-last-sexp)
			 ("C-c m e f" . eval-defun)))

(defun er-remove-elc-on-save ()
  "If you're saving an Emacs Lisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))

(add-hook 'emacs-lisp-mode-hook 'er-remove-elc-on-save)


;;; Shell (ZSH, Bash, sh)
					; Shell scripts
(use-package sh-script
	     :defer t
	     :mode ("\\.zsh\\'" . sh-mode)
	     :config
	     ;; Use four spaces in shell scripts.
	     (validate-setq
	      sh-indentation 4
	      sh-basic-offset 4
	      ))

;;; Python
					; Python editing
(use-package python
	     :defer t
	     :config
	     ;; PEP 8 compliant filling rules, 79 chars maximum
	     (add-hook 'python-mode-hook
		       (lambda () (validate-setq fill-column 79)))
	     (add-hook 'python-mode-hook
		       (lambda ()
			 (setq tab-width 4)
			 (setq python-indent-offset 4))))
;;	     (add-hook 'python-mode-hook #'subword-mode)


;(use-package flycheck-virtualenv        ; Setup Flycheck by virtualenv
;	     :load-path "lisp/"
;	     :after python
;	     :commands (flycheck-virtualenv-setup)
;	     :config (add-hook 'python-mode-hook #'flycheck-virtualenv-setup))

(use-package anaconda-mode              ; Powerful Python backend for Emacs
	     :ensure t
	     :defer t
	     :init (add-hook 'python-mode-hook #'anaconda-mode))

(use-package company-anaconda           ; Python backend for Company
	     :ensure t
	     :after company
	     :config (add-to-list 'company-backends 'company-anaconda))

(use-package pip-requirements           ; requirements.txt files
	     :ensure t
	     :defer t)

;; Configure flymake for Python
;(when (load "flymake" t)
;  (defun flymake-pylint-init ()
;    (let* ((temp-file (flymake-proc-init-create-temp-buffer-copy
;		       'flymake-create-temp-inplace))
;	   (local-file (file-relative-name
;			temp-file
;			(file-name-directory buffer-file-name))))
;      (list "epylint" (list local-file))))
;  (add-to-list 'flymake-allowed-file-name-masks
;	       '("\\.py\\'" flymake-pylint-init)))

;; Set as a minor mode for Python
;(add-hook 'python-mode-hook '(lambda () (flymake-mode)))

;; Configure to wait a bit longer after edits before starting
(setq-default flymake-no-changes-timeout '3)

;; Keymaps to navigate to the errors
;(add-hook 'python-mode-hook
;	  '(lambda ()
;	     (define-key python-mode-map "\C-cn" 'flymake-goto-next-error)))
;(add-hook 'python-mode-hook
;	  '(lambda ()
;	     (define-key python-mode-map "\C-cp" 'flymake-goto-prev-error)))

(load-theme 'darktooth t)

(add-to-list 'auto-mode-alist '("\\.plist\\'" . xml-mode))

;;; init.el ends here
