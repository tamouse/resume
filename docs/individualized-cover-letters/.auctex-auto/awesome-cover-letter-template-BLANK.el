(TeX-add-style-hook
 "awesome-cover-letter-template-BLANK"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("awesome-cv" "11pt" "a4paper")))
   (TeX-run-style-hooks
    "latex2e"
    "awesome-cv"
    "awesome-cv11"))
 :latex)

