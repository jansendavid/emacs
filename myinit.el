(tool-bar-mode -1)
(setq inhibit-startup-screen t)

(use-package org-bullets
      :ensure t
      :config
      (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
    (setq org-src-window-setup 'current-window)
  (add-to-list 'org-structure-template-alist
	       '("el" "#+BEGIN_SRC emacs-lisp\n?#+END_SRC")
)
(add-hook 'org-mode-hook 'org-indent-mode)

(require 'ein)
;;(exec-path-from-shell-copy-env "/home/david/anaconda2/bin/ipython" )
;;(setq elpy-rpc-python-command "/home/david/anaconda2/bin/ipython")

(elpy-enable)
(add-hook 'python-mode-hook 'elpy-mode)
(with-eval-after-load 'elpy
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (add-hook 'elpy-mode-hook 'elpy-use-ipython "ipython3")
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
;(elpy-use-ipython "/home/david/anaconda2/bin/ipython")
(defvar myPackages
  '(better-defaults
    ein ;; add the ein package (Emacs ipython notebook)
    elpy
    flycheck
    material-theme
    py-autopep8))

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(setq ein:jupyter-default-server-command "/home/david/anaconda2/bin/jupyter")
(setq ein:jupyter-server-args (list "--no-browser"))

(use-package counsel
:ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))




  (use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

  (use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))
(use-package avy
:ensure t
:bind ("M-s" . avy-goto-word-1)) ;; changed from char as per jcs

(use-package which-key
:ensure t
:init
(which-key-mode))

(require 'ggtags)
 (add-hook 'c-mode-common-hook
           (lambda ()
             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

 (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;(setq package-enable-at-startup nil)
;(require 'ido)
;(ido-mode t)
					  ; load auto-complete
  ;; (require 'auto-complete)
  ;; (require 'auto-complete-config)
  ;; (ac-config-default)
  ;; 					  ; start auto complete
  ;; (global-auto-complete-mode t)

; start auto-complete with emacs
;; auto-complete
;; C++ auto completion mode
 ;; (require 'auto-complete)
 ;; (require 'auto-complete-config)
 ;; (ac-config-default)
 ;; ;a function which initializes auto-complete-c-headers and get called for c/c++ hooks
 ;;  (defun my:ac-c-header-init ()
 ;;    (require 'auto-complete-c-headers)
 ;;    (add-to-list 'ac-sources 'ac-source-c-headers)
 ;;    (add-to-list 'achead:include-directories '"/usr/include/c++/6
 ;;   /usr/include/x86_64-linux-gnu/c++/6 
 ;;   /usr/include/c++/6/backward
 ;;   /usr/lib/gcc/x86_64-linux-gnu/6/include
 ;;   /usr/local/include
 ;;   /usr/lib/gcc/x86_64-linux-gnu/6/include-fixed
 ;;   /usr/include/x86_64-linux-gnu
 ;;   /usr/include"
 ;;       )
 ;;    )
 ;;  (add-hook 'c++-mode-hook 'my:ac-c-header-init)
 ;;  (add-hook 'c-mode-hook 'my:ac-c-header-init)
 ;;  ;; semantic mode
 ;;  (semantic-mode 1)
 ;; (defun my:add-semantic-to-autocomplete()
 ;;   (add-to-list 'ac-sources 'ac-source-semantic))
 ;; (add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
 ;; (global-semantic-idle-scheduler-mode 1)

(setq package-enable-at-startup nil)
(require 'ido)
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(ido-mode t)

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(use-package yasnippet
    :ensure t
    :config (use-package yasnippet-snippets
              :ensure t)
    (yas-reload-all))
(yas-global-mode 1)
  ;(add-hook 'c++-mode-hook 'yas-minor-mode)
  ;(add-hook 'lisp-mode-hook 'yas-minor-mode)
  ;(add-hook 'python-mode-hook 'yas-minor-mode)

;(require 'smartparens-config)
;(add-hook 'prog-mode-hook 'smartparens-mode)

;;(add-hook 'prog-mode-hook 'linum-mode)

(show-paren-mode 1)

(global-hl-line-mode +1)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(auto-compression-mode 1)

(setq calendar-week-start-day 1)
(setq european-calendar-style 't)
(diary)

(global-set-key "\C-x\C-k0" 'uncomment-region)



;;; Anpassungen für AUCTeX
   ;-----------;
   ;;; LaTeX ;;;
   ;-----------;

 (setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)
(require 'flymake)

(defun flymake-get-tex-args (file-name)
(list "pdflatex"
(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(add-hook 'LaTeX-mode-hook 'flymake-mode)
(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)


(defun turn-on-outline-minor-mode ()
(outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o") ; Or something else
(require 'tex-site)
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
;; (add-hook 'reftex-load-hook 'imenu-add-menubar-index)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq LaTeX-eqnarray-label "eq"
LaTeX-equation-label "eq"
LaTeX-figure-label "fig"
LaTeX-table-label "tab"
LaTeX-myChapter-label "chap"
TeX-auto-save t
TeX-newline-function 'reindent-then-newline-and-indent
TeX-parse-self t
TeX-style-path
'("style/" "auto/"
"/usr/share/emacs21/site-lisp/auctex/style/"
"/var/lib/auctex/emacs21/"
"/usr/local/share/emacs/site-lisp/auctex/style/")
LaTeX-section-hook
'(LaTeX-section-heading
LaTeX-section-title
LaTeX-section-toc
LaTeX-section-section
LaTeX-section-label))

;;        (require 'irony)
       ;;        (add-hook 'c++-mode-hook 'irony-mode)
       ;;        (add-hook 'c-mode-hook 'irony-mode)
       ;;        (add-hook 'objc-mode-hook 'irony-mode)

       ;;        (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
       ;;        (require 'company-irony-c-headers)
       ;; ;; Load with `irony-mode` as a grouped backend
       ;; (eval-after-load 'company
       ;;   '(add-to-list
       ;;     'company-backends '(company-irony-c-headers company-irony)))
       ;; (setq irony-additional-clang-options '("-std=c++11"
       ;;                        "-I//usr/include/c++/4.7/"))
       (use-package company-irony
         :ensure t
         :config(require 'company)
         (add-to-list 'company-backend 'company-irony))
       (use-package irony
         :ensure t
         :config
         (add-hook 'c++-mode-hook 'irony-mode)
         (add-hook 'c-mode-hook 'irony-mode)
         (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
         )
;(with-eval-after-load 'company
;(add-hook '')) Extend if necissary,

;; (require 'cc-mode)
;; (require 'auto-complete-clang)
;; (define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)
;; (require 'company)
;; (require 'company-c-headers)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq company-backends (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
;; ;;company-c-headers

;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/7/")


;;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")
(use-package company
  :ensure 
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (with-eval-after-load 'company
      (define-key company-active-map (kbd "M-n") nil)
      (define-key company-active-map (kbd "M-p") nil)
      (define-key company-active-map (kbd "C-n") #'company-select-next)
      (define-key company-active-map (kbd "C-p") #'company-select-previous))
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(defvar my-term-shell "/bin/bash")
  (defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)
(defalias 'yes-or-no-p 'y-or-n-p)
(when window-system (global-hl-line-mode t))

(use-package beacon
:ensure t
:init
(beacon-mode 1))

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-verticle-define-keys 'C-n-and-C-p-only)

;(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

;(global-set-key (kbd "C-x b") 'ibuffer)

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/myinit.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-treshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s " "d" "f" "h" "j" "k" "l"))
  :bind
  ([remap other-window] . switch-window))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(setq electric-pair-pairs '(
			      (?\( . ?\))
			      (?\[ . ?\])
			      (?\{ . ?\})
			      (?\' . ?\')
  ))
(electric-pair-mode t)

(global-subword-mode 1)

(defun copy-whole-line ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))
(global-set-key (kbd "C-c w l") 'copy-whole-line)

(use-package hungry-delete
  :ensure t
  :config (global-hungry-delete-mode))

(line-number-mode 1)
(column-number-mode 1)



(use-package rainbow-delimiters
    :ensure t
    :init
(rainbow-delimiters-mode 1))
 (use-package rainbow-mode
    :ensure t
    :init (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 10)))
  (setq dashboard-banner-logo-title "hello"))

(setq display-time-24hr-format t)
(display-time-mode t)

(use-package dmenu
  :ensure t
  :bind
  ("s-SPC" . 'dmenu))

(use-package symon
    :ensure t
    :bind("s-h" . symon-mode))

;; (use-package exwm
;;   :ensure t
;;   :config(require 'exwm-config)
;;   (exwm-config-default))

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

(use-package mark-multiple
  :ensure t
  :bind("C-c q" . 'mark-next-like-this))
(use-package expand-region
  :ensure t
  :bind( "C-q" . 'er/expand-region))

;;   (when window-system
;;     (use-package pretty-mode
;;     :ensure t
;;     :config
;; (global-pretty-mode t)))
