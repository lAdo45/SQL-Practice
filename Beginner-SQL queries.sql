use  companydb;

select*from employees;
select*from departments;
select*from projects;
select*from salaries;
select*from employee_projects;

-- List all employees with their department names. --

select e.firstname, e.lastname, d.deptname from employees e
join departments d on e.deptid=d.deptid;

-- Show all projects along with the department responsible.  -- 

select p.projectname, d.deptname from projects p
join departments d on p.deptid=d.deptid; 

-- List employees and their salaries including those without salaries.  -- 

select e.firstname, e.lastname, s.basicsalary from employees e
 left join salaries s  on e.empid=s.empid;

-- Find total salary (Basic + Bonus) for each employee. -- 
select e.firstname, e.lastname as empname , s.basicsalary , s.bonus , (s.basicsalary + s.bonus) as totalsalary from employees e
join salaries s  on e.empid=s.empid;  

-- Show the number of employees in each department. --

select count(e.firstname) as number_of_emp , deptname from employees e
join departments d on e.deptid=d.deptid 
group by deptname;

-- List employees working in Pune or Delhi. --
select e.firstname as emp_name , d.location from employees e 
join departments d on e.deptid=d.deptid
where d.location in  ("Pune" ,"Delhi");

--  Show all employees who joined before 2021. --
select concat(e.firstname,e.lastname) as emp_name from employees e 
where e.hiredate < "2021-01-01";

-- List employees in the IT department earning more than 55,000. --
select concat(e.firstname,e.lastname) as emp_name from employees e
join departments d on e.deptid=d.deptid 
join salaries s on e.empid=s.empid
where d.deptname = "it" and s.basicsalary > 55000;

-- Show project names with the number of employees assigned. --
select p.projectname, count(ep.empid) as employee_count
from projects p
left join employee_projects ep on p.projectid=ep.projectid
group by p.projectid, p.projectname;
  

-- Find employees who work on more than one project.--
select concat(e.firstname,e.lastname) as emp_name , count(ep.projectid) 
from employees e
join employee_projects ep 
on e.empid=ep.empid
join projects p  
on ep.projectid=p.projectid 
group by e.empid , e.firstname, e.lastname 
having count(ep.projectid)>1;

--  List employees and the total hours they worked on all projects.-- 
select concat(e.firstname,e.lastname) as emp_name , sum(ep.hoursworked) as hoursworked 
from  employees e join employee_projects ep 
on e.empid=ep.empid
group by emp_name;

--  Show employees who do not work on any project. -- 
select concat(e.firstname,e.lastname) as emp_name from employees e 
left join projects p on e.deptid=p.deptid 
where p.projectid is null;

-- List the highest salary in each department.--
select d.deptname , max(s.basicsalary) as max_salary from departments d 
join employees e 
on e.deptid=d.deptid
join salaries s 
on e.empid=s.empid
group by d.deptname;

--  Show average bonus by department. --
select d.deptname , avg(s.bonus) as avg_bonus from departments d 
join employees e 
on e.deptid=d.deptid
join salaries s 
on e.empid=s.empid
group by d.deptname;

-- Show employees who have the word "Manager" in their position. --
select concat(e.firstname,e.lastname) as emp_name
from employees e 
where e.position like "%manager%";

-- . List employees sorted by hire date (newest first).--
select concat(e.firstname,e.lastname) as emp_name , e.hiredate
from employees e 
order by e.hiredate asc;

-- Find departments with a budget greater than 1,000,000. --
select d.deptname as deptname , d.budget as Budget 
from departments d 
where d.budget< 100000;

-- Show all projects starting after March 2023. --
select  p.projectname as projectname from projects p 
where p.startdate > 2023-03-01;

-- Find employees whose email ends with "@company.com". -- 
select concat(e.firstname,e.lastname) as emp_name from employees e 
where e.email like "%@company.com";

-- List employees who have a phone number starting with "98765".--
select concat(e.firstname,e.lastname) as emp_name from employees e 
where e.phone like "98765%";

-- Show department names with average salaries.--
select d.deptname as deptname , avg(s.basicsalary) as avg_salary 
from departments d 
join employees e on e.deptid=d.deptid
join salaries s on e.empid=s.empid
group by d.deptname;

-- Find employees hired in the last 2 years. --
select concat(e.firstname,e.lastname) as emp_name from employees e 
where hiredate > 2022-12-31;

 -- Show all projects and their duration in days. --
 select  p.projectname as projectname ,
 datediff(p.enddate, p.startdate) as duration_days from projects p; 
 
-- List employees who have never received a bonus.-- 
select concat(e.firstname,e.lastname) as emp_name from employees e 
join salaries s on e.empid=s.empid
where s.bonus is null or s.bonus = 0;

--  Show top 3 highest paid employees. --
select concat(e.firstname,e.lastname) as emp_name from employees e 
join salaries s on e.empid=s.empid
order by s.basicsalary desc
limit 3 ;

--  Show employees working more than 150 hours on projects. --
select concat(e.firstname,e.lastname) as emp_name from employees e  
join employee_projects ep on e.empid=ep.empid
where ep.hoursworked>150;

--  Find employees who work in IT but are not "Developers". --
select concat(e.firstname,e.lastname) as emp_name from employees e   
join departments d on  e.deptid=d.deptid 
join employee_projects ep on e.empid=ep.empid
where d.deptname="IT"  and ep.role !="developers";



--  Show all projects with budgets between 100,000 and 300,000.-- 
 select  p.projectname as projectname from projects p 
 where p.budget between 100000 and 300000;

--  Find the sum of all bonuses in the company. --
select sum(s.bonus) from salaries s;

--  Show the total salary cost (basic + bonus) per department.--
select d.deptname as Deptname ,   sum(s.basicsalary + s.bonus) as total_salary from departments d
join employees e on e.deptid=d.deptid
join salaries s on e.empid=s.empid
group by d.deptname;
