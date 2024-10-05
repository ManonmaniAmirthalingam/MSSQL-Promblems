select unique_id,name from employees em
Left join EmployeeUNI em2 on em.id = em2.id
