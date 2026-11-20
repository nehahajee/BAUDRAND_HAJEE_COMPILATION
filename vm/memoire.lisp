;;make-vm, mem-get/mem-set, registres, drapeaux

;;prend un nom et une taille (avec une valeur par défaut, via &optional)
(defun make-vm())

;;accesserus mémoires
;;à faire : tester les adresses négatives, le cas ou adr n est pas un nombre renvoyer une erreur
;;peut etre a modéliser par une methode check-adr car elle est redondante dans les deux fonctions
(defun mem-get(vm_name adr)
    (if (integerp adr)
        (if (>= adr (array-total-size (get vm_name :MEMORY)))
            (error "accès à l'addresse ~s hors de la memoire" adr)
            (if (null (aref (get vm_name :MEMORY) adr))
                0
                (aref (get vm_name:MEMORY) adr)
            )
        )
    )
)

(defun mem-set(vm_name adr val)
    (if (integerp adr)
        (if (>= adr (array-total-size (get vm_name :MEMORY)))
            (error "accès à l'addresse ~s hors de la memoire" adr)
            (setf (aref (get vm_name :MEMORY) adr) val)
        )
    )
)

;;accesseurs registres et drapeaux 
;;ajouter des vérifications avec member sur la liste des noms valides
;;pour setflag vérifier que val vaut 0 ou 1 
(defun get-reg(vm_name reg)
    (get vm_name reg)
)

(defun set-reg(vm_name reg val)
    (setf(get vm_name reg) val)
)

(defun get-flag(vm_name flag)
    (get vm_name flag)
)

(defun set-flag(vm_name flag val)
    (setf (get vm_name flag) val)
)
