// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../model.dart';
// import '../one_time/admin.dart';
// import '../one_time/student_home.dart';
// import '../one_time/teacher_home.dart';

// class home_come extends StatefulWidget {
//   const home_come({super.key});

//   @override
//   State<home_come> createState() => _home_comeState();
//   static String routename = 'home_come';
// }

// class _home_comeState extends State<home_come> {
//   @override
//   Widget build(BuildContext context) {
//     return commer();
//   }
// }

// class commer extends StatefulWidget {
//   commer();

//   @override
//   _commerState createState() => _commerState();
// }

// class _commerState extends State<commer> {
//   _commerState();
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();
//   var rooll;
//   var emaill;
//   var id = 'Null';
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users") //.where('uid', isEqualTo: user!.uid)
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       this.loggedInUser = UserModel.fromMap(value.data());
//     }).whenComplete(() {
//       CircularProgressIndicator();
//       setState(() {
//         emaill = loggedInUser.email.toString();
//         rooll = loggedInUser.rool.toString();
//         id = loggedInUser.uid.toString();
//       });
//     });
//   }

//   routing() {
//     if (rooll == 'Student') {
//       return student_h(
//         id: id,
//       );
//     } else if (rooll == 'Proffesor') {
//       return teacher_h(id: id);
//     } else {
//       return admin(id: id);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     CircularProgressIndicator();
//     return routing();
//   }
// }
