USE hr;
/* 1. Ecrivez une requête pour afficher le nom, le numéro de département et le département de
tous les employés.*/

SELECT last_name, 
       d.department_id, 
       department_name
FROM employees e, 
     departments d
WHERE e.department_id = d.department_id;

/* 2. Créez une liste unique de tous les postes du département 30.*/

SELECT DISTINCT(job_title)
FROM employees e,
     jobs j
WHERE e.job_id = j.job_id
AND department_id = 30;

/* 3. Ecrivez une requête pour afficher le nom, le département et la localisation de tous les
employés qui touchent une commission.*/

SELECT last_name, 
       e.department_id, 
       location_id
FROM employees e, 
     departments d
WHERE e.department_id = d.department_id
AND commission_pct IS NOT NULL;

/* 4. Affichez le nom et le nom du département pour tous les employés dont le nom contient la
lettre A.*/

SELECT last_name, 
       department_name
FROM employees e, 
     departments d
WHERE e.department_id = d.department_id
AND last_name REGEXP ".{0,}a.{0,}";

/* 5. Ecrivez une requête pour afficher le nom, le poste, le numéro de département et le
département de tous les employés basés à Seattle.*/

SELECT last_name, 
       job_title, 
       e.department_id, 
       department_name
FROM employees e, 
     departments d, 
     jobs j, 
     locations l
WHERE e.department_id = d.department_id
AND j.job_id = e.job_id
AND l.location_id = d.location_id
AND city = "Seattle";

/* 6. Affichez le nom et le matricule des employés et de leur manager. Nommez les colonnes
Employee, Emp#, Manager, et Mgr#, respectivement.*/

SELECT e1.last_name AS Employee, 
       e1.employee_id AS "Emp#", 
       e2.last_name AS Manager, 
       e2.employee_id AS "Mgr#"
FROM employees e1, 
     employees e2
WHERE e1.manager_id=e2.employee_id;

/* 7. Modifiez la requête précédent[SA1]e pour afficher tous les employés, y compris King n'ayant
pas de manager.*/

SELECT e1.last_name AS Employee, 
       e1.employee_id AS "Emp#", 
       e2.last_name AS Manager, 
       e2.employee_id AS "Mgr#"
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id=e2.employee_id;

/* 8. Créez une requête pour afficher le numéro de département et le nom de tous les employés
qui travaillent dans le même département qu'un autre employé. Donnez à chaque colonne
un nom approprié.*/

/* 9. Affichez la structure de la table JOBS. Créez une requête pour afficher le nom, le poste, le
département, le salaire et l’intervalle associé de tous les employés.*/

SELECT last_name, 
       e.job_id, 
       department_id, 
       salary, 
       CONCAT(min_salary, "-", max_salary) AS salary_interval
FROM employees e, 
     jobs j
WHERE e.job_id=j.job_id;

/* 10. Créez une requête pour afficher le nom et la date d'embauche de tous les employés arrivés
après l'employé dont le mail est « JKING ».*/

SELECT e1.last_name, 
       e1.hire_date
FROM employees e1, 
     employees e2
WHERE e1.hire_date > e2.hire_date
AND e2.email="JKING";

/* 11. Affichez les noms et date d'embauche des employés et de leur manager, pour tous les
employés ayant été embauchés avant leur manager. Nommez les colonnes Employee, Emp
Hiredate, Manager et Mgr Hiredate.*/

SELECT e1.last_name AS Employee, 
       e1.hire_date AS "Emp Hiredate", 
       e2.last_name AS Manager, 
       e2.hire_date AS "Mgt Hiredate"
FROM employees e1, 
     employees e2
WHERE e1.manager_id=e2.employee_id
AND e1.hire_date < e2.hire_date;