-- create database student_and_exam;

use student_and_exam;
/*create table student and exam.  in student table Rollno primary key and in exam table use Rollno as foreign key*/

create table student(
Rollno int,
Name varchar(100),
Branch varchar(100),
primary key(Rollno)
);
insert into student (Rollno,Name,Branch)
values
(1,"Jay","Computer science"),
(2,"Suhani","Electronics and Com"),
(3,"Kriti","Electronic and Com");

create table Exam(
Rollno int,
S_code varchar(20),
Marks int,
P_code varchar(20),
foreign key(Rollno) references student(Rollno) 
);
insert into exam(Rollno,S_code,Marks,P_code)
values
(1,"CS11",50,"CS"),
(1,"CS12",60,"CS"),
(2,"EC101",66,"EC"),
(2,"EC102",70,"EC"),
(3,"EC101",45,"EC"),
(3,"EC102",50,"EC");

create table Information(
FirstName varchar(100),
LastName varchar(100),
Address varchar(500),
city varchar(50),
age int
);
insert into Information(FirstName,LastName,Address,City,age)
values
("Meckey","Mouse","123 Fantasy Way","Anaheim",73),
("Bat","Man","321 Cavern Ave","Gotham",54),
("Wonder","Women","987 Truth Way","Paradies",39),
("Donald","Duck","555 Quack Street","Mallard",65),
("Bugs","Bunny","567 Carrot Street","Rasxal",58),
("Wiley","Coyote","999 Acme Way","Canyon",61),
("Cat","Woman","234 Purrfect Street","Hairball",32),
("Tweety","Bird","543","Itotltaw",28);

/* create table given below: Employee and Incentive*/

create table Employee(
Employee_ID int,
First_name varchar(100),
Last_name varchar(100),
salary int,
Joining_date datetime,
Department varchar (25)
);

insert into Employee(Employee_ID,First_name,Last_name,salary,joining_date,Department)
values
(1,"John","Abraham",1000000,"2013-01-01 12:00:00","Banking"),
(2,"Michael","Clarke",800000,"2013-01-01 12:00:00","Insurance"),
(3,"Roy","Thomas",700000,"2013-02-01 12:00:00","Banking"),
(4,"Torn","Jose",600000,"2013-02-01 12:00:00","Insurance"),
(5,"Jerry","Pinto",650000,"2013-02-01 12:00:00","Insurance"),
(6,"Philip","Mathew",750000,"2013-01-01 12:00:00","Services"),
(7,"TestName1","123",650000,"2013-01-01 12:00:00","Services"),
(8,"TestNmae2","Lname%",600000,"2013-02-01 12:00:00","Insurance");

create table Incentive(
Employee_ref_id int,
Incentive_date date,
Incentive_amount int
);

insert into incentive(Employee_ref_id,Incentive_date,Incentive_amount)
values
(1,"2013-02-01",5000),
(2,"2013-02-01",3000),
(3,"2013-02-01",4000),
(1,"2013-01-01",4500),
(2,"2013-01-01",3500);

create table salseperson(
SNo int,
SNAME varchar(100),
CITY varchar(50),
COMM float(10,2),
primary key(SNo)
);

insert into salseperson(SNo,SNAME,CITY,COMM)
values
(1001,"Peel","London",0.12),
(1002,"Serres","San Jose",0.13),
(1004,"Motika","London",0.11),
(1007,"Rafkin","Barcelona",0.15),
(1003,"Axelrod","New York",0.1);

create table customer(
CNM int ,
CNAME varchar(100),
CITY varchar(100),
RATING int,
SNo int,
primary key(CNM),
foreign key(SNo) references salseperson(SNo)
);
insert into customer(CNM,CNAME,CITY,RATING,SNo)
values
(201,"Hoffman","London",100,1001),
(202,"Giovanne","Roe",200,1003),
(203,"Liu","San Jose",300,1002),
(204,"Grass","Barcelona",100,1002),
(206,"Clemens","London",300,1007),
(207,"Pereira","Roe",100,1004);






-- a)	Get First_Name from employee table using Tom name “Employee Name”.

		update employee set First_name = "tom" where First_name = "Torn";
		select First_name from employee where First_name = "tom";
		select * FROM employee where First_name = "tom";

-- b)	Get FIRST_NAME, Joining Date, and Salary from employee table.
		select first_name,joining_date,salary from employee;

-- c)	Get all employee details from the employee table order by First_Name Ascending and Salary descending

		-- select distinct (salary) from employee;

		select * from employee order by First_name, salary desc;
		select first_name,salary from employee order by First_name, salary desc;
        

-- d)	Get employee details from employee table whose first name contains ‘J’.

		select * from employee where First_name  between  "j" and "l";
		select * from employee where First_name like "J%";
		select * from employee where First_name like "Ro%";
		select * from employee where First_name like "tom%";
		select * from employee where First_name like "%ch%";
		select * from employee where First_name like "r%" or First_name like "t%";
		select * from employee where First_name not like "r%";
		select * from employee where binary First_name like "t%";
		select * from employee where First_name like "m%l";
		select * from employee where First_name like "__rr%";
		select * from employee where First_name like "_h%";
		select * from employee where First_name like "t_s%";
		select * from employee where binary First_name like "p_i%";
		select * from employee where binary First_name like "P_i%";

-- REGULAR EXPRESSION [REGEXP].

		select * from employee where First_name regexp 'J';
		select * from employee where First_name regexp 'J|r|T';
		select * from employee where binary First_name regexp 'J|r|T';
		select * from employee where First_name regexp '^Jo|hi|^Te';
		select * from employee where First_name regexp '^Jo|hi|1$';
		select * from employee where First_name regexp '[RJ]';
		select * from employee where First_name regexp '[RJ]o';
		select * from employee where First_name regexp '[k-w]m';
        
        select * from employee where First_name between "j" and "U";

-- e)	Get department wise maximum salary from employee table order by salary ascending?
  
		select department,max(salary) from employee group by department order by salary asc ;
        select department,max(salary) from employee group by department order by salary ;
		
		-- -----------
		select department,salary from employee group by department order by salary;
		select department,max(salary) from employee group by department order by salary;

/* f)	Select first_name, incentive amount from employee and incentives table for
         those employees who have incentives and incentive amount greater than 3000  */
         
         select employee.first_name,sum(incentive.Incentive_amount) as Incentive
         from employee
         inner join incentive
         on employee.Employee_id = incentive.Employee_ref_id
		 where incentive.incentive_amount or incentive.Incentive_amount > 3000 
         group by employee.first_name; -- incentive.Employee_ref_id;
         
         select employee.first_name,sum(incentive.Incentive_amount) as Incentive
         from employee
         inner join incentive
         on employee.Employee_id = incentive.Employee_ref_id
		 where incentive.Incentive_amount > 3000    --   >= 3000
         group by incentive.Employee_ref_id;
         
-- g)	Create After Insert trigger on Employee table which insert records in view table  
			
            
            DELIMITER $$
			CREATE TRIGGER employee_insert
			AFTER INSERT ON Employee
			FOR EACH ROW
			BEGIN
			INSERT INTO Employee (employee_id, First_name,last_name,salary,joining_date,department)
			VALUES (NEW.employee_id, NEW.First_name, NEW.last_name, NEW.salary, NEW.joining_date, NEW.department);
			END $$
			DELIMITER ;

			



-- b)	Names and cities of all salespeople in London with commission above 0.12
		select * from salseperson where city = "london" and  comm > 0.12 ;

-- c)	All salespeople either in Barcelona or in London
	    select * from salseperson where city = "london" or city = "barcelona" ;

-- d)	All salespeople with commission between 0.10 and 0.12. (Boundary values should be excluded).
		select * from salseperson where comm > 0.10 and comm < 0.12;
		
      --   select * from salseperson where comm >0.10 or comm < 0.12;
      
-- e)	All customers excluding those with rating <= 100 unless they are located in Rome  
		
		select CNAME as "Customer Name" ,CITY, RATING from customer WHERE (rating > 100) OR (rating <= 100 AND city = 'Rome');
		select CNAME as "Customer Name" ,CITY, RATING from customer where rating >100 or city = "rome";