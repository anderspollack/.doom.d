;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Setup initial and default frame sizes
(setq initial-frame-alist
      (append (list '(fullscreen . maximized))))

(setq default-frame-alist
      (append (list '(width  . 90)
                    '(height . 52)
                    '(top . 50)
                    '(left . 30)
                    '(tool-bar-lines . 0)
                    '(vertical-scroll-bars . nil))))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Anders Pollack"
      user-mail-address "pollack.anders@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "SF Mono" :size 13 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "SF Mono" :size 13 :slant 'italic)
      doom-serif-font (font-spec :family "SF Mono" :size 13 :weight 'bold))

(when (file-exists-p "~/.doom.d/banners")
  (setq +doom-dashboard-banner-padding '(8 . 8)
        +doom-dashboard-banner-file "icon-world.png"
        +doom-dashboard-banner-dir "~/.doom.d/banners"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
;; (setq display-line-numbers-type nil)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; web-mode customizations
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
;; below throws an error, so manual ternary adjustment in web-mode it is...
;; (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
;; set up deft
(setq deft-directory "~/org")
(setq deft-recursive t)

;; overwrite text on yank
(delete-selection-mode)

;; enable fine undo
(setq evil-want-fine-undo t)

;; web-mode script tag left padding
(setq web-mode-script-padding 0)

;; web-mode style tag left padding
(setq web-mode-style-padding 0)

(setq js-indent-level 2)

;; easier tab switching with s-[ and s-]
;; (global-set-key (kbd "s-[") '+workspace/switch-left)
;; (global-set-key (kbd "s-]") '+workspace/switch-right)

;; windmove with shift + arrow
(windmove-default-keybindings)

;; make evil open splits in the right place
(setq evil-vsplit-window-right t)
(setq evil-split-window-below t)

;; get normal up/down with j/k in evil mode -- alternative method
;; (after! evil
;;   (map! :n "j" 'evil-next-visual-line
;;         :n "k" 'evil-previous-visual-line))

;; make fringe full width
(setq +vc-gutter-default-style nil)
(fringe-mode nil)
