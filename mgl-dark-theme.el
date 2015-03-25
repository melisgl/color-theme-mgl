(require 'color-theme-mgl
         (locate-file "color-theme-mgl.el" custom-theme-load-path
                      '("c" "")))
(deftheme mgl-dark
  "A dark background theme.")
(let ((background-low        (mgl-hsv-to-html   0   0  12))
      (background            (mgl-hsv-to-html   0   0  19))
      (background-high-0     (mgl-hsv-to-html   0   0  34))
      (background-high-1     (mgl-hsv-to-html   0   0  51))
      (background-high-2     (mgl-hsv-to-html   0   0  85))
      (alt-background        (mgl-hsv-to-html  36  90  90))
      (foreground-low-3      (mgl-hsv-to-html  36  90 166))
      (foreground-low-2      (mgl-hsv-to-html  36 144 183))
      (foreground-low-1      (mgl-hsv-to-html  36 180 200))
      (foreground            (mgl-hsv-to-html  36  40 240))
      (foreground-high-1     (mgl-hsv-to-html  36  20 255))
      (2nd-foreground-low-1  (mgl-hsv-to-html 216 146 237))
      (2nd-foreground        (mgl-hsv-to-html 216  40 240))
      (2nd-foreground-high-1 (mgl-hsv-to-html 216  20 255))
      (3rd-foreground        (mgl-hsv-to-html  70 136 188))
      (red                   (mgl-hsv-to-html   0 162 205))
      (orange                (mgl-hsv-to-html  24 255 255))
      (green                 (mgl-hsv-to-html  70 136 188))
      (blue                  "blue")
      (purple                "purple")
      (white                 "white"))
  (color-theme-mgl 'mgl-dark))
(provide-theme 'mgl-dark)
