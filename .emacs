
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (counsel tabbar try use-package ace-window which-key auto-complete-c-headers org elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
					; load auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
					; start auto complete
(global-auto-complete-mode t)
					;start jasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
;; C++ auto completion mode
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;a function which initializes auto-complete-c-headers and get called for c/c++ hooks
(defun my:acc-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"  /usr/include/c++/6
 /usr/include/x86_64-linux-gnu/c++/6
 /usr/include/c++/6/backward
 /usr/lib/gcc/x86_64-linux-gnu/6/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/6/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include"
     )
  )
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(use-package which-key
  :ensure t
  :config (which-key-mode))
(defalias 'list-buffers 'ibuffer)
(defalias 'list-buffers 'ibuffer-other-window)
(use-package try
  :ensure t)
; if you like 
;(use-package tabbar
;	     :ensure t
;	     :config
;	     (tabbar-mode 1))
;; it looks like counsel is a requirement for swiper
(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))
; M-s and than a character then the letter i want
(use-package avy
  :ensure t
  :bind( "M-s" . avy-goto-char))
