
(cl:in-package :asdf)

(defsystem "campus_tour-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "NavigationRequest" :depends-on ("_package_NavigationRequest"))
    (:file "_package_NavigationRequest" :depends-on ("_package"))
    (:file "NavigationResponse" :depends-on ("_package_NavigationResponse"))
    (:file "_package_NavigationResponse" :depends-on ("_package"))
  ))