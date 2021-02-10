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
  PRIMARY KEY (id),
  FOREIGN KEY (department_id) REFERENCES department (id)
  ON DELETE CASCADE
);

CREATE TABLE employee (
  id INT AUTO_INCREMENT NOT NULL,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  role_id INT NOT NULL,
  manager_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES role (id),
  FOREIGN KEY (manager_id) REFERENCES employee (id)
);


INSERT INTO department (name)
VALUES ("Engineering");

INSERT INTO role (title, salary, department_id)
VALUES ("Engineer", 100000, 1);

INSERT INTO role (title, salary, department_id)
VALUES ("Manager", 150000, 1);

INSERT INTO role (title, salary, department_id)
VALUES ("Intern", 25000, 1);


INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Alicia", "Qiu", 2, null);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Brandon", "Dana", 2, 1);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Joshua", "Arroyo", 1, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Andrew", "Gabbi", 3, 3);

