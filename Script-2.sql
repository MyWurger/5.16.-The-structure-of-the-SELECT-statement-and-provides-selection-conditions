-- Задача 1. Вывести location_id городов, в которых расположены отделы фирмы.

select department_id
from departments;


-- Задача 2. Вывести данные о товарах, у которых столбец rating_p имеет значение 3 или 4, а price > 700. 

select *
from products
where rating_p in (3, 4) and price> 700;


-- Задача 3. Вывести last_name сотрудников, у которых last_name содержит две буквы e. 

select lAST_NAME
from employees
where last_name like '%e%e%';


-- Задача 4. Вывести значения столбцов employee_id , department_id, first_name, last_name, salary, job_id сотрудников, которые
-- получают зарплату > 1100, но не являются менеджерами. Менеджерами являются те сотрудники, у которых стол-бец job_id содержит
-- подстроку 'MAN'. 

select employee_id , department_id, first_name, last_name, salary, job_id
from employees
where salary>1100 and salary is not null and not(job_id like '%MAN%');


-- Задача 5. Вывести first_name, last_name, job_id и суммарную зарплату за год в следующем виде: 
-- Michael Hartstein занимает должность MK_MAN и зарплата за год составляет 156000. 

select first_name|| ' ' ||last_name|| ' занимает должность  ' ||job_id|| ' и зарплата за год составляет ' ||salary * 12 as information
from employees
where salary is not null 


-- Задача 6. Вывести значения столбцов employee_id , department_id, first_name, last_name, salary, job_id и столбец level,
--  который должен принимать следующие значения: low – если зарплата сотрудника <= 5000; midl – если зарплата сотруд-ника >5000
--  но <=10000; high – если зарплата сотрудника >10000.

select employee_id, department_id, first_name, last_name, sala-ry, job_id
case
	when salary <= 5000 then 'low'
	when salary > 5000 and salary <= 10000 then 'midl'
	else 'high'
end as level
from employees
where salary is not null


-- Задача 7. Вывести данные о 3х сотрудниках с наибольшим размером премии (bonus), которую они должны получить.
-- Размер премии сотрудника рассчитыва-ется по формуле bonus = 0.1*salary*rating_e.

select *, (salary * rating_e * 0.1) as bonus
from employees
where salary is not null and rating_e is not null
order by bonus desc
limit 3;

