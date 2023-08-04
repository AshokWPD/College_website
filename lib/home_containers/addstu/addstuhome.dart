import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'addstu.dart';
import 'exceladdstu.dart';

class addstuhome extends StatelessWidget {
  static String routename = 'addstuhome';
  const addstuhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Create User'),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => xladdstu(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        Colors.red,
                        Color.fromARGB(255, 2, 19, 253),
                      ]),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blue,
                            blurRadius: 2,
                            offset: Offset(8.0, 8.0))
                      ],
                      border: Border.all(
                          color: Color.fromARGB(255, 248, 248, 248), width: 3)),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Create User',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3.5
                            ..style = PaintingStyle.fill
                            ..color = Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addstu(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        Colors.red,
                        Color.fromARGB(255, 2, 19, 253),
                      ]),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blue,
                            blurRadius: 2,
                            offset: Offset(8.0, 8.0))
                      ],
                      border: Border.all(
                          color: Color.fromARGB(255, 248, 248, 248), width: 3)),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Manual create',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3.5
                            ..style = PaintingStyle.fill
                            ..color = Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: InkWell(
            //     onTap: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => uploadaddstu(),
            //       ),
            //     ),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           color: Color.fromARGB(255, 222, 255, 133)),
            //       height: 100,
            //       width: MediaQuery.of(context).size.width,
            //       child: Center(
            //         child: Text(
            //           'csv create',
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 30,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: InkWell(
            //     onTap: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => csvPage(),
            //       ),
            //     ),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           color: Color.fromARGB(255, 222, 255, 133)),
            //       height: 100,
            //       width: MediaQuery.of(context).size.width,
            //       child: Center(
            //         child: Text(
            //           'csv list',
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 30,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
