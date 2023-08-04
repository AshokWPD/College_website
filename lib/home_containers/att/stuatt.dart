import 'package:flutter/material.dart';

class stuatview extends StatelessWidget {
  final String totelperiods;
  final String attper;
  final String persentage;

  stuatview({
    required this.totelperiods,
    required this.attper,
    required this.persentage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(" Attendance"),
          titleTextStyle: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 23),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
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
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Total Classes 👉',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        totelperiods,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Class Attended  👉',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        attper,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Attendance Percentage 👉 ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        persentage + '%',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: InkWell(
          //     child: Container(
          //       width: MediaQuery.of(context).size.width,
          //       height: 100,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(15),
          //           gradient: const LinearGradient(colors: [
          //             Color.fromARGB(255, 0, 238, 255),
          //             Color.fromARGB(255, 255, 255, 255),
          //           ]),
          //           boxShadow: const [
          //             BoxShadow(
          //                 color: Colors.blue,
          //                 blurRadius: 2,
          //                 offset: Offset(8.0, 8.0))
          //           ],
          //           border: Border.all(
          //               color: Color.fromARGB(255, 248, 248, 248), width: 3)),
          //       child: Padding(
          //         padding: const EdgeInsets.all(20.0),
          //         child: Center(
          //             child: Text(
          //           'Refresh',
          //           style: TextStyle(fontSize: 20, color: Colors.black),
          //         )),
          //       ),
          //     ),
          //   ),
          // ),
        ])));
  }
}
