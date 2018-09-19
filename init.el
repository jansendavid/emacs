(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-irony pretty-mode rainbow-mode expand-region mark-multiple popup-kill-ring exwm symon dmenu dashboard rainbow-delimiters hungry-delete switch-window ido-vertical-mode ido-verticle-mode smex beacon which-key yasnippet yasnippet-snippets company-irony-c-headers irony auto-complete-clang auto-complete-auctex writegood-mode auctex ac-math tramp-term ac-c-headers flycheck auto-complete-c-headers ggtags ein py-autopep8 elpy swiper auto-complete use-package org-bullets org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 200 :width normal :foundry "DAMA" :family "Ubuntu Mono")))))
