
;;; Name:   AOC_2021_DAY3_PART2
;;; Author: Ort
;;; Date:   2021/12/03

(setf *default-pathname-defaults* (truename "C:/Users/Ort/Desktop"))

(defun binToDec (bin)
  (setf ret 0)
  (setf power (- (length bin) 1) )
  (loop for x across bin do
    (if (= (digit-char-p x) 1 )
      (incf ret (expt 2 power) )
    )
    (decf power)
  )
  (return-from binToDec ret)
)

(defun remX (x lst idx)
  (cond
    ( (null lst) ())
    ( (= (digit-char-p (char (car lst) idx) ) x)
      (remX x (cdr lst) idx)
    )
    (T (cons (car lst) (remX x (cdr lst) idx) ) ) 
  )
)

(defun countOnes (lst idx)
  (setf cnt 0)
  (loop for code in lst do
    (incf cnt (digit-char-p (char code idx ) ) )
  )
  (return-from countOnes cnt)
)

(defun ogr (lst)
  (setf currIdx 0)
  (loop while (> (length lst) 1) do
    (if (>= (countOnes lst currIdx) (/ (length lst) 2) )                
      (setf lst (remX 0 lst currIdx) )
      (setf lst (remX 1 lst currIdx) )
    )
    (incf currIdx)
  )
  (binToDec (car lst) )
)

(defun csr (lst)
  (setf currIdx 0)
  (loop while (> (length lst) 1) do
    (if (>= (countOnes lst currIdx) (/ (length lst) 2) )                
      (setf lst (remX 1 lst currIdx) )
      (setf lst (remX 0 lst currIdx) )
    )
    (incf currIdx)
  )
  (binToDec (car lst) )
)

(defun LifeSupportRating (lst)
  (* (ogr lst) (csr lst) )
)

(setq report '())

(let ((in (open "input.txt" :if-does-not-exist nil)))
  (when in
    (loop for line = (read-line in nil)
       while line do
        (setq report (cons line report))
    )
    (close in)
  )
)

(print (LifeSupportRating report) )










