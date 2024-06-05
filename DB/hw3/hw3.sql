/* 3.8 */
/* a */
select ID from customer where customer.ID = account.ID and customer.ID not in (select ID from borrower where borrower.loan_number = loan.loan_number);
/* b */
select ID from customer where customer.ID = account.ID and customer.customer_city = (select customer_city from customer where customer.ID = '12345');
/* c */
select branch_name from branch where branch.branch_name in (select branch_name from account where account.account_number = (select account_number from depositor where depositor.ID = (select ID from customer where customer.customer_city = 'Harrison')));

/* 3.9 */
/* a */
select ID, person_name, city from employee where employee.ID = (select ID from works where works.company_name = 'First Bank Corporation');
/* b */
select ID, person_name, city from employee where employee.ID = (select ID from works where works.company = 'First Bank Corporation' and works.salary > 10000);
/* c */
select ID from employee where employee.ID not in (select ID from works where works.company_name = 'First Bank Corporation');
/* d */
select ID from employee where employee.ID = (select ID from works where works.salary > all (select salary from works where works.company_name = 'Small Bank Corporation'));
/* e */
select company_name from company where company.city = (select city from company where company.company_name = 'Small Bank Corporation');
/* f */
select company_name from company where company.company_name = (select company_name from works where works.company_name = max(count(works.company_name)));
/* g */
select company_name from company where company.company_name = (select company_name from works where avg(works.salary) > (select avg(salary) from works where works.company_name = 'First Bank Corporation'));

/* 3.10 */
/* a */ 
update employee set city = 'Newtown' where employee.ID = '12345';
/* b */
update (select salary from works where works.ID = manages.ID and works.company_name = 'First Bank Corporation') set salary = salary > 100000 ? salary * 1.03 : salary * 1.10;

/* 3.11 */
/* a */
select ID, unique name from student where student.ID = (select ID from takes where takes.course_id = some (select course_id from course where course.dept_name = 'Comp.Sci.'));
/* b */
select ID, name from student where student.ID not in (select ID from takes where takes.year <= 2017);
/* c */
select max(salary) from instructor where instructor.dept_name = (select distinct dept_name from department);
/* d */
with per_department(max_salary) as
select max(salary) from instructor where instructor.dept_name = (select distinct dept_name from department)
select min(max_salary) from per_department;

/* 3.15 */
/* a */
select * from customer where customer.ID = (select ID from depositor where depositor.account_number = (select account_number from account where account.branch_name = all (select distinct branch_name from branch where branch.branch_city = 'Brooklyn')));
/* b */
select sum(amount) from loan;
/* c */
select branch_name from branch where branch.assets > (select max(assets) from branch where exists branch.branch_city = 'Brooklyn');
