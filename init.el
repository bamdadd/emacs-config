(require 'package)

(add-to-list 'package-archives
                    '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
    (package-refresh-contents))

(defvar myPackages
  '(projectile
    better-defaults
    expand-region
    neotree
    elpy
    jedi
    python-mode
    ein
    exec-path-from-shell
    flycheck ;; add the flycheck package
    material-theme))

(mapc #'(lambda (package)
              (unless (package-installed-p package)
                      (package-install package)))
            myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (material-theme yaml-mode typed-clojure-mode tagedit smex rainbow-identifiers rainbow-delimiters projectile paredit magit ido-ubiquitous exec-path-from-shell elpy clojure-mode-extra-font-locking better-defaults 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(elpy-enable)
(setq python-shell-interpreter "/Users/bdashtba/anaconda3/bin/python")
(load "~/.emacs.d/elpa/python-mode-20170429.55/python-mode.el")
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(setq-default message-log-max 2)


(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Append Path
(exec-path-from-shell-initialize)


;; Jedi
(require 'jedi)
(add-to-list 'ac-sources 'ac-source-jedi-direct)
(add-hook 'pythin-mode-hook 'jedi:setup)

;; Ipython Jupyter
(require 'ein)


;;expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;NeoTree
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f2] 'neotree-toggle)

;; initial window
(setq initial-frame-alist
      '(
        (width . 102) ; character
        (height . 70) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 100) ; character
        (height . 70) ; lines
        ))
