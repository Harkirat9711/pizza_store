

<<<<<<< HEAD
# Introduction:
=======
#Introduction:
>>>>>>> 25c4081ca5180b226167a62d8de52c1867a4f0bc

# Pizza Store By Harkirat Singh:

Demonstrating the pizza store web app using JSP/bootstrap/JavaScript/CSS. User can be able to browse variety of available pizza, customize and 
build its own choice of pizza and can also be able to filter out
the list of pizzas with minimum price and maximum price. User can also be able to review cart before finalizing the order.

# Steps to Run

Make sure Mysql is installed.

From mysql workbench or command-line (if you are on Mac) run the web/initdb.sql. This will initialize the db schema and create tables for pizzas and users and add initial data in it. On Mac, do it as:

HARKIRATs-MacBook-Air:project/pizza HarkiratMac : $ mysql < ~/Desktop/initdb.sql 

OR 

cd web/ 

mysql -u root

mysql > /Source initdb.sql 

mysql > exit

Install netbeans(if havent already)


Create a Project in Netbeans

Copy all files to that Netbeans project workspace. i.e. the web folder to your skeleton project web folder, the src folder to your project src folder.

Update the mysql server credentials. You would update it in: src/java/dbconnector.java

Create new DB connection from netbeans with mysql in port 3306.

JDBC reference Link: jdbc:mysql://localhost:3306/la_pizzeria

Add JDBC mysql connector library to your netbeans project (use port 3306).

To login visit : http://localhost:8080/pizza

Testing Login with test accounts

Some accounts are pre-setup by initdb.sql and their credentials are:

Username/passwords:  

	admin1@admin.com / admin


