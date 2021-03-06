(format t "~&Updating ~~/lisp/sbcl.core-graham~&")
(mapc 'require '(sb-bsd-sockets sb-posix sb-introspect sb-cltl2 asdf sb-rotate-byte sb-gmp))
(load "~/quicklisp/setup.lisp")
(ql:update-client :prompt nil)
(ql:update-all-dists :prompt nil)
;; (ql:quickload :swank)
;; (setf *read-default-float-format* 'double-float)
(ql:quickload :alexandria)
(use-package :alexandria)
(ql:quickload :iterate)
(setf iterate::*always-declare-variables* t)
(use-package :iterate)
;; (ql:quickload :cl-ppcre)
;; (ql:quickload :lparallel)
;; (ql:quickload :clml)
;; (ql:quickload :let-over-lambda)
;; (ql:quickload :ironclad)
;; (ql:quickload :drakma)
;; (ql:quickload :cl-json)
(sb-ext:save-lisp-and-die #P"~/lisp/sbcl.core-graham")
;; (swank-loader:dump-image #P"~/lisp/sbcl.core-graham")
;; (quit)
