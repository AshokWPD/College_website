import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model.dart';
import 'leavelist/lvstubox.dart';

class leaveview extends StatefulWidget {
  const leaveview({super.key});

  static String routeName = 'leaveview';

  @override
  State<leaveview> createState() => _leaveviewState();
}

class _leaveviewState extends State<leaveview> {
  _leaveviewState();
  final CollectionReference leavesCollection =
      FirebaseFirestore.instance.collection('leave');
  final TextEditingController resoncontroller = TextEditingController();
  final TextEditingController yearcontroller = TextEditingController();
  var year = '1-year';
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
        title: Text('Leave permission'),
        titleTextStyle: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 23),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 0, 238, 255),
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'NAME : $namee',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'DEPARTMENT : $depp',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 230, 63, 202),
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
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                '     Reason for Leave :',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
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
                    maxLines: 9,
                    controller: resoncontroller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.keyboard_alt_outlined,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 30,
                        ),
                        enabled: true,
                        labelText: "Reason of leave ? ",
                        labelStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        border: InputBorder.none),
                    validator: (value) {
                      if (value!.length == 0) {
                        return "reason cannot be empty";
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => stulvlist()));
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
                          'Status',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      storelv(regnumm, namee, depp, year, resoncontroller.text,
                          regnumm, 'pending', "pending");
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
                          'Submit',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool isloaging = false;

  void storelv(
    String Id,
    String name,
    String dep,
    String year,
    String reason,
    String regnum,
    String request,
    String accepter,
  ) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    leavemodel lvmodel = leavemodel();
    lvmodel.Id = regnumm;
    lvmodel.name = name;
    lvmodel.dep = depp;
    lvmodel.year = year;
    lvmodel.reason = reason;
    lvmodel.regnum = regnumm;
    lvmodel.request = 'pending';
    lvmodel.accepter = "Pending";
    await firebaseFirestore
        .collection("leave")
        .doc(regnumm)
        .set(lvmodel.toJson());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Leave  Requested successfully')),
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
