;; extends

;; Highlight the function identifier only when it is actively called
(call_expression
  function: (identifier) @function.call
  (#set! "priority" 130))

;; Handle member method calls like tasks.value.filter()
(call_expression
  function: (member_expression
    property: (property_identifier) @function.call)
  (#set! "priority" 130))

