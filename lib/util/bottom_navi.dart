import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsa_web/college/clglist.dart';
import 'package:dsa_web/college/mob_clg.dart';
import 'package:dsa_web/home_containers/addstu/addstuhome.dart';
import 'package:dsa_web/profile/mob_profile.dart';
import 'package:dsa_web/test/onlinetest.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model.dart';
import '../responsive/responsive_layout.dart';

class MyVerticalBottomNavigationBar extends StatefulWidget {
  @override
  State<MyVerticalBottomNavigationBar> createState() =>
      _MyVerticalBottomNavigationBarState();
}

class _MyVerticalBottomNavigationBarState
    extends State<MyVerticalBottomNavigationBar> {
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

  void onTabTapped(int index) {
    setState(() {
      // _currentIndex = index;
    });

    switch (index) {
      case 0:
        // Navigate to home page
        Navigator.pushNamed(
          context,
          ResponsiveHome.routeName,
        );

        break;
      case 1:
        // Navigate to favorites page
        if (rooll == 'Student') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => clglist()),
          );
        } else
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => clgnot()));

        break;
      case 2:
        // Navigate to cart page
        Navigator.pushNamed(
          context,
          mobprof.routeName,
        );

        break;
      default:
        // Navigate to profile page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => addstuhome(),
          ),
        );

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(destinations: [
      const NavigationRailDestination(
        icon: Icon(Icons.home),
        label: Text('Home'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.book),
        label: Text('College'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.person_2_rounded),
        label: Text('Profile'),
      ),
      if (rooll == "Admin")
        NavigationRailDestination(
          icon: Icon(Icons.add),
          label: Text('Add user'),
        ),
    ], selectedIndex: 0, onDestinationSelected: onTabTapped);
  }
}

class MyBottomNavigation extends StatefulWidget {
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _currentIndex = 0;
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

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        // Navigate to home page
        Navigator.pushNamed(
          context,
          ResponsiveHome.routeName,
        );

        break;
      case 1:
        // Navigate to favorites page
        if (rooll == 'Student') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => clglist()),
          );
        } else
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => clgnot()));

        break;
      case 2:
        // Navigate to cart page
        Navigator.pushNamed(
          context,
          mobprof.routeName,
        );

        break;
      default:
        // Navigate to profile page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => addstuhome(),
          ),
        );

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.book_rounded,
            color: Colors.black,
          ),
          label: 'College',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            color: Colors.black,
          ),
          label: 'Add user',
        ),
      ],
    );
  }
}
