
 (define-data-var high-score
        ;; Tuple type definition:
        {
            score: uint,
            who: (optional principal),
            at-height: uint
        }
        ;; Tuple value:
        {
            score: u0,
            who: none,
            at-height: u0
        }
    )

;; Print the initial value.
(print (var-get high-score))

;; Change the value.
(var-set high-score
    {score: u10, who: (some tx-sender), at-height: block-height}
)

;; Print the new value.
(print (var-get high-score))