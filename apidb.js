const express = require("express");
const data = require("./db");

let router = express.Router();

router.get("/customers/all", (request, response) => {
//    let users = data.get_all_users();
    var customers;
    data.connection.query(`select * from customer`, (error, results) => {
        if (error) {
        console.log(error);
        response.send(error);
        } else {
        console.log(results);
        customers = results;
        response.send(customers);
        }
    });
 
});

router.get("/customer/by-id", (request, response) => {
//  let user = data.get_user_by_user_id(parseInt(request.query.user_id));
  var customer;
  data.connection.query(`select * from customer where customer_id = ${request.query.customer_id}`, (error, results) => {
      if (error) {
      console.log(error);
      response.send(error);
      } else {
      console.log(results);
      customer = results;
      response.send(customer);
      }
  });

});

module.exports = { router };
