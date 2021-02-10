var mysql = require("mysql");
var inquirer = require("inquirer");
var consoleTable = require("console.table");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "Genemis95?",
  database: "employee_db"
});


function findEmployees() {
  inquirer
    .prompt({
      name: "category",
      type: "list",
      message: "What would you like to do?",
      choices: [
        "View departments",
        "View roles",
        "View employees",
        "Add departments",
        "Add employees",
        "Add roles",
        "Update employee roles",
      ]
    })
    .then(function(answer) {
      switch (answer.category) {
      case "View departments":
        viewDepartment();
        break;
      case "View roles":
        viewRoles();
        break;
      case "View employees":
        viewEmployees();
        break;

      case "Add departments":
        addDepartments();
        break;

      case "Add employees":
        addEmployees();
        break;

      case "Add roles":
        addRole();
        break;

      case "Update employee roles":
        updateRoles();
        break;

      case "exit":
        connection.end();
        break;
      }
    });
}

function viewDepartment() {
  var query = "SELECT * FROM department";
  connection.query(query, function (err, res) {
    if (err) throw err;
    console.table(res);
    findEmployees();
    }
  );
}

function viewRoles() {
  var query = "SELECT * FROM role";
  connection.query(query, function (err, res) {
    if (err) throw err;
    console.table(res);
    findEmployees();
  }
  );
}

function viewEmployees() {
  var query = "SELECT * FROM employee";
  connection.query(query, function (err, res) {
    if (err) throw err;
    console.table(res);
    findEmployees();
  }
  );
}


function addDepartments() {
    inquirer
      .prompt({
        name: "addDepartments",
        type: "input",
        message: "What department would you like to add?",
      })
      .then(function (answer) {
      var query = "INSERT INTO department (name) VALUES (?)";
      connection.query(query, answer.addDepartments, function (err) {
      if (err) throw err;
      viewDepartment();
  }
  );
});
}

function addEmployees() {
  inquirer
    .prompt([{
      name: "addFirstName",
      type: "input",
      message: "What is employee's first name?",
    },
    {
      name: "addLastName",
      type: "input",
      message: "What is employee's last name?",
    },
    {
      name: "addRoleID",
      type: "input",
      message: "What is employee's role ID?",
    },
    {
      name: "addManagerID",
      type: "input",
      message: "What is manager's ID?",
    }])
    .then(function (answer) {
      var query = "INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES (?,?,?,?)";
      connection.query(query, [answer.addFirstName, answer.addLastName, answer.addRoleID, answer.addManagerID], function (err) {
        if (err) throw err;
        viewEmployees();
      }
      );
    });
}

function addRole() {
  inquirer
    .prompt([{
      name: "addTitle",
      type: "input",
      message: "What is the employee's title?",
    },
    {
      name: "addSalary",
      type: "input",
      message: "What the employee's salary?",
    },
    {
      name: "addDepartment",
      type: "input",
      message: "What is the employee's department ID?",
    }])
    .then(function (answer) {
      var query = "INSERT INTO role (title, salary, department_id) VALUES (?,?,?)";
      connection.query(query, [answer.addTitle, answer.addSalary, answer.addDepartment], function (err) {
        if (err) throw err;
        viewRoles();
      }
      );
    });
}

// function readEmployees() {
//   console.log("Selecting all employees...\n");
//   connection.query("SELECT * FROM employee", function(err, res) {
//     if (err) throw err;
//     // Log all results of the SELECT statement
//     console.log(res);
//     connection.end();
//   });
// }

connection.connect(function (err) { 
  if (err) throw err; 
  console.log("connected as id " + connection.threadId + "\n"); 
  findEmployees();
});
