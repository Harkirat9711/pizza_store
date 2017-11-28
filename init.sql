

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



--
CREATE DATABASE IF NOT EXISTS la_pizzeria;
USE la_pizzeria;
drop table if exists role;
drop table if exists user;
drop table if exists pin;
drop table if exists pizza;
drop table if exists credit;

CREATE TABLE IF NOT EXISTS `pizza` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(6000) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `phonenumber` int(50) NOT NULL,
  `active` boolean NOT NULL DEFAULT true,
  PRIMARY KEY  (email)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO user(email, password, name, address, zipcode, phonenumber, active) VALUES('admin1@admin.com', 'admin', 'Professor Greg', 'CSUEB Hayward', '94587', '5106345845', '1');


/* INSERT SOME PIZZAS */
INSERT INTO pizza(name, price, description) VALUES('Marianara', '75', 'tomato, anchovies, grated parmesan, black olives, oregano & olive oil');
INSERT INTO pizza(name, price, description) VALUES('Margherita', '85', 'Margherita - tomato, mozzarella, basil');
INSERT INTO pizza(name, price, description) VALUES('Salamina', '115', 'tomato, mozzarella, salame, mascarpone');
INSERT INTO pizza(name, price, description) VALUES('Burrata', '130', 'vine tomatoes, rucola & burrata');
INSERT INTO pizza(name, price, description) VALUES('''Burning Love''', '135', 'mozzarella, potatoes, fried onions, røget spæk');
INSERT INTO pizza(name, price, description) VALUES('Prosciulto', '130', 'tomato, mozzarella, prosciulto di Norcia, rucola, pesto');
INSERT INTO pizza(name, price, description) VALUES('Gorgonzola e''Nduja', '140', 'tomato, mozzarella, gorgonzola & spicy soft salame');
INSERT INTO pizza(name, price, description) VALUES('Capricciosa', '140', 'tomato, mozzarella, ham, mushrooms, artichokes, olive, egg');
INSERT INTO pizza(name, price, description) VALUES('Bufala', '140', 'tomato, vine tomatoes, buffalo mozzarella, basil');
INSERT INTO pizza(name, price, description) VALUES('Zuccone', '140', 'mozzarella, courgette, smoked salmon, olives');
INSERT INTO pizza(name, price, description) VALUES('Vegetariana', '140', 'tomato, mozzarella, seasonal vegetables, fresh basil, balsamico');
INSERT INTO pizza(name, price, description) VALUES('''Nick says it''s good''', '140', 'mozzarella, cauliflower, green olives, anchovies, capers, chili, pecorino cheese');
INSERT INTO pizza(name, price, description) VALUES('Porcella', '155', 'organic sausage, porcini, tomato, mozzarella');
INSERT INTO pizza(name, price, description) VALUES('Muuu!', '155', 'dry cured beef, vine tomatoes, rucola, shaved parmesan');
INSERT INTO pizza(name, price, description) VALUES('Pepperoni & peperoni', '155', 'tomato, mozzarella, marinaded peppers, spicy salame, smoked cheese, parsley');
INSERT INTO pizza(name, price, description) VALUES('Bieta e Ciauscolo', '155', 'tomato, mozzarella, spicy chards (sølvbede) and freshly cured soft salame');
