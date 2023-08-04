import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class stuviewbox extends StatelessWidget {
  final String stuname;
  final String stuRegnum;
  final String stuReason;
  final String stuyear;
  final String sturequest;
  final String stuaccepter;
  stuviewbox(
      {required this.stuname,
      required this.stuRegnum,
      required this.stuReason,
      required this.stuyear,
      required this.sturequest,
      required this.stuaccepter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(stuname + "'s Request"),
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
                height: 120,
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
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Year : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Register Number : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text(
                              stuname,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            stuyear,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            child: Text(
                              stuRegnum,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    child: Text(
                      'Reason :',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 5,
              height: 350,
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
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 350,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            stuReason,
                            maxLines: 10,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: sturequest == 'Accepted'
                          ? Colors.green
                          : sturequest == 'Canceled'
                              ? Colors.red
                              : Colors.yellow,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(8.0, 8.0))
                      ],
                      border: Border.all(
                          color: Color.fromARGB(255, 248, 248, 248), width: 3)),
                  child: Center(
                    child: Text(
                      'Status : ' + sturequest,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: sturequest == 'Accepted'
                          ? Colors.green
                          : sturequest == 'Canceled'
                              ? Colors.red
                              : Colors.yellow,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(8.0, 8.0))
                      ],
                      border: Border.all(
                          color: Color.fromARGB(255, 248, 248, 248), width: 3)),
                  child: Center(
                    child: Text(
                      'By, ' + stuaccepter,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
