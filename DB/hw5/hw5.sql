/* 5.6 */
create trigger update_view1 after insert on depositor
referencing new row as nrow
for each row
    insert into branch_cust
    select branch_name, customer_name from account
    where nrow.account_number = account.account_number;

create trigger update_view2 after insert on account
referencing new row as nrow
for each row
    insert into branch_cust
    select branch_name, customer_name from depositor
    where nrow.account_number = depositor.account_number;

/* 5.15 */
create function avg_salary(company_name varchar(20))
    returns float
    begin
        declare average float;
        select avg(salary) into average
        from works where works.company_name = company_name;
        return average;
    end

select distinct company_name from works where avg_salary(company_name) > avg_salary("First Bank");
