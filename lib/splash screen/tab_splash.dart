import 'package:dsa_web/login/lap_login.dart';
import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';

class tabsplash extends StatelessWidget {
  const tabsplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(
          context, laplog.routeName, (route) => false);
    });
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Container(
          color: Colors.transparent,
          height: 300,
          width: 300,
          child: Image.asset("assets/image/reading.png"),
        ),
      ),
    );
    ;
  }
}
