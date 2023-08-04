import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsa_web/home_containers/addstu/addstuhome.dart';
import 'package:dsa_web/home_containers/noticebord/notice.dart';
import 'package:dsa_web/responsive/responsive_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../home_containers/att/att.dart';
import '../home_containers/att/ltheattlist.dart';
import '../home_containers/fees/fees.dart';
import '../home_containers/fees/thefeeslist.dart';
import '../home_containers/leave/leave.dart';
import '../home_containers/leave/leavelist.dart';
import '../home_containers/leave/lvyearlist/mainlist.dart';
import '../home_containers/noticebord/noticeup.dart';
import '../home_containers/noticebord/notivelist.dart';
import '../home_containers/result/result.dart';
import '../home_containers/test/test.dart';
import '../home_containers/test/testlist.dart';
import '../home_containers/time/time.dart';
import '../home_containers/time/timelist.dart';
import '../model.dart';
import '../util/bottom_navi.dart';
import '../util/home_con.dart';

class lap_home extends StatefulWidget {
  lap_home({Key? key}) : super(key: key);

  @override
  State<lap_home> createState() => _lap_homeState();
}

class _lap_homeState extends State<lap_home> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyVerticalBottomNavigationBar(),
            // open drawer
            const SizedBox(
              width: 250,
              child: myDrawer(),
            ),

            // first half of page
            Expanded(
              child: Column(children: [
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
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
                      },
                      child: Container(
                        width: 150,
                        height: 150,
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
                                color: Color.fromARGB(255, 248, 248, 248),
                                width: 3)),
                        child: Image.asset('assets/appicons/att.png'),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        if (rooll == 'Student') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => feesliststu()),
                          );
                        } else
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => fees()),
                          );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
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
                                color: Color.fromARGB(255, 248, 248, 248),
                                width: 3)),
                        child: Image.asset('assets/appicons/fees.png'),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
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
                      },
                      child: InkWell(
                        child: Container(
                            width: 150,
                            height: 150,
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
                                    color: Color.fromARGB(255, 248, 248, 248),
                                    width: 3)),
                            child: Image.asset(
                              'assets/appicons/leave.png',
                            )),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        if (rooll == 'Student') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => timePage()),
                          );
                        } else
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => timeTable()));
                      },
                      child: Container(
                        width: 150,
                        height: 150,
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
                                color: Color.fromARGB(255, 248, 248, 248),
                                width: 3)),
                        child: Image.asset('assets/appicons/time.png'),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        if (rooll == 'Student') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => qslist()),
                          );
                        } else
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => dailyTest()));
                      },
                      child: Container(
                        width: 150,
                        height: 150,
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
                                color: Color.fromARGB(255, 248, 248, 248),
                                width: 3)),
                        child: Image.asset('assets/appicons/test.png'),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.restorablePushNamed(
                          context,
                          resultview.routeName,
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
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
                                color: Color.fromARGB(255, 248, 248, 248),
                                width: 3)),
                        child: Image.asset('assets/appicons/result.png'),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        if (rooll == 'Student') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => notPage()),
                          );
                        } else
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => notice()));
                      },
                      child: Container(
                          width: 150,
                          height: 150,
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
                                  color: Color.fromARGB(255, 248, 248, 248),
                                  width: 3)),
                          child: Image.asset(
                            'assets/appicons/board.png',
                          )),
                    ),
                    // Spacer(),
                    // Container(
                    //   width: 150,
                    //   height: 150,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       gradient: LinearGradient(colors: [
                    //         Color.fromARGB(255, 230, 63, 202),
                    //         Color.fromARGB(255, 255, 255, 255),
                    //       ]),
                    //       boxShadow: const [
                    //         BoxShadow(
                    //             color: Colors.blue,
                    //             blurRadius: 2,
                    //             offset: Offset(8.0, 8.0))
                    //       ],
                    //       border: Border.all(
                    //           color: Color.fromARGB(255, 248, 248, 248),
                    //           width: 3)),
                    //   child: Column(
                    //     children: [
                    //       Image.asset('assets/appicons/att.png'),
                    //       Text('ATTENDANCE')
                    //     ],
                    //   ),
                    // ),
                    // Spacer(),
                    // Container(
                    //   width: 150,
                    //   height: 150,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       gradient: LinearGradient(colors: [
                    //         Color.fromARGB(255, 230, 63, 202),
                    //         Color.fromARGB(255, 255, 255, 255),
                    //       ]),
                    //       boxShadow: const [
                    //         BoxShadow(
                    //             color: Colors.blue,
                    //             blurRadius: 2,
                    //             offset: Offset(8.0, 8.0))
                    //       ],
                    //       border: Border.all(
                    //           color: Color.fromARGB(255, 248, 248, 248),
                    //           width: 3)),
                    //   child: Column(
                    //     children: [
                    //       Image.asset('assets/appicons/att.png'),
                    //       Text('ATTENDANCE')
                    //     ],
                    //   ),
                    // )
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer()
                  ],
                ),
                Spacer(),
              ]),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
