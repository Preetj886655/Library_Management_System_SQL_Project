use library_system_management_project;
drop table if exists branch;
create table branch(
branch_id varchar(20) primary key,
manager_id varchar(20), 
branch_address varchar(50),
contact_no varchar(20)
);
drop table if exists employees;

create table employees
(
emp_id varchar(10) primary key,
emp_name varchar(30),
position  varchar(25),
salary float,
branch_id varchar(10)--   foreign key
);
drop table if exists books;
create table books(
isbn varchar(20) primary key,
book_title varchar(75),
category varchar(10),
rental_price float,
status varchar(15),
author varchar(35),
publisher varchar(55)
);
ALTER TABLE books 
MODIFY COLUMN category VARCHAR(30);


drop table if exists members;
create table members(
member_id varchar(10) primary key,
member_name varchar(30),
member_address varchar(50),
reg_date date

);
drop table if exists issues_status;
create table issues_status(
issued_id varchar(20) primary key,
issued_member_id varchar(20),-- foreign key
issued_book_name varchar(50),
issued_book_date date,
issued_book_isbn varchar(50),-- --foreign key 
issued_emp_id varchar(20) --  foreign key
);
drop table if exists return_status;
create table return_status(
return_id varchar(10) primary key,
issued_id varchar(10),  -- foreign key
return_book_name varchar(15),
return_date date,
return_book_isbn varchar(20)   -- foreign key
);
alter table issues_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id); 

alter table issues_status
add constraint fk_books
foreign key (issued_book_isbn )
references books(isbn); 

alter table issues_status
add constraint fk_employees
foreign key (issued_emp_id)
references employees(emp_id); 

alter table employees
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id); 


alter table return_status
add constraint fk_issues
foreign key (issued_id )
references issues_status(issued_id); 

alter table return_status
add constraint fk_book
foreign key (return_book_isbn)
references books(isbn);
-- isbn stand for International Standard Book Number.
 select *from books;
select *from branch;
select * from employees;
select *from issues_status;
select *from members;
select *from return_status





