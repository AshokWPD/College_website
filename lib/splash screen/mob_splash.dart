import 'dart:collection';

import 'package:dsa_web/login/lap_login.dart';
import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';

class mobsplash extends StatelessWidget {
  const mobsplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(
          context, laplog.routeName, (route) => false);
    });
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Container(
          color: Colors.transparent,
          height: 200,
          width: 200,
          child: Image.asset("assets/image/reading.png"),
        ),
      ),
    );
  }
}
