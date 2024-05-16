(TeX-add-style-hook
 "blank-cover-letter"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "amsmath"
    "amssymb"
    "iftex"
    "fontenc"
    "inputenc"
    "textcomp"
    "unicode-math"
    "lmodern"
    "upquote"
    "microtype"
    "parskip"
    "xcolor"
    "selnolig"
    "bookmark"
    "hyperref"
    "xurl")
   (TeX-add-symbols
    "tightlist")
   (LaTeX-add-labels
    "career-objectives"
    "role-i-am-seeking"
    "desired-outcomes"
    "constraints"
    "salary"))
 :latex)

