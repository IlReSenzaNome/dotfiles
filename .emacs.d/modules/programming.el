;; -*- lexical-binding: t; -*-

;; ================
;; Language Support
;; ================

(use-package yaml-mode
  :mode "\\.yml\\'")

(use-package gnuplot
  :mode "\\.plt\\'")

(use-package gdscript-mode
  :mode "\\.gd\\'")

(use-package glsl-mode
  :mode "\\.glsl\\'")
 
(use-package rust-mode
  :mode "\\.rs\\'")

(use-package lua-mode
  :mode "\\.lua\\'"
  :custom
  (lua-indent-nested-block-content-align nil)
  (lua-indent-close-paren-align nil)
  (lua-indent-level 2)
  :config
  (defun lua-at-most-one-indent (old-function &rest arguments)
    (let ((old-res (apply old-function arguments)))
      (if (> old-res lua-indent-level) lua-indent-level old-res)))

  (advice-add #'lua-calculate-indentation-block-modifier
              :around #'lua-at-most-one-indent))

(use-package typescript-mode
  :mode "\\.ts\\'")

(use-package simple-httpd)
(use-package js2-mode
  :mode "\\.js\\'")

(use-package emmet-mode
  :mode "\\.html'")

;; For Emacs Lisp
(use-package highlight-defined
  :hook (emacs-lisp-mode . highlight-defined-mode))

;; ================
;; Editing Experience
;; ================

(use-package format-all
  :load-path "modules/extern"
  :commands (format-all-buffer format-all-mode))

;; Find bookmarks, files, many other things
(use-package consult
 :after vertico
 :bind (("C-c f"  . consult-find)
        ("C-c b"  . consult-buffer)
        ("C-c B" . consult-bookmark)
        ("C-c if" . consult-grep)
        ("C-c man"  . consult-man))
 :custom
 (consult-find-args "find .")
 (consult-project-root-function
      (lambda ()
        (when-let (project (project-current))
          (car (project-roots project))))))

;; Fuzzy Finding when using M-x 
(use-package hotfuzz
  :after vertico
  :custom
  (completion-styles '(hotfuzz)))

;; Automate insertion of parenthesis
;; and indentation while editing Lisp code
(use-package parinfer-rust-mode
  :unless noninteractive
  :hook (emacs-lisp-mode . parinfer-rust-mode)
  :custom
  (parinfer-rust-library (expand-file-name "var/parinfer-rust-linux.so" user-emacs-directory)))

;; Highlight Color Codes
(use-package rainbow-mode
  :hook ((css-mode . rainbow-mode)
         (nxml-mode . rainbow-mode)
         (conf-mode . rainbow-mode)))

(use-package hl-todo
  :commands hl-todo-mode
  :hook (prog-mode . hl-todo-mode)
  :custom
  (hl-todo-color-background nil)
  (hl-todo-keyword-faces '(("TODO" . "#032f62")
                           ("NOTE" . "#ffc86f"))))

;; Code Folding
(use-package origami
  :after evil
  :unless noninteractive
  :config
  (add-hook 'prog-mode-hook (lambda ()
                              (setq-local origami-fold-style 'triple-braces)
                              (origami-mode)
                              (origami-close-all-nodes (current-buffer))))
  (defun my/origami-toggle-node ()
    (interactive)
    (save-excursion
      (goto-char (point-at-eol))
      (origami-toggle-node (current-buffer) (point))))
  (evil-define-key 'normal prog-mode-map (kbd "^") 'my/origami-toggle-node))
      

;; Linting
(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :unless noninteractive
  :custom
  (flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(add-hook 'prog-mode-hook (lambda ()
                            (flymake-mode -1)
                            (display-line-numbers-mode 1)))

;; Spell checking in comments
;; (add-hook 'prog-mode-hook (lambda () (flyspell-prog-mode)))

;; Completion
(unless noninteractive
  (require 'lsp))

(provide 'programming)
