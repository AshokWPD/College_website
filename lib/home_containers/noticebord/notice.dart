import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model.dart';
import 'noticeup.dart';
import 'notivelist.dart';

class notice extends StatefulWidget {
  const notice({super.key});

  @override
  State<notice> createState() => _noticeState();
  static String routeName = 'notice';
}

class _noticeState extends State<notice> {
  late String pdfurl;

  User? user;
  UserModel loggedInUser = UserModel();
  String rooll = '';
  var emaill;
  String id = '';
  String namee = '';
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get()
          .then((value) {
        this.loggedInUser = UserModel.fromMap(value.data());
      }).whenComplete(() {
        CircularProgressIndicator();
        setState(() {
          emaill = loggedInUser.email.toString();
          rooll = loggedInUser.rool.toString();
          id = loggedInUser.uid.toString();
          namee = loggedInUser.name.toString();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'NOTICE BOARD ',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 21,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Uploadnot(),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 247, 0, 255),
                      Color.fromARGB(255, 4, 0, 255),
                    ]),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.blue,
                          blurRadius: 2,
                          offset: Offset(8.0, 8.0))
                    ],
                    border: Border.all(
                        color: Color.fromARGB(255, 248, 248, 248), width: 3)),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'Upload Department Notice',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 253, 253),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => notPage(),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 0, 255, 221),
                      Color.fromARGB(255, 0, 255, 76),
                    ]),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.blue,
                          blurRadius: 2,
                          offset: Offset(8.0, 8.0))
                    ],
                    border: Border.all(
                        color: Color.fromARGB(255, 248, 248, 248), width: 3)),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'View List of Notice',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//       body: Column(children: [
//         if (isstu)
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Uploadnot(),
//                   ),
//                 );
//               },
//               child: Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(20)),
//                   width: 200,
//                   height: 50,
//                   child: const Center(
//                     child: Text(
//                       'Upload notice',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ElevatedButton(
//           onPressed: () async {
//             // ignore: use_build_context_synchronously
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => notPage()),
//             );
//           },
//           child: Text('View NOTICE'),
//         ),
//       ]),
//     );
//   }
// }
