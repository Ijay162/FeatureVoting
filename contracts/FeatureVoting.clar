;; FeatureVoting: A decentralized platform for product feature prioritization
;; Core Data Structures
(define-map developers principal uint)        ;; Tracks developers and their prioritized features
(define-map features uint uint)               ;; Tracks features and their priority counts
(define-data-var feature-counter uint u0)     ;; Keeps count of total requested features

;; Public function to request a new product feature
(define-public (request-feature)
  (let ((feature-id (+ (var-get feature-counter) u1)))
    (map-set features feature-id u0)          ;; Initialize priority for the new feature to 0
    (var-set feature-counter feature-id)      ;; Increment feature-counter
    (ok feature-id)
  )
)

;; Public function to prioritize a feature
(define-public (prioritize-feature (feature-id uint))
  (let ((developer tx-sender))
    (if (is-some (map-get? developers developer))
        (err u4000)  ;; Error: Developer has already prioritized a feature
        (if (is-none (map-get? features feature-id))
            (err u4001)  ;; Error: Feature does not exist
            (begin
              ;; Register the developer's prioritization
              (map-set developers developer feature-id)
              ;; Increment the feature's priority count
              (map-set features feature-id (+ (default-to u0 (map-get? features feature-id)) u1))
              (ok feature-id)
            )
        )
    )
  )
)

;; Read-only function to get total priority for a feature
(define-read-only (get-priority-count (feature-id uint))
  (default-to u0 (map-get? features feature-id))
)

;; Read-only function to check if a developer has prioritized any feature
(define-read-only (has-prioritized (developer principal))
  (is-some (map-get? developers developer))
)

;; Read-only function to get the total number of features
(define-read-only (get-feature-count)
  (var-get feature-counter)
)

;; Read-only function to compare two values
(define-read-only (compare-priority (a uint) (b uint))
  (if (>= a b)
      a
      b
  )
)