DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;
USE employee_db;

CREATE TABLE department (
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(30),
  PRIMARY KEY (id)
);

CREATE TABLE role (
  id INT AUTO_INCREMENT NOT NULL,
  title VARCHAR(30),
  salary VARCHAR(100),
  department_id INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE employee (
  id INT AUTO_INCREMENT NOT NULL,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  role_id INT NOT NULL,
  manager_id INT NOT NULL,
  PRIMARY KEY (id)
);


INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Alicia", "Qiu", 7, 100);


INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Brandon", "Dana", 10, 120);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Andrew", "Gabbi", 8, 130);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Joshua", "Arroyo", 9, 75);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Joshua", "Arroyo", 9, 75);


INSERT INTO role (title, salary, department_id)
VALUES ("Engineer", 9000, 100);

INSERT INTO role (title, salary, department_id)
VALUES ("Manager", 9000, 101);

INSERT INTO role (title, salary, department_id)
VALUES ("Manager", 9000, 102);

INSERT INTO role (title, salary, department_id)
VALUES ("Intern", 9000, 103);

INSERT INTO department (name)
VALUES ("Engineering");


-- SELECT * FROM authors;
-- SELECT * FROM books;

-- -- show ALL books with authors
-- -- INNER JOIN will only return all matching values from both tables
-- SELECT title, firstName, lastName
-- FROM books
-- INNER JOIN authors ON books.authorId = authors.id;

-- -- show ALL books, even if we don't know the author
-- -- LEFT JOIN returns all of the values from the left table, and the matching ones from the right table
-- SELECT title, firstName, lastName
-- FROM books
-- LEFT JOIN authors ON books.authorId = authors.id;

-- -- show ALL books, even if we don't know the author
-- -- RIGHT JOIN returns all of the values from the right table, and the matching ones from the left table
-- SELECT title, firstName, lastName
-- FROM books
-- RIGHT JOIN authors ON books.authorId = authors.id;
