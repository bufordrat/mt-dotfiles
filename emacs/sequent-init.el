;; bitmap font stuff for sequent
(defconst matt-default-font "Bok Montecarlo 12")
(add-to-list 'default-frame-alist (cons 'font matt-default-font))
(set-face-font 'default matt-default-font)

;; font toggling for sequent
(defvar matt-embiggened-yet nil)
(defun embiggen ()
  "set font for Emacs when menu-set-font can't see it"
  (interactive)
  (if matt-embiggened-yet
      (set-face-font 'default matt-default-font)
    (set-face-font 'default "Misc Fixed 18"))
  (setq matt-embiggened-yet (not matt-embiggened-yet)))
(global-set-key (kbd "<f10>") 'embiggen)

;; load pdf tools
(pdf-loader-install)

;; dired icons & doom modeline
(require 'nerd-icons)
(require 'nerd-icons-dired)
(gui-mode 1)
(setopt doom-modeline-hud t)
(setopt doom-modeline-minor-modes t)
(setopt doom-modeline-window-width-limit 60)

;; setopts
(setopt org-file-apps
   '((auto-mode . emacs)
     (directory . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . "firefox %s")
     ("\\.pdf\\'" . default)))
(setopt shell-file-name "/usr/bin/zsh")
(setopt x-super-keysym 'meta)
(setopt browse-url-secondary-browser-function 'browse-url-firefox)

;; xclip
(xclip-mode 1)
