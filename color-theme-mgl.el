;;; color-theme-mgl.el --- Emacs 24 theme based on too many other themes to list
;;; Author: Gábor Melis <mega@retes.hu>
;;; Url: https://github.com/melisgl/color-theme-mgl
;;; Version: 20141115.2020
;;; Package-Requires: ((emacs "24.1"))

;;; Changelog:
;;
;; 20150317.0213: - initial version

;;; License: MIT

;;; Commentary:
;;
;; To use it, put the following in your Emacs configuration file:
;;
;;   (add-to-list 'custom-theme-load-path "<path-to>/color-theme-mgl/")
;;
;;   (load-theme 'mgl-dark t)
;;
;; or
;;
;;   (load-theme 'mgl-light t)
;;
;; Requirements: Emacs 24.

(unless (>= emacs-major-version 24)
  (error "color-theme-mgl requires Emacs 24 or later."))

(defun mgl-hsv-to-rgb (h s v)
  "Convert HSV color representation to RGB. H is in [0, 360]. S
and V are in [0, 255]."
  (let* ((s (/ s 255.0))
         (v (/ v 255.0))
         (c (* s v))
         (h (/ h 60.0))
         (x (* c (- 1 (abs (- (mod h 2) 1)))))
         (m (- v c)))
    (cond ((and (<= 0 h) (< h 1))
           (list (+ m c) (+ m x) m))
          ((< h 2)
           (list (+ m x) (+ m c) m))
          ((< h 3)
           (list m (+ m c) (+ m x)))
          ((< h 4)
           (list m (+ m x) (+ m c)))
          ((< h 5)
           (list (+ m x) m (+ m c)))
          ((< h 6)
           (list (+ m c) m (+ m x)))
          (t
           (error "~S" h)))))

(defun mgl-rgb-to-html (r g b)
  (format "#%02X%02X%02X" (min 255 (* 256 r))
          (min 255 (* 256 g)) (min 255 (* 256 b))))

(defun mgl-hsv-to-html (h s v)
  (apply #'mgl-rgb-to-html (mgl-hsv-to-rgb h s v)))

(defun color-theme-mgl (theme-name)
  (custom-theme-set-faces
   theme-name
   ;; basic faces
   `(default ((t (:background ,background :foreground ,foreground))))
   `(link ((t (:foreground ,blue :underline t))))
   `(link-visited ((t (:foreground ,purple :underline t))))
   `(header-line ((t (:background ,alt-background :foreground ,foreground))))
   `(highlight ((t (:background ,background-high-2))))
   `(region ((t (:background ,background-high-1))))
   `(secondary-selection ((t (:background ,background-high-0))))
   `(mode-line
     ((t (:background ,background-low :foreground ,foreground-low-3))))
   `(mode-line-inactive
     ((t (:background ,dead :foreground ,background-low))))
   `(fringe ((t (:background ,background))))
   `(minibuffer-prompt ((t (:foreground ,orange :weight bold))))
   `(cursor ((t (:background ,foreground :foreground ,background))))
   `(error ((t (:foreground ,red))))
   `(warning ((t (:foreground ,orange))))
   `(success ((t (:foreground ,green))))
   `(trailing-whitespace ((t (:background ,red :foregound ,white))))
   ;; button
   `(button ((t (:underline t))))
   ;; isearch
   `(isearch ((t (:inherit warning :background ,background-high-2 :bold t))))
   `(isearch-fail ((t (:background ,red :foreground ,white))))
   `(lazy-highlight ((t (:inherit default :background ,background-high-2))))
   ;; replace
   `(match ((t (:inherit minibuffer-prompt))))
   ;; font-lock
   `(font-lock-builtin-face ((t (:foreground ,2nd-foreground))))
   `(font-lock-comment-face ((t (:slant italic :foreground ,foreground-low-3))))
   `(font-lock-comment-delimiter-face
     ((t (:slant italic :foreground ,foreground-low-3))))
   `(font-lock-constant-face ((t (:foreground ,2nd-foreground-low-1))))
   `(font-lock-function-name-face ((t (:foreground ,foreground-low-1))))
   `(font-lock-keyword-face ((t (:foreground ,foreground-low-2))))
   `(font-lock-string-face ((t (:foreground ,3rd-foreground))))
   `(font-lock-doc-face ((t (:foreground ,3rd-foreground))))
   `(font-lock-type-face ((t (:foreground ,foreground-high-1))))
   `(font-lock-variable-name-face ((t (:foreground ,2nd-foreground-high-1))))
   `(font-lock-warning-face ((t (:inherit error))))
   ;; outline
   `(outline-1 ((t (:inherit nil :foreground ,foreground-low-1))))
   `(outline-2 ((t (:inherit nil :foreground ,foreground-low-2))))
   `(outline-3 ((t (:inherit nil :foreground ,foreground-low-3))))
   `(outline-4 ((t (:inherit nil :foreground ,2nd-foreground))))
   `(outline-5 ((t (:inherit nil :foreground ,2nd-foreground-low-1))))
   `(outline-6 ((t (:inherit outline-1))))
   `(outline-7 ((t (:inherit outline-2))))
   `(outline-8 ((t (:inherit outline-3))))
   ;; org
   `(org-level-1 ((t (:inherit outline-1))))
   `(org-level-2 ((t (:inherit outline-2))))
   `(org-level-3 ((t (:inherit outline-3))))
   `(org-level-4 ((t (:inherit outline-4))))
   `(org-level-5 ((t (:inherit outline-5))))
   `(org-level-6 ((t (:inherit outline-6))))
   `(org-level-7 ((t (:inherit outline-7))))
   `(org-level-8 ((t (:inherit outline-8))))
   `(org-link ((t (:inherit outline-5 :underline t))))
   ;; gnus
   `(gnus-group-mail-1 ((t (:inherit outline-1 :bold t))))
   `(gnus-group-mail-1-empty ((t (:inherit outline-3))))
   `(gnus-group-mail-2 ((t (:inherit outline-2 :bold t))))
   `(gnus-group-mail-2-empty ((t (:inherit outline-3))))
   `(gnus-group-mail-3 ((t (:inherit outline-3 :bold t))))
   `(gnus-group-mail-3-empty ((t (:inherit outline-3))))
   `(gnus-group-news-1 ((t (:foreground nil :inherit gnus-group-mail-1))))
   `(gnus-group-news-1-empty
     ((t (:foreground nil :inherit gnus-group-mail-1-empty))))
   `(gnus-group-news-2 ((t (:foreground nil :inherit gnus-group-mail-2))))
   `(gnus-group-news-2-empty
     ((t (:foreground nil :inherit gnus-group-mail-2-empty))))
   `(gnus-group-news-3 ((t (:foreground nil :inherit gnus-group-mail-3))))
   `(gnus-group-news-3-empty
     ((t (:foreground nil :inherit gnus-group-mail-3-empty))))
   `(gnus-header-name ((t (:inherit outline-4))))
   `(gnus-header-subject ((t (:inherit outline-1))))
   `(gnus-header-from ((t (:inherit outline-4))))
   `(gnus-header-content ((t (:inherit outline-2))))
   `(gnus-signature ((t nil)))
   `(gnus-summary-cancelled ((t (:inherit outline-3))))
   `(gnus-summary-normal-ancient ((t (:inherit outline-4))))
   `(gnus-summary-normal-read ((t (:inherit outline-5))))
   `(gnus-summary-normal-unread ((t (:inherit outline-1 :weight bold))))
   `(gnus-summary-selected ((t (:inverse-video t))))
   `(gnus-summary-stripe ((t (:background ,background-high-0))))
   `(gnus-summary-normal-ticked ((t (:inherit error))))
   `(gnus-button ((t (:inherit outline-2))))
   `(spam ((t (:foreground ,dead))))
   `(gnus-cite-1 ((t (:inherit outline-1))))
   `(gnus-cite-2 ((t (:inherit outline-2))))
   `(gnus-cite-3 ((t (:inherit outline-3))))
   `(gnus-cite-4 ((t (:inherit outline-4))))
   `(gnus-cite-5 ((t (:inherit outline-5))))
   `(gnus-cite-6 ((t (:inherit outline-6))))
   `(gnus-cite-7 ((t (:inherit outline-7))))
   `(gnus-cite-8 ((t (:inherit outline-8))))
   `(gnus-cite-9 ((t (:inherit outline-1))))
   `(gnus-cite-10 ((t (:inherit outline-2))))
   `(gnus-cite-11 ((t (:inherit outline-3))))
   ;; gnus-notify
   `(gnus-notify-mode-line-face
     ((t (:foreground ,2nd-foreground-high-1 :weight bold))))
   ;; message
   `(message-header-to ((t (:inherit outline-1))))
   `(message-header-cc ((t (:inherit outline-2))))
   `(message-header-name ((t (:inherit outline-4))))
   `(message-header-newsgroups ((t (:inherit outline-4))))
   `(message-header-other ((t (:inherit outline-5))))
   `(message-header-subject ((t (:inherit outline-1))))
   `(message-separator ((t (:inherit outline-3))))
   ;; erc
   `(erc-direct-msg-face ((t (:foreground ,orange))))
   `(erc-error-face ((t (:foreground ,red))))
   `(erc-header-face
    ( (t (:foreground ,foreground :background ,alt-background))))
   `(erc-input-face ((t (:foreground ,green))))
   `(erc-keyword-face ((t (:foreground ,foreground-low-1))))
   `(erc-current-nick-face ((t (:foreground ,green))))
   `(erc-my-nick-face ((t (:foreground ,green))))
   ;; This conflicts with the nick coloring hack.
   ;; `(erc-nick-default-face ((t (:weight normal :foreground ,purple))))
   `(erc-nick-msg-face ((t (:weight normal :foreground ,foreground-low-2))))
   `(erc-notice-face ((t (:foreground ,foreground-low-3))))
   `(erc-pal-face ((t (:inherit warning))))
   `(erc-prompt-face ((t (:foreground ,2nd-foreground-low-1))))
   `(erc-timestamp-face ((t (:foreground ,2nd-foreground))))
   ;; magit
   `(magit-branch ((t (:inherit outline-1))))
   `(magit-diff-add ((t (:inherit success))))
   `(magit-diff-del ((t (:inherit error))))
   `(magit-log-sha1 ((t (:foreground ,foreground-low-3))))
   `(magit-log-message ((t (:foreground ,foreground))))
   `(magit-item-highlight ((t (:background ,background-high-0))))
   `(magit-section-title ((t (:inherit outline-2))))
   ;; slime
   `(sldb-topline-face ((t (:inherit error))))
   `(sldb-condition-face ((t (:inherit error))))
   `(sldb-restartable-frame-line-face ((t (:inherit success))))
   `(slime-repl-inputed-output-face ((t (:inherit outline-1))))))

(provide 'color-theme-mgl)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:

;;; color-theme-mgl.el ends here
