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
select *from return_status;
-- Project TASK


-- ### 2. CRUD Operations


-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

select *from books;
insert into books(isbn,book_title,category,rental_price,status,author,publisher)
values('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')
;
select *from books

-- Task 2: Update an Existing Member's Address
;select *from members;
update members
set member_address='124 Main St'
where member_id='C101';
select *from members;

-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.
select *from issues_status;
delete from issues_status
where issued_id='IS106';
select *from issues_status
-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.
;
select * from employees;
select *from branch;
select *from  books ;
select * from issues_status
where issued_emp_id='E101'



-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.
;
select *from issues_status;
select issued_emp_id,count(issued_id) as count from issues_status
group by issued_emp_id
having count>1
-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based 
-- on query results 
-- each book and total book_issued_cnt
;
select *from issues_status;
select b.isbn,count(s.issued_id) from books b
join issues_status s
on s.issued_book_isbn=b.isbn
group by b.isbn;

-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:

select distinct category from books;



-- Task 8: Find Total Rental Income by Category:
select  category,sum(rental_price) as Total_Rental_Income from books b
join issues_status s
on s.issued_book_isbn=b.isbn
group by category

;
select *from issues_status;
-- Task 9. **List Members Who Registered in the Last 180 Days**:
select *from members;
insert into members(member_id,member_name,member_address,reg_date)
values 
('C116','preet','321 sule','2024-06-01'),
('C117','aman','321 sule','2024-07-01');

-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:
 select *from Employees e
 join branch b
 on b.branch_id=e.branch_id
 join employees e1 on 
 b.manager_id=e1.emp_id
;
 select *from branch;

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold
select *from books
where rental_price>4;
-- Task 12: Retrieve the List of Books Not Yet Returned
select issued_book_name from return_status r	
right join  issues_status i
on i.issued_id=r.issued_id
where (r.return_id is null);
/*
