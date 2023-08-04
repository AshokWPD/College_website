import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsa_web/home_containers/test/testlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model.dart';

class dailyTest extends StatefulWidget {
  const dailyTest({Key? key}) : super(key: key);
  static String routeName = 'dailyTest';

  @override
  State<dailyTest> createState() => _dailyTestState();
}

class _dailyTestState extends State<dailyTest> {
  _dailyTestState();
  final CollectionReference leavesCollection =
      FirebaseFirestore.instance.collection('testquestions');
  final TextEditingController qscontroller = TextEditingController();
  final TextEditingController subcontroller = TextEditingController();
  final TextEditingController yearcontroller = TextEditingController();
  var year = '1 year';
  var yearoptions = ['1-year', '2-year', '3-year', '4-year'];
  var _currentyear = '1-year';

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
        automaticallyImplyLeading: false,
        title: Text('Text Questions'),
        titleTextStyle: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 23),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 3, 218, 247),
                    Color.fromARGB(255, 255, 255, 255),
                  ]),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.blue,
                        blurRadius: 2,
                        offset: Offset(8.0, 8.0))
                  ],
                  border: Border.all(
                      color: Color.fromARGB(255, 248, 248, 248), width: 3)),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: DropdownButton<String>(
                hint: Text(
                  'Year',
                  selectionColor: Colors.black,
                  style: TextStyle(fontSize: 17),
                ),
                dropdownColor: Colors.white,
                isDense: true,
                isExpanded: false,
                iconEnabledColor: Colors.black,
                focusColor: Colors.blue,
                items: yearoptions.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Center(
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValueSelected) {
                  setState(() {
                    _currentyear = newValueSelected!;
                    year = newValueSelected;
                  });
                },
                value: _currentyear,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 255, 1, 170),
                      Color.fromARGB(255, 25, 0, 255),
                    ]),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.blue,
                          blurRadius: 2,
                          offset: Offset(8.0, 8.0))
                    ],
                    border: Border.all(
                        color: Color.fromARGB(255, 248, 248, 248), width: 3)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    maxLines: 2,
                    controller: subcontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.keyboard_alt_outlined,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 30,
                      ),
                      enabled: true,
                      labelText: "Give Subject name  ",
                      labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.length == 0) {
                        return "subject name cannot be empty";
                      }
                    },
                    onChanged: (value) {},
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 450,
              child: Text(
                '     Questions :',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 750,
                height: 340,
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
                        color: Color.fromARGB(255, 248, 248, 248), width: 3)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    maxLines: 14,
                    controller: qscontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.keyboard_alt_outlined,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 30,
                      ),
                      enabled: true,
                      labelText: "Give questions here ? ",
                      labelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Quesinons cannot be empty";
                      }
                    },
                    onChanged: (value) {},
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 400,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => qslist()));
                      },
                      child: Container(
                        width: 150,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 196, 240, 2),
                              Color.fromARGB(255, 255, 255, 255),
                            ]),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(8.0, 8.0))
                            ],
                            border: Border.all(
                                color: Color.fromARGB(255, 248, 248, 248),
                                width: 3)),
                        child: Center(
                          child: Text(
                            'view',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        storeqs(regnumm, namee, depp, year, regnumm,
                            subcontroller.text, qscontroller.text);
                      },
                      child: Container(
                        width: 150,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 196, 240, 2),
                              Color.fromARGB(255, 255, 255, 255),
                            ]),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(8.0, 8.0))
                            ],
                            border: Border.all(
                                color: Color.fromARGB(255, 248, 248, 248),
                                width: 3)),
                        child: Center(
                          child: Text(
                            'Post',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void storeqs(
    String Id,
    String name,
    String dep,
    String year,
    String regnum,
    String subb,
    String questionn,
  ) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    TestModel tsmodel = TestModel();
    tsmodel.Id = regnumm;
    tsmodel.upname = name;
    tsmodel.dep = depp;
    tsmodel.year = year;
    tsmodel.regnum = regnumm;
    tsmodel.question = qscontroller.text;
    tsmodel.sub = subcontroller.text;
    await firebaseFirestore
        .collection("testquestions")
        .doc(regnumm)
        .set(tsmodel.toJson());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Question posted successfully')),
    );
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => stuviewbox(
    //             stuname: namee,
    //             stuRegnum: regnumm,
    //             stuReason: resoncontroller.text,
    //             stuyear: year)));
  }
}
