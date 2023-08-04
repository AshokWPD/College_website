import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../model.dart';
import 'onlylvbox.dart';

class stulvlist extends StatefulWidget {
  @override
  State<stulvlist> createState() => _stulvlistState();
}

class _stulvlistState extends State<stulvlist> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user;
  UserModel loggedInUser = UserModel();
  String rooll = '';
  var emaill;
  String id = '';
  String namee = '';
  String depp = '';
  String regnumm = '';
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
          depp = loggedInUser.dep.toString();
          regnumm = loggedInUser.regnum.toString();

          // depp = loggedInUser.dep.toString();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("your's permission list"),
        titleTextStyle: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 23),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('leave').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData) {
              return Text('Loading...');
            }

            List<leavemodel> pdfs = snapshot.data!.docs
                .map((doc) =>
                    leavemodel.fromJson(doc.data() as Map<String, dynamic>))
                .toList();

            List<leavemodel> filteredPdfs =
                pdfs.where((pdf) => pdf.regnum.toString() == regnumm).toList();

            if (filteredPdfs.isEmpty) {
              return Center(child: Text('There is no Leave Request'));
            }

            return ListView.builder(
              itemCount: filteredPdfs.length,
              itemBuilder: (context, index) {
                leavemodel pdf = filteredPdfs[index];
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: pdf.request.toString() == 'Accepted'
                          ? Colors.green
                          : pdf.request.toString() == 'Canceled'
                              ? Colors.red
                              : Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(6.0, 6.0),
                        )
                      ],
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 3,
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.note_outlined,
                        color: Colors.black,
                        size: 38,
                      ),
                      title: Text(
                        pdf.name.toString(),
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        'year : ' +
                            pdf.year.toString() +
                            ' ' +
                            ' ' +
                            pdf.dep.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.visibility_rounded,
                              color: Colors.black,
                              size: 28,
                            ),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => stuviewbox(
                                    stuReason: pdf.reason.toString(),
                                    stuRegnum: pdf.regnum.toString(),
                                    stuname: pdf.name.toString(),
                                    stuyear: pdf.year.toString(),
                                    sturequest: pdf.request.toString(),
                                    stuaccepter: pdf.accepter.toString(),
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Delite Leave Request?'),
                                      content: Text(
                                          'Are you sure you want to delete this leave request?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Delete the document from the Firestore collection
                                            _firestore
                                                .collection('leave')
                                                .doc(pdf.Id)
                                                .delete();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Delete'),
                                        )
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(
                              Icons.delete_rounded,
                              color: Colors.black,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}



















///////////////////////////////////////////////////////////////////////////////




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class stuviewbox extends StatelessWidget {
//   final String stuname;
//   final String stuRegnum;
//   final String stuReason;
//   final String stuyear;
  
//   stuviewbox({
//     required this.stuname,
//     required this.stuRegnum,
//     required this.stuReason,
//     required this.stuyear,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(stuname + "'s Request"),
//         titleTextStyle: TextStyle(
//             color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 23),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 150,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     gradient: const LinearGradient(colors: [
//                       Color.fromARGB(255, 0, 238, 255),
//                       Color.fromARGB(255, 255, 255, 255),
//                     ]),
//                     boxShadow: const [
//                       BoxShadow(
//                           color: Colors.blue,
//                           blurRadius: 2,
//                           offset: Offset(8.0, 8.0))
//                     ],
//                     border: Border.all(
//                         color: Color.fromARGB(255, 248, 248, 248), width: 3)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Name : ',
//                             style: TextStyle(
//                                 fontSize: 22, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             'Year : ',
//                             style: TextStyle(
//                                 fontSize: 22, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             'Register Number : ',
//                             style: TextStyle(
//                                 fontSize: 22, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Flexible(
//                             flex: 1,
//                             child: Text(
//                               stuname,
//                               style: TextStyle(
//                                   fontSize: 22, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Text(
//                             stuyear,
//                             style: TextStyle(
//                                 fontSize: 22, fontWeight: FontWeight.bold),
//                           ),
//                           Flexible(
//                             child: Text(
//                               stuRegnum,
//                               style: TextStyle(
//                                   fontSize: 22, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width - 5,
//               height: 150,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   gradient: const LinearGradient(colors: [
//                     Color.fromARGB(255, 0, 238, 255),
//                     Color.fromARGB(255, 255, 255, 255),
//                   ]),
//                   boxShadow: const [
//                     BoxShadow(
//                         color: Colors.blue,
//                         blurRadius: 2,
//                         offset: Offset(8.0, 8.0))
//                   ],
//                   border: Border.all(
//                       color: Color.fromARGB(255, 248, 248, 248), width: 3)),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Reason : ',
//                           style: TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     Spacer(),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           stuReason,
//                           style: TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 20),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 70,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.red,
//                       boxShadow: const [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 5,
//                             offset: Offset(8.0, 8.0))
//                       ],
//                       border: Border.all(
//                           color: Color.fromARGB(255, 248, 248, 248), width: 3)),
//                   child: Center(
//                     child: Text(
//                       'Status: ' ,
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
