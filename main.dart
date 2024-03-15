import 'package:flutter/material.dart';

import 'package:demoapp/screens/login.dart';
import 'package:demoapp/screens/register.dart';
import 'package:demoapp/screens/password.dart';

// import 'package:demoapp/screens/volunteer.dart';
//import 'package:demoapp/screens/disaster.dart';
//import 'package:demoapp/screens/voljob.dart';




void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyLogin(),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'password': (context) => const MyPassword(),
    },
  ));
}



// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: const MyVolunteer(),
//     routes: {
//       'volunteer': (context) => const MyVolunteer(),
//     },
//   ));
// }

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: const MyDisaster(),
//     routes: {
//       'disaster': (context) => const MyDisaster(),
//     },
//   ));
// }


// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: const MyVoljob(),
//     routes: {
//       'voljob': (context) => const MyVoljob(),
//     },
//   ));
// }