create database company;
create table employee
(
	Id int Primary key,
	name varchar(100),
	salary int
);

use company;
select * from employee;

insert into employee values
(
	8,'chetan', 13000
);

create database university;
use  university;
create table teacher(
	teacher_id int primary key,
    name varchar(50),
    address varchar(100),
    salary int
);

insert into teacher values(1, 'sushila', 'chougaon', 40000),
	(2, 'lata', 'nandgaon', 50000),
    (3, 'naman', 'malegaon', 30000),
    (4, 'pasha', 'chalisgaon', 70000);
    
select * from teacher;

create table student(
	student_id int auto_increment primary key,
    s_name varchar(30),
    marks int check (marks >= 0 and marks <= 100),
    gender varchar(1) check (gender in ('m','f','t')),
    teacher_id int , foreign key (teacher_id) references teacher (teacher_id)
);

insert into student values (6,'chutki',80, 't', 1);
select * from student;
show databases;
show tables;

select s.s_name , t.name
from student s
inner join teacher t
on s.teacher_id = t.teacher_id;

select s.s_name , t.name
from student s
inner join teacher t
on s.teacher_id = t.teacher_id;



create database if not exists hospital;
use hospital;
create table doctor(
	doc_id int primary key,
    doc_name varchar(100) not null,
    doc_dept varchar (20) not null,
    dob date,
    age int check(age < 100 and age > 0),
    gender varchar(5) check (gender in ('m', 'f','o'))
);
drop table doctor;
insert into doctor values
	(1, 'a','icu','2025-12-14',42,'m'),
    (2, 'b', 'op', '2024-12-14', 44, 'f'),
    (3, 'c', 'hr', '2003-03-01', 23, 'o');
    
select * from doctor;


create table patient(
	p_id int primary key auto_increment,
    p_name varchar (50) not null,
    doc_id int,
    foreign key (doc_id) references doctor(doc_id)
);

insert into patient values 
	(1, 'prashik',3),
    (2,'pranav', 2),
    (3,'jayesh', 1),
    (4, 'yogesh',2);



select * from doctor
join patient 
on doctor.doc_id=patient.p_id;

select p.p_name , d.doc_name
from patient p
inner join doctor d
on p.doc_id=d.doc_id;

select* from patient
where p_name = ('pranav');


create table dept(
	d_id int primary key,
    d_name varchar(30),
    d_code int unique,
    doc_id int,
    foreign key (doc_id) references doctor(doc_id)
);

insert into dept values
	(110,'icu',002,1),
    (111,'hr',001,2),
    (112,'op',003,3);

select * from dept;

select d.d_name , doc.doc_name
from dept d
inner join doctor doc
on d.doc_id= doc.doc_id;


select * from doctor
order by age desc;












