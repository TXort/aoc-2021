
;;; Name:   AOC_2021_DAY3_PART1
;;; Author: Ort
;;; Date:   2021/12/03

(setf *default-pathname-defaults* (truename "C:/Users/Ort/Desktop"))

(defun countOnes (lst idx)
  (setf cnt 0)
  (loop for code in lst do
    (incf cnt (digit-char-p (char code idx ) ) )
  )
  (return-from countOnes cnt)
)

(defun powerConsumption (lst)
  (setf codesize (- (length (car lst) ) 1 ) )
  (setf gammaRate 0)
  (setf epsilonRate 0)
  (loop for x from 0 to codesize do
    (setf one (countOnes lst x) )
    (if (> one (/ (length lst) 2) )
      (incf gammaRate (expt 2 (- codesize x )) )
      (incf epsilonRate (expt 2 (- codesize x )) )
    )
  )
  (* gammaRate epsilonRate)
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

(print (powerConsumption report) )








