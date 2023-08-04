import 'package:flutter/material.dart';

class stufeesview extends StatelessWidget {
  final String tsfees;
  final String examfees;
  final String busfees;
  final String recodfees;
  final String oldfees;
  final String otherfee;
  final String totelfees;

  stufeesview({
    required this.tsfees,
    required this.examfees,
    required this.busfees,
    required this.recodfees,
    required this.oldfees,
    required this.otherfee,
    required this.totelfees,
  });

  // User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Fees Details"),
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
                        'Tuition fee 👉',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        tsfees,
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
                        'Exam fee 👉',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        examfees,
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
                        'bus / hostel fee 👉 ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        busfees,
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
                        'Record fee 👉 ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        recodfees,
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
                        'Old fee 👉 ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        oldfees,
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
                        'Other fee 👉 ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        otherfee,
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
                        'Totel fee 👉 ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        totelfees,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ])));
  }
}
