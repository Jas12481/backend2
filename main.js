// const express = require("express");

// let app = express();

// app.get("/", (request, response) => {
//   response.send("Hello world!");
// });

// app.get("/sum", (request, response) => {
//   let n1 = parseFloat(request.query.n1);
//   let n2 = parseFloat(request.query.n2);

//   let sum = n1 + n2;

//   response.send(`Sum is: ${sum}`);
// });

// app.listen(3000, (errors) => {
//   if (errors) {
//     console.log(errors);
//   } else {
//     console.log("Server running on port 3000!");
//   }
// });

const express = require("express");
const apis = require("./api");

let app = express();
app.use(express.json());
app.use(apis.router);

app.listen(3000, (errors) => {
  if (errors) {
    console.log(errors);
  } else {
    console.log("Server running on port 3000!");
  }
});
