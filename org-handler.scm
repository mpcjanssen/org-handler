(import 
  (chicken process-context)
  format
  (chicken format)
  srfi-1
  srfi-69
  args
  uri-generic
  uri-common
  )
(define (write-to-a-file path txt)
  (call-with-output-file path
    (lambda (output-port)
      (write txt output-port)
      (display "\n" output-port))))

(define (append-todo title url _body)
  (call-with-output-file "/Users/mark.janssen/Nextcloud/todo.txt"
    (lambda (output-port)
      (fprintf output-port "~A ~A +background ~%" title url
      )) #:append))


(write-to-a-file (format "~A.log" (executable-pathname)) (command-line-arguments)) 

(define uri (first (command-line-arguments)))
(define log-file (format "~A.log" (executable-pathname)))
(write-to-a-file log-file  (command-line-arguments)) 
(define q (uri-query (uri-reference uri)))
(write-to-a-file log-file q ) 
(let ( [title (cdr (assq 'title q))]
       [url (cdr (assq 'url q))]
       [body (cdr (assq 'body q))])
   (ppend-todo title url body))
