CREATE DATABASE IF NOT EXISTS salespeople; -- Создаем БД с именем salespeople, если она не была создана

USE salespeople; -- Подключаемся к БД salespeople

  -- 1. Создание таблицы
CREATE TABLE IF NOT EXISTS salespeople (
  snum INT UNSIGNED PRIMARY KEY NOT NULL,
  sname VARCHAR(45) NOT NULL,
  city VARCHAR(45) NOT NULL,
  comm FLOAT UNSIGNED
  );
  
  -- 2. Заполняем таблицу
INSERT salespeople (snum, sname, city, comm)
VALUES 
  (1001,"Peel", "London", .12),
  (1002,"Serres", "San Jose", .13),
  (1004,"Motika", "London", .11),
  (1007,"Rifkin", "Barcelona", .15),
  (1003,"Axelrod", "New York", .10);
  
   -- 3. Просмотр таблицы
SELECT * FROM salespeople;

/*
  1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: 
  city, sname, snum, comm. (используя SELECT) 
*/
  SELECT city, sname, snum, comm FROM salespeople;

/*
  3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без
  каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”)
*/
SELECT snum, sname
FROM salespeople;

---------------------------------------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS customers; -- Создаем БД с именем customers, если она не была создана

USE customers; -- Подключаемся к БД customers

  -- 1. Создание таблицы
CREATE TABLE IF NOT EXISTS customers (
  cnum YEAR PRIMARY KEY NOT NULL,
  cname VARCHAR(45) NOT NULL,
  city VARCHAR(45) NOT NULL,
  rating INT NOT NULL,
  snum INT NOT NULL
  );
  
  -- 2. Заполняем таблицу
INSERT customers (cnum, cname, city, rating, snum)
VALUES 
  (2001,"Hoffman", "London", 100, 1001),
  (2002,"Giovanni", "Rome", 200, 1003),
  (2003,"Liu", "San Jose", 200, 1002),
  (2004,"Grass", "Berlin", 300, 1002),
  (2006,"Clemens", "London", 100, 1001),
  (2008,"Cisneros", "San Jose", 300, 1007),
  (2007,"Pereira", "Rome", 100, 1004);
  
  -- 3. Просмотр таблицы
SELECT * FROM customers;

/*
  2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем
  каждого заказчика в городе San Jose. (“заказчики”)
*/
SELECT cname, rating, city FROM customers WHERE city LIKE 'San Jose';

/*
  4. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G.
Используется оператор "LIKE": (“заказчики”) 
*/
SELECT * FROM customers WHERE cname LIKE 'G%';

/*
  7.Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых
  рейтинг больше 100 и они находятся не в Риме.
*/
SELECT cname, rating FROM customers WHERE rating > 100;

-----------------------------------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS orders; -- Создаем БД с именем orders, если она не была создана

USE orders; -- Подключаемся к БД salespeople

  -- 1. Создание таблицы
CREATE TABLE IF NOT EXISTS orders (
  onum INT NOT NULL,
  amt DECIMAL(6,2) NOT NULL,
  odate DATE NOT NULL,
  cnum YEAR NOT NULL,
  snum INT NOT NULL
  );
  
  -- 2. Заполняем таблицу
INSERT orders (onum, amt, odate, cnum, snum)
VALUES 
  (3001, 18.69, '1990-03-10', 2008, 1007),
  (3003, 767.19, '1990-03-10', 2001, 1001),
  (3002, 1900.10, '1990-03-10', 2007, 1004),
  (3005, 5160.45, '1990-03-10', 2003, 1002),
  (3006, 1098.16, '1990-03-10', 2008, 1007),
  (3009, 1713.23, '1990-04-10', 2002, 1003),
  (3007, 75.75, '1990-04-10', 2004, 1002),
  (3008, 4723.00, '1990-05-10', 2006, 1001),
  (3010, 1309.95, '1990-06-10', 2004, 1002),
  (3011, 9891.88, '1990-06-10', 2006, 1001);
  
  -- 3. Просмотр таблицы
SELECT * FROM orders;

/*
  5.Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000.
(“Заказы”, “amt” - сумма)
*/
SELECT * FROM orders WHERE amt > 1.00;

/*
  Напишите запрос который выбрал бы наименьшую сумму заказа.
  (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
*/
SELECT MIN(amt) FROM orders;

-----------------------------------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS staff; -- Создаем БД staff, если ее раньше не было

USE staff; -- Подключаемся к конкретной БД

  -- 1. Создание таблицы
CREATE TABLE IF NOT EXISTS staff (
  id INT AUTO_INCREMENT PRIMARY KEY, 
  first_name VARCHAR(45), 
  last_name VARCHAR(45), 
  post VARCHAR(45), 
  seniority INT, 
  -- DECIMAL(общее количество знаков, количество знаков после запятой)
  -- DECIMAL(5,2) будут числа от -999.99 до 999.99
  salary DECIMAL(8, 2), 
  -- это числа от -999999.99 до 999999.99
  age INT
);

  -- 2. Заполнение данными
INSERT  staff (first_name, last_name, post, seniority, salary, age)
VALUES
	 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49),
	 ('Петр', 'Петров', 'Главный инженер', 45, 125000, 65);
 
  -- 3. Просмотр таблицы
SELECT * FROM staff;

/*
  1. Отсортируйте поле “зарплата” в порядке убывания
*/
SELECT * 
FROM staff
ORDER BY salary DESC;

/*
  1. Отсортируйте поле “зарплата” в порядке возрастания
*/
SELECT *
FROM staff
ORDER BY salary;

/*
  3. Выполните группировку всех сотрудников по специальности ,
  суммарная зарплата которых превышает 100000
*/
SELECT post, SUM(salary) as sum_salary
FROM staff
GROUP BY post
HAVING sum_salary > 100000;
