;;; Run from the repository root. Successful execution exits with status 23.
(require :asdf)
(asdf:load-asd (truename "parachute.asd"))
(asdf:load-system :parachute)
(parachute::quit 23)
(error "PARACHUTE::QUIT returned instead of exiting")
