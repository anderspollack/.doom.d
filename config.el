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
(setq doom-font (font-spec :family "SF Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "SF Mono" :size 14 :slant 'italic)
      doom-big-font (font-spec :family "SF Mono" :size 24)
      doom-serif-font (font-spec :family "SF Mono" :size 14 :weight 'bold))

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
(after! org-roam
 (setq org-roam-directory (file-truename org-directory)))

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
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; LSP: eglot
;; ensure typescript-language-server, vls, and vscode-css-languageserver-bin is installed with
;; npm install
(define-derived-mode vue-mode web-mode "Vue"
  "A major mode derived from web-mode for editing .vue files with LSP support")
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(add-hook 'vue-mode-hook 'eglot-ensure)

;; vscode-css-languageserver-bin
(after! eglot
  (add-to-list 'eglot-server-programs '(scss-mode "vscode-css-languageserver-bin"))
  (add-to-list 'eglot-server-programs '(web-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(vue-mode "vls"))
  )

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; fix web mode ternary indentation
(after! web-mode
 (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
 )

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

;; windmove with shift + arrow
(windmove-default-keybindings)

;; make evil open splits in the right place
(setq evil-vsplit-window-right t)
(setq evil-split-window-below t)

;; get normal up/down with j/k in evil mode -- alternative method
;; (after! evil
;;   (map! :n "j" 'evil-next-visual-line
;;         :n "k" 'evil-previous-visual-line))

;; disable default fringe style
(setq +vc-gutter-default-style nil)
;; disable background colors of git-gutter fringe
(after! git-gutter-fringe
  (set-face-background 'git-gutter-fr:modified nil)
  (set-face-background 'git-gutter-fr:added    nil)
  (set-face-background 'git-gutter-fr:deleted  nil))
