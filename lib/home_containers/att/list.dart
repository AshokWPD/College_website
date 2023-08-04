import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsa_web/home_containers/att/attcsv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../model.dart';
import '../addstu/exceladdstu.dart';
import 'jestview.dart';

class PDFPage extends StatefulWidget {
  const PDFPage({Key? key}) : super(key: key);

  @override
  _PDFPageState createState() => _PDFPageState();
  static String routename = 'PDFPage';
}

class _PDFPageState extends State<PDFPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance List'),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('attcsv').snapshots(),
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

            List<PDFModel> filteredPdfs =
                pdfs.where((pdf) => pdf.dep.toString() == depp).toList();

            if (filteredPdfs.isEmpty) {
              return Center(child: Text('There is no CSV files'));
            }

            return ListView.builder(
              itemCount: filteredPdfs.length,
              itemBuilder: (context, index) {
                PDFModel pdf = filteredPdfs[index];
                String pdfurl = pdf.pdfURL.toString();

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
                        pdf.title.toString(),
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        'Uploader : ' + pdf.uploaderName.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 0, 0),
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
                              window.open(pdfurl, pdfurl);
                            },
                          ),
                          if (rooll != "Student")
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Delete Attendance ?'),
                                        content: Text(
                                            'Are you sure you want to delete this Attendance ?'),
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
      await _firestore.collection('attcsv').doc(pdfId).delete();

      // Delete PDF from Firebase Storage
      await _storage.ref(filenam).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('CSV deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete CSV')),
      );
    }
  }
}
