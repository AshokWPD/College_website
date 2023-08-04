import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsa_web/home_containers/addstu/addstu.dart';
import 'package:dsa_web/home_containers/att/att.dart';
import 'package:dsa_web/home_containers/fees/fees.dart';
import 'package:dsa_web/home_containers/leave/leave.dart';
import 'package:dsa_web/home_containers/noticebord/notice.dart';
import 'package:dsa_web/home_containers/noticebord/notivelist.dart';
import 'package:dsa_web/home_containers/result/result.dart';
import 'package:dsa_web/home_containers/test/test.dart';
import 'package:dsa_web/home_containers/test/testlist.dart';
import 'package:dsa_web/home_containers/time/time.dart';
import 'package:dsa_web/responsive/responsive_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../home_containers/att/ltheattlist.dart';
import '../home_containers/fees/thefeeslist.dart';
import '../home_containers/leave/leavelist.dart';
import '../home_containers/leave/lvyearlist/mainlist.dart';
import '../home_containers/noticebord/noticeup.dart';
import '../home_containers/time/timelist.dart';
import '../model.dart';
import '../util/bottom_navi.dart';
import '../util/home_con.dart';
import '../util/my_tile.dart';

class mob_home extends StatefulWidget {
  mob_home({Key? key}) : super(key: key);

  @override
  State<mob_home> createState() => _mob_homeState();
}

class _mob_homeState extends State<mob_home> {
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
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      drawer: myDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // first 4 boxes in grid
            AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  itemCount: 7,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            if (rooll == 'Student') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => listPDFPage()),
                              );
                            } else
                              Navigator.restorablePushNamed(
                                context,
                                attview.routename,
                              );
                            break;
                          case 1:
                            if (rooll == 'Student') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => feesliststu()),
                              );
                            } else
                              Navigator.restorablePushNamed(
                                context,
                                fees.routeName,
                              );

                            break;
                          case 2:
                            if (rooll == 'Student') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => leaveview()),
                              );
                            } else
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => mainlist()));
                            break;
                          case 3:
                            if (rooll == 'Student') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => timePage()),
                              );
                            } else
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => timeTable()));

                            break;
                          case 4:
                            if (rooll == 'Student') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => qslist()),
                              );
                            } else
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => dailyTest()));
                            break;

                          case 5:
                            Navigator.restorablePushNamed(
                              context,
                              resultview.routeName,
                            );
                            break;

                          default:
                            if (rooll == 'Student') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => notPage()),
                              );
                            } else
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => notice()));

                            break;
                        }
                      },
                      child: Center(child: Image.asset(imagelist[index])),
                    );
                  },
                ),
              ),
            ),

            // list of previous days
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 6,
            //     itemBuilder: (context, index) {
            //       return const MyTile();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigation(),
    );
  }
}
