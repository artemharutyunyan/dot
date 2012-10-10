(setq linum-format "%3d ")
(global-linum-mode 1)

(setq tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(setq-default indent-tabs-mode nil)

(setq c-basic-offset 4)

;; get rid of unecessary bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(show-paren-mode t)
(column-number-mode t)


(add-to-list 'load-path "~/emacs.d/site-lisp/color-theme")
(add-to-list 'load-path "~/emacs.d/site-lisp/emacs-colors-solarized")

(if (require 'color-theme-solarized "color-theme-solarized.el" t)
    (color-theme-solarized-dark))

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.

(make-directory "~/.emacs.d/autosaves/" t)

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; erlang
(setq erlang-otp-root       "/opt/erlang/r15b02")
(setq erlang-tools-version  "2.6.8")

(setq load-path (cons (format "%s/%s-%s/%s" erlang-otp-root "lib/tools" erlang-tools-version "emacs") load-path))
(setq erlang-root-dir erlang-otp-root)
(setq exec-path (cons (format "%s/%s" erlang-otp-root "bin") exec-path))
(require 'erlang-start)

;; Shell
(global-set-key [f1] 'shell)

;; Mouse 
(xterm-mouse-mode)