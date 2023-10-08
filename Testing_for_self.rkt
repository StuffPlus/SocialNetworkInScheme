;; Use this space for free use.
;; Nothing here well be marked.
;; You may copy any numbered item
;; for testing in REPL.

(require racket/string)

(require racket/dict)
(require racket/set)
(require "sn-graph.rkt")
(require "sn-social-network.rkt")
(require "sn-utils.rkt")

(define my-dict
  (list
   (cons 'f2
         (list 'f3 'f4))
   (cons 'f3
         (list 'f2))
   (cons 'f4
         (list 'f3 'f2))
   (cons 'f13
         (list ))
   (cons 'f1
         (list ))
   ))

(define my-dict-2
  (list
   (cons 'f2
         (list 'f3 'f4 'f2 'f56))
   (cons 'f3
         (list 'f2))
   (cons 'f56
         (list 'f3 'f2))
   (cons 'f13
         (list ))
   (cons 'f19
         (list 'f16 'f2))
   ))

;; F1 sn-utils.
;1
(sn-list->dict (list (cons 'k1' v1) (cons 'k2 'v2)))
(sn-list->dict (list (cons 'k3' v3) (cons 'k4 'v4)))

;2
(sn-dict-ks-vs '(k1 k2 k3) '(v1 v2 v3))
(sn-dict-ks-vs '(v1 v2 v3) '(k1 k2 k3))
(sn-dict-ks-vs '(v1 v2) '(k1 k2))
(sn-dict-ks-vs '(v1) '(k1))
;3
(sn-line->entry "A B C D")
(sn-line->entry "G F X Z")
(sn-line->entry "1 2 3 4")


;; F2 sn-graph.
;1
empty
;2
(sn-users my-dict)
(sn-users my-dict-2)
;3
(sn-add-user my-dict 'f5)
(sn-add-user my-dict 'f17)
(sn-add-user my-dict 'f26)
(sn-add-user my-dict-2 'f5)

;4
(sn-add-frndshp my-dict 'f1 'f2)
(sn-add-frndshp my-dict 'f3 'f1)
(sn-add-frndshp my-dict-2 'f13 'f56)

;; F3 sn-social-network
;1
(sn-ff-for my-dict 'f4)
(sn-ff-for my-dict 'f2)
(sn-ff-for my-dict-2 'f56)
;2
(sn-cmn-frnds-btwn my-dict 'f2 'f4)
(sn-cmn-frnds-btwn my-dict 'f1 'f4)
(sn-cmn-frnds-btwn my-dict 'f3 'f4)
(sn-cmn-frnds-btwn my-dict-2 'f56 'f2)
;3
(sn-frnd-cnt my-dict)
(sn-frnd-cnt my-dict-2)
;4
(sn-frndlst-user my-dict)
(sn-frndlst-user my-dict-2)
;5
(sn-unfrndlst-user my-dict)
(sn-unfrndlst-user my-dict-2)