(require 'color-theme-mgl
         (locate-file "color-theme-mgl.el" custom-theme-load-path
                      '("c" "")))

(deftheme mgl-light
  "A light background theme.")

(let ((background-low        (mgl-hsv-to-html  36   0 255))
      (background            (mgl-hsv-to-html  36   5 250))
      (background-high-0     (mgl-hsv-to-html  36  10 235))
      (background-high-1     (mgl-hsv-to-html  36  40 216))
      (background-high-2     (mgl-hsv-to-html  36  60 180))
      (alt-background        (mgl-hsv-to-html   0  0  150))
      (foreground-low-3      (mgl-hsv-to-html  36 150  90))
      (foreground-low-2      (mgl-hsv-to-html  36 200 130))
      (foreground-low-1      (mgl-hsv-to-html  36 255 150))
      (foreground            (mgl-hsv-to-html  36 218  40))
      (foreground-high-1     (mgl-hsv-to-html  36 218   0))
      (2nd-foreground-low-1  (mgl-hsv-to-html 216 120  88))
      (2nd-foreground        (mgl-hsv-to-html 216 150 150))
      (2nd-foreground-high-1 (mgl-hsv-to-html 216 200 200))
      (3rd-foreground        (mgl-hsv-to-html  70 252  79))
      (dead                  (mgl-hsv-to-html   0   0 176))
      (red                   (mgl-hsv-to-html   0 172 125))
      (orange                (mgl-hsv-to-html  24 220 180))
      (green                 (mgl-hsv-to-html  70 252  79))
      (blue                  "blue")
      (purple                "purple")
      (white                 "white"))
  (color-theme-mgl 'mgl-light))

(provide-theme 'mgl-light)
