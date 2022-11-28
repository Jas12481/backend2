const express = require("express");
const data = require("./mock_data");

let router = express.Router();

router.get("/users/all", (request, response) => {
  let users = data.get_all_users();
  response.send(users);
});

router.get("/users/by-id", (request, response) => {
  // 1. make sure that user_id is a number
  if (isNaN(parseInt(request.query.user_id))) {
    console.log(
      "Invalid user_id passed in the request. user_id: " + request.query.user_id
    );
    response.status(400).send("Invalid user_id passed in the request.");
  }

  let user = data.get_user_by_user_id(parseInt(request.query.user_id));
  // 2. check if the user is returned for that user_id
  if (user == null || user == undefined) {
    console.log("User not found for user_id: " + request.query.user_id);
    response.status(404).send("User not found.");
  }

  response.send(user);
});

router.post("/users/add", (request, response) => {
  if (!request.body.first_name) {
    response.status(400).send("NUSMoney-001 | first_name is empty");
  } else if (!request.body.last_name) {
    response.status(400).send("NUSMoney-002 | last_name is empty");
  } else if (!request.body.email) {
    response.status(400).send("email is empty");
  } else if (!request.body.user_id) {
    response.status(400).send("user_id is empty");
  } else if (!request.body.phone) {
    response.status(400).send("phone is empty");
  } else if (!request.body.plan_id) {
    response.status(400).send("plan_id is empty");
  } else if (!request.body.signup_date) {
    response.status(400).send("signup_date is empty");
  }

  let user = {
    first_name: request.body.first_name,
    last_name: request.body.last_name,
    email: request.body.email,
    user_id: request.body.user_id,
    phone: request.body.phone,
    plan_id: request.body.plan_id,
    signup_date: request.body.signup_date,
  };
  try {
    data.add_user(user);
  } catch (err) {
    console.log(err);
    response.status(500).send("Internal Server Error");
  }

  response.status(201).send("User added successfully!");
});

module.exports = { router };

