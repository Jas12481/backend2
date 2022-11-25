// var name1 = "Dixant";
// let name2 = "Dixant";
// const name3 = "Dixant";

// console.log("My name is Dixant");
// console.log(name2);
// console.log("My name is " + name1);

// Arrays or Lists
// names = ["Jon", "Dixant", "Keith"];
// console.log(names[0]);
// console.log(names[1]);

// Dictionaries
// details = {
//   name: "Dixant",
//   age: 10,
//   email: "dixant@gmail.com",
// };

// console.log(details["age"]);
// console.log(details.name);

// records = [
//   {
//     name: "Dixant",
//     email: "dixant@gmail.com",
//     wallet: 14,
//   },
//   {
//     name: "Jon",
//     email: "jon@gmail.com",
//     wallet: 15,
//   },
//   {
//     name: "Keith",
//     email: "keith@gmail.com",
//     wallet: 16,
//   },
// ];

// console.log(records[1].name);

// let age = 11;

// if (age < 18) {
//   console.log("Not eligible to vote yet.");
// } else {
//   console.log("Please cast your vote.");
// }

records = [
  {
    name: "Dixant",
    email: "dixant@gmail.com",
    wallet: 14,
  },
  {
    name: "Jon",
    email: "jon@gmail.com",
    wallet: 15,
  },
  {
    name: "Keith",
    email: "keith@gmail.com",
    wallet: 16,
  },
  {
    name: "Hassan",
    email: "hassan@gmail.com",
    wallet: 17,
  },
  {
    name: "AiXin",
    email: "aixin@gmail.com",
    wallet: 18,
  },
  {
    name: "Uli",
    email: "uli@gmail.com",
    wallet: 19,
  },
];

// for (i = 0; i < records.length; i++) {
//   //   print the emails of all the records
//   console.log(records[i].email);

//   //   print the following in order
//   //   console.log(records[0].email);
//   //   console.log(records[1].email);
//   //   console.log(records[2].email);
// }

// let sum = 0;
// for (i = 0; i < records.length; i++) {
//   sum = sum + records[i].wallet;
// }

// console.log(sum);

// // normal functions
// function area(radius) {
//   return 3.142 * radius * radius;
// }

// // anonymous function
// let area_anon_func = function (radius) {
//   return 3.142 * radius * radius;
// };

// // arrow function
// let area_arrow_func = (radius) => {
//   return 3.142 * radius * radius;
// };

// let radius_of_circle = 2;
// let area_of_circle = area(radius_of_circle);

// console.log("Area of the circle: " + area_of_circle);

// console.log("Area of the circle (Normal function): " + area(2));
// console.log("Area of the circle (Anonymous function): " + area_anon_func(2));
// console.log("Area of the circle (Arrow function): " + area_arrow_func(2));

// // Callback functions
// let v1 = "Dixant";
// let v2 = (radius) => {
//   return 3.142 * radius * radius;
// };

// function myfunc(param1, param2) {
//   // param2 will be a function and is called a callback function
// }

function conduct_exam(print_questions) {
  console.log("Check the student's ID");
  console.log("Distribute papers");
  console.log("Questions:");
  print_questions(); // print_maths_questions()
  console.log("Collect papers when time is up");
  console.log("Submit answer sheets");
}

function print_maths_questions() {
  console.log("What is the value of 2*4?");
}

function print_science_questions() {
  console.log("Who discovered gravity?");
}

conduct_exam(print_maths_questions);
