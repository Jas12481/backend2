const express = require("express");
const database = require("./database");

let router = express.Router();

router.get("/users/all", (request, response) => {
  database.connection.query(`select * from users`, (errors, results) => {
    if (errors) {
      console.log(errors);
      response.status(500).send("Internal Server Error");
    } else {
      response.send(results);
    }
  });
});

router.get("/users/by-id", (request, response) => {
  // 1. make sure that user_id is a number
  if (isNaN(parseInt(request.query.user_id))) {
    console.log(
      "Invalid user_id passed in the request. user_id: " + request.query.user_id
    );
    response.status(400).send("Invalid user_id passed in the request.");
  }

  database.connection.query(
    `select * from users where id = ${request.query.user_id}`,
    (errors, results) => {
      if (errors) {
        console.log(errors);
        response.status(500).send("Internal Server Error");
      } else {
        response.send(results);
      }
    }
  );
});

router.post("/users/add", (request, response) => {
  if (!request.body.name) {
    response.status(400).send("NUSMoney-001 | name is empty");
  } else if (!request.body.email) {
    response.status(400).send("email is empty");
  } else if (!request.body.mobile) {
    response.status(400).send("mobile is empty");
  }

  database.connection.query(
    `insert into 
      users (
        name, 
        email, 
        mobile, 
        wallet
      ) values (
        '${request.body.name}',
        '${request.body.email}',
        '${request.body.mobile}',
        '${request.body.wallet}'
      )`,
    (errors, results) => {
      if (errors) {
        console.log(errors);
        response.status(500).send("Internal Server Error");
      } else {
        response.send("User saved!");
      }
    }
  );
});

router.delete("/users/delete", (request, response) => {
  if (isNaN(parseInt(request.query.user_id))) {
    console.log(
      "Invalid user_id passed in the request. user_id: " + request.query.user_id
    );
    response.status(400).send("Invalid user_id passed in the request.");
  }

  database.connection.query(
    `delete from users where id = '${request.query.user_id}'`,
    (errors, results) => {
      if (errors) {
        console.log(errors);
        response.status(500).send("Internal Server Error");
      } else {
        response.send("User deleted!");
      }
    }
  );
});

module.exports = { router };
