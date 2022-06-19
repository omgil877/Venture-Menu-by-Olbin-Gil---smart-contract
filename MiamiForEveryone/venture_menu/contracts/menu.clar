
;; menu
;; <people buying food items>


(define-constant restaurant 'ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5)



(define-map menu uint {food-item: (string-ascii 500), price: uint})

(map-set menu u1 {food-item: "pizza", price: u100})
(map-set menu u2 {food-item: "burger", price: u200})
(map-set menu u3 {food-item: "sushi", price: u150})
(map-set menu u4 {food-item: "pasta", price: u170})
(map-set menu u5 {food-item: "steak", price: u300})
(map-set menu u6 {food-item: "salad", price: u50})
(map-set menu u7 {food-item: "water", price: u20})

(define-map order uint (list 20 uint))

(define-data-var order-id uint u0) ;;does variable stays as u0 after being deployed?
(define-data-var totalOrder-price uint u0)
(define-map loopOrder uint {food-item: (string-ascii 500), price: uint})
(define-data-var loopPrice uint u0)

(define-public (add-to-order (menu-ids (list 20 uint)))
    (begin 
        ;; create a new order id 
        (var-set order-id (+ (var-get order-id) u1))

        (map-set order (var-get order-id) menu-ids)

       (print (var-get order-id))
       (print (map-get? order (var-get order-id)))

        (ok "order created")
    )

)


(define-read-only (get-food-info (food-id uint)) 
    (map-get? menu food-id)
)

(define-read-only (get-order-info) 

    (map-get? order (var-get order-id))

)

(define-private (get-price (menu-id uint)) 
    (let
        (
            (current-menu (unwrap-panic (map-get? menu menu-id)))
        )
        (get price current-menu)
    ) 
)

(define-public (getting-price-food-paying (id uint) (sender principal)) 

    (let
        (
            (menu-ids (unwrap! (map-get? order id) (err u20000)))

            (prices (map get-price menu-ids))
            
            (total-price (fold + prices u0))
        )

        (try! (stx-transfer? total-price sender restaurant))
        (ok "transaction completed")
    )
    
)


