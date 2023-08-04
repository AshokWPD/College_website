import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../model.dart';
import 'package:intl/intl.dart';

import '../att/jestview.dart';

class timePage extends StatefulWidget {
  const timePage({Key? key}) : super(key: key);

  @override
  _timePageState createState() => _timePageState();
  static String routename = 'timePage';
}

class _timePageState extends State<timePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  User? user;
  UserModel loggedInUser = UserModel();
  String rooll = '';
  var emaill;
  String id = '';
  String namee = '';
  String depp = '';
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
        });
      });
    }
  }

  String pdfdep = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimeTable List'),
        titleTextStyle: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 23),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('time').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData) {
              return Text('Loading...');
            }

            List<PDFModel> pdfs = snapshot.data!.docs
                .map((doc) =>
                    PDFModel.fromJson(doc.data() as Map<String, dynamic>))
                .toList();

            return ListView.builder(
              itemCount: pdfs.length,
              itemBuilder: (context, index) {
                PDFModel pdf = pdfs[index];

                pdfdep = pdf.dep.toString();
                String pdfpdf = pdf.pdfURL.toString();

                if (depp == pdfdep) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 5, 226, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(6.0, 6.0))
                          ],
                          border: Border.all(
                              color: Color.fromARGB(255, 0, 0, 0), width: 3)),
                      child: ListTile(
                        leading: const Icon(
                          Icons.note_outlined,
                          color: Colors.black,
                          size: 38,
                        ),
                        title: Text(
                          pdf.title.toString(),
                          style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          'Uploader : ' + pdf.uploaderName.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 0, 0)),
                        ),
                        trailing: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.visibility_rounded,
                                color: Colors.black,
                                size: 28,
                              ),
                              onPressed: () async {
                                window.open(pdfpdf, pdfpdf);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => PdfViewer(
                                //       downloadUrl: pdfpdf,
                                //     ),
                                //   ),
                                // );
                              },
                            ),
                            if (rooll != "Student")
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Delete Timetable ?'),
                                          content: Text(
                                              'Are you sure you want to delete this TimeTable?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                // Delete the document from the Firestore collection
                                                // _firestore
                                                //     .collection('clgnotice')
                                                //     .doc(pdf.title)
                                                //     .delete();
                                                if (rooll != "Student")
                                                  await _deletePDF(
                                                      pdf.title.toString(),
                                                      pdf.filenamee.toString());

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
                                  color: Colors.red,
                                  size: 28,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return null;
                }
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> _deletePDF(String pdfId, String filenam) async {
    try {
      // Delete PDF from Firestore
      await _firestore.collection('time').doc(pdfId).delete();

      // Delete PDF from Firebase Storage
      await _storage.ref(filenam).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete PDF')),
      );
    }
  }
}
//   Future<String> _getPDFUrl(String id) async {
//     DocumentSnapshot documentSnapshot =
//         await FirebaseFirestore.instance.collection('pdfs').doc(id).get();
//     Map<String, dynamic>? data =
//         documentSnapshot.data() as Map<String, dynamic>?;
//     if (data != null && data.containsKey('pdfURL')) {
//       return data['pdfURL'] as String;
//     } else {
//       throw Exception('PDF not found');
//     }
//   }
// }
