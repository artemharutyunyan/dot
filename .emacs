(setq linum-format "%3d ")
(global-linum-mode 1)

(setq tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(setq-default indent-tabs-mode nil)

(setq c-basic-offset 4)

;; get rid of unecessary bars
(menu-bar-mode -1)
(show-paren-mode t)
(column-number-mode t)


;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Shell
(global-set-key [f1] 'eshell)

;; Mouse
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

;; Scrolling
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))

(global-set-key (kbd "<mouse-4>") 'down-slightly)
(global-set-key (kbd "<mouse-5>") 'up-slightly)

;; Symlinks
(setq vc-follow-symlinks 1)

;; Goto line
(global-set-key "\C-l" 'goto-line)

;; Word wrap
(add-hook 'text-move-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook '(lambda() (set-fill-column 78)))


;; Buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;(add-to-list 'load-path "~/emacs.d/site-lisp/color-theme")
(add-to-list 'custom-theme-load-path "~/emacs.d/site-lisp/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)

;; Smooth scroll
(add-to-list 'load-path "~/emacs.d/site-lisp/smooth-scroll")
(require 'smooth-scroll)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
 (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(ido-mode t)

(global-set-key [home] 'move-beginning-of-line)
(global-set-key [end] 'move-end-of-line)

(setq-default show-trailing-whitespace t)

(load "~/emacs.d/site-lisp/clang-format/clang-format.el")
(global-set-key [f2] 'clang-format-region)

(load "~/emacs.d/site-lisp/markdown-mode/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
 (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
 (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
 (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
