import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsa_web/about.dart';
import 'package:dsa_web/login/lap_login.dart';
import 'package:dsa_web/responsive/responsive_layout.dart';
import 'package:dsa_web/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model.dart';

class drawdata extends StatefulWidget {
  drawdata();
  @override
  _drawdataState createState() => _drawdataState();
}

class _drawdataState extends State<drawdata> {
  _drawdataState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rooll;
  var emaill;
  var id = 'Null';
  var namee;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

var defaultBackgroundColor = Colors.white54;
var appBarColor = Colors.grey[900];
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text(' '),
  // centerTitle: false,
);
var drawerTextColor = TextStyle(
  color: Colors.grey[600],
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

class myDrawer extends StatefulWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rooll;
  var emaill;
  var id = 'Null';
  var namee;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
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

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;

    return Drawer(
      backgroundColor: Colors.grey[300],
      elevation: 0,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/image/logo.jpg',
              width: 250,
              height: 250,
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
              // leading: Icon(Icons.person_2_sharp),
              title: Column(
                children: [
                  Text(
                    '$namee',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    '$rooll',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              // onTap: () => Navigator.pushNamedAndRemoveUntil(
              //     context, ResponsiveHome.routeName, (route) => true),
            ),
          ),
          Divider(),
          Padding(
            padding: tilePadding,
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'D A S H B O A R D',
                style: drawerTextColor,
              ),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, ResponsiveHome.routeName, (route) => true),
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'A B O U T',
                style: drawerTextColor,
              ),
              onTap: () => Navigator.restorablePushNamed(
                context,
                about.routeName,
              ),
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text(
                'H E L P',
                style: drawerTextColor,
              ),
              onTap: () => Navigator.restorablePushNamed(
                context,
                setting.routeName,
              ),
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'L O G O U T',
                  style: drawerTextColor,
                ),
                onTap: () => _auth.signOut().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => laplog())))),
          ),
        ],
      ),
    );
    ;
  }
}

class AppColors {
  static const Color backColor = Color(0xffF6F6F6);
  static const Color mainBlueColor = Color(0xff005BE0);
  static const Color blueDarkColor = Color(0xff252B5C);
  static const Color textColor = Color(0xff53587A);
  static const Color greyColor = Color(0xffAAAAAA);
  static const Color whiteColor = Color(0xffFFFFFF);
}

class AppIcons {
  static const String emailIcon = 'assets/image/EmailIcon.png';
  static const String lockIcon = 'assets/image/lockIcon.png';
  static const String eyeIcon = 'assets/image/EyeIcon.png';
}

TextStyle ralewayStyle = GoogleFonts.raleway();
