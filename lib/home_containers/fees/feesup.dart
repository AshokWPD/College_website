import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../model.dart';
import '../../responsive/lap_home.dart';
import '../../responsive/mob_home.dart';
import '../../responsive/responsive_layout.dart';
import '../../responsive/tab_home.dart';

class UploadFees extends StatefulWidget {
  const UploadFees({Key? key}) : super(key: key);

  @override
  _UploadFeesState createState() => _UploadFeesState();
}

class _UploadFeesState extends State<UploadFees> {
  String dnurl = '';
  bool _isupload = false;

  String title = '';
  final TextEditingController titlecontroller = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    double higt = MediaQuery.of(context).size.height;
    double wigt = MediaQuery.of(context).size.width;

    bool _islap = wigt >= 600;
    bool _ismob = wigt < 600;
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: _islap ? 900 : 400,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 255, 0, 0),
                          Color.fromARGB(255, 25, 0, 255),
                        ]),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.blue,
                              blurRadius: 2,
                              offset: Offset(8.0, 8.0))
                        ],
                        border: Border.all(
                            color: Color.fromARGB(255, 248, 248, 248),
                            width: 3)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        maxLines: 14,
                        controller: titlecontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.keyboard_alt_outlined,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 30,
                          ),
                          enabled: true,
                          labelText: "Give Title ",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.length == 0) {
                            return "Title cannot be empty";
                          }
                        },
                        onChanged: (value) {},
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null) {
                        setState(() {
                          _isupload = true;
                        });
                        Uint8List? file = result.files.first.bytes;
                        String fileName = result.files.first.name;

                        String dep =
                            depp; // Replace with your own department name
                        String uploaderName =
                            namee; // Replace with your own uploader name

                        UploadTask task = FirebaseStorage.instance
                            .ref()
                            .child("feecsv/$dep/$fileName")
                            .putData(file!);

                        String downloadUrl =
                            await (await task).ref.getDownloadURL();

                        PDFModel pdfModel = PDFModel(
                            pdfURL: downloadUrl,
                            uploaderName: uploaderName,
                            uploadedAt: Timestamp.now(),
                            dep: dep,
                            title: titlecontroller.text,
                            filenamee:
                                fileName // Replace with your own PDF title
                            );

                        await FirebaseFirestore.instance
                            .collection('feecsv')
                            .doc(pdfModel.title)
                            .set(pdfModel.toJson());
                      }
                      setState(() {
                        _isupload = false;
                      });
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Fee Upload completed'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResponsiveHome(
                                                    mobileBody: mob_home(),
                                                    tabletBody: tab_home(),
                                                    desktopBody: lap_home())));
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          });
                    },
                    child: _isupload
                        ? CircularProgressIndicator()
                        : Container(
                            width: _islap ? 200 : 190,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 255, 0, 0),
                                  Color.fromARGB(255, 25, 0, 255),
                                ]),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.blue,
                                      blurRadius: 2,
                                      offset: Offset(8.0, 8.0))
                                ],
                                border: Border.all(
                                    color: Color.fromARGB(255, 248, 248, 248),
                                    width: 3)),
                            child: Center(
                              child: Text(
                                "Upload ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Example FEES CSV 👇",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  'assets/appicons/feescsv.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
