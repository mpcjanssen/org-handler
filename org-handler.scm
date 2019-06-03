(import 
  (chicken process-context)
  format
  args
  )
(define (write-to-a-file path txt)
  (call-with-output-file path
    (lambda (output-port)
      (write txt output-port)
      (display "\n" output-port)
      )
    #:append))

(write-to-a-file (format "~A.log" (executable-pathname)) (command-line-arguments)) 
