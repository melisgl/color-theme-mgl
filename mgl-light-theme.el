(require 'color-theme-mgl
         (locate-file "color-theme-mgl.el" custom-theme-load-path
                      '("c" "")))
(deftheme mgl-light
  "A light background theme.")
(let ((background-low        (mgl-hsv-to-html  36   0 255))
      (background            (mgl-hsv-to-html  36   5 250))
      (background-high-0     (mgl-hsv-to-html  36  10 235))
      (background-high-1     (mgl-hsv-to-html  36  20 216))
      (background-high-2     (mgl-hsv-to-html  36  40 204))
      (alt-background        (mgl-hsv-to-html   0  0  150))
      (foreground-low-3      (mgl-hsv-to-html  36 120  88))
      (foreground-low-2      (mgl-hsv-to-html  36 175 99))
      (foreground-low-1      (mgl-hsv-to-html  36 243 107))
      (foreground            (mgl-hsv-to-html  36 218  33))
      (foreground-high-1     (mgl-hsv-to-html  36 240  25))
      (2nd-foreground-low-1  (mgl-hsv-to-html 216 120  88))
      (2nd-foreground        (mgl-hsv-to-html 216 150 150))
      (2nd-foreground-high-1 (mgl-hsv-to-html 216 200 200))
      (3rd-foreground        (mgl-hsv-to-html  70 210 90))
      (red                   (mgl-hsv-to-html   0 210 120))
      (orange                (mgl-hsv-to-html  24 220 180))
      (green                 (mgl-hsv-to-html  70 210 90))
      (blue                  "blue")
      (purple                "purple")
      (white                 "white"))
  (color-theme-mgl 'mgl-light))
(provide-theme 'mgl-light)
