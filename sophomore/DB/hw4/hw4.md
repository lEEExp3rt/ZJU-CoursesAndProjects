# HW4

[TOC]

---

## 4.7

```sql
create database Employee;
use Employee;
create table employee (
    ID int primary key,
    person_name varchar(6),
    street varchar(12),
    city varchar(10)
);
create table works (
    ID int,
    company_name varchar(12),
    salary int,
    foreign key (ID) references employee (ID),
    foreign key (company_name) references company (companhy_name)
);
create table company (
    company_name varchar(12) primary key,
    city varchar(10)
);
create table manages (
    ID int,
    manager_id int, 
    foreign key (ID) references employee (ID)
);
```

## 4.9

After the deletion, except the tuple is deleted, those with foreign key `manager_ID` pointing to the `employee_ID` will also be deleted, then its `employee_ID` is also deleted and then those pointing to this key's tuples are deleted... So chain action will be made.

## 4.15

```sql
select * from section inner join classroom on section.classroom = classroom.name;
```

## 4.17

```sql
select ID from student left join advisor on student.ID = advisor.s_id and advisor.i_ID is null;
```

## 4.20

```sql
create view tot_credits (year, num_credits) as (
    select credits, year from year_credits
    );
```
