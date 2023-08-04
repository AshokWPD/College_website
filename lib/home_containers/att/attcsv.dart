import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../../model.dart';
import '../addstu/listadd.dart';
import '../addstu/uploadadstu.dart';
import 'package:http/http.dart' as http;

// ignore: depend_on_referenced_packages

class attcsv extends StatefulWidget {
  const attcsv({super.key});

  @override
  State<attcsv> createState() => _attcsvState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _attcsvState extends State<attcsv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Attendance CSV'),
        titleTextStyle: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 23),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => uploadaddstu(),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 247, 0, 255),
                      Color.fromARGB(255, 4, 0, 255),
                    ]),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.blue,
                          blurRadius: 2,
                          offset: Offset(8.0, 8.0))
                    ],
                    border: Border.all(
                        color: Color.fromARGB(255, 248, 248, 248), width: 3)),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'Upload CSV data',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
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
                  builder: (context) => csvPage(),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 0, 255, 221),
                      Color.fromARGB(255, 0, 255, 76),
                    ]),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.blue,
                          blurRadius: 2,
                          offset: Offset(8.0, 8.0))
                    ],
                    border: Border.all(
                        color: Color.fromARGB(255, 248, 248, 248), width: 3)),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'View List of CSV file',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void registerAttendeesFromCsv(String csvUrl) {
  final CollectionReference attendees =
      FirebaseFirestore.instance.collection("attendees");

  // Download the CSV file contents using dart:io
  HttpClient().getUrl(Uri.parse(csvUrl)).then((request) {
    return request.close();
  }).then((response) {
    response.fold<List<int>>(
        <int>[], (buffer, data) => buffer..addAll(data)).then((csvData) {
      // Convert the CSV data to a 2D list of dynamic values
      List<List<dynamic>> rows =
          CsvToListConverter().convert(utf8.decode(csvData));

      // Process the rows as needed
      // Assuming the CSV data has headers: regnum,name,dep,Ttclass,Atclass,perclass
      for (int i = 1; i < rows.length; i++) {
        var attendeeDetails = {
          'dep': rows[i][2].toString(),
          'name': rows[i][1].toString(),
          'regnum': rows[i][0].toString(),
          'Ttclass': rows[i][3].toString(),
          'Atclass': rows[i][4].toString(),
          'perclass': rows[i][5].toString(),
        };

        // Add the attendee to Firebase
        Attendmodel attendee = Attendmodel.fromMap(attendeeDetails);
        var attendeeDoc = attendees.doc(rows[i][0].toString());
        attendeeDoc.set(attendee.toDocument()).then((value) {
          // Document added successfully
          print("Attendee added successfully: ");
        }).catchError((error) {
          // Error adding document
          print("Error adding attendee: $error");
        });
      }
    });
  });
}


// Future<void> storeCsvData(String csvUrl) async {
//   // Download the CSV data from the URL
//   final http.Response response = await http.get(Uri.parse(csvUrl));
//   final String csvString = response.body;

//   // Store each row of CSV data as a Firestore document
//   final CollectionReference<Map<String, dynamic>> collectionRef =
//       FirebaseFirestore.instance.collection('attendeesssss');
//   final List<List<dynamic>> rows =
//       const CsvToListConverter().convert(csvString);
//   for (int i = 1; i < rows.length; i++) {
//     final docData = {
//       'dep': rows[i][2].toString(),
//       'name': rows[i][1].toString(),
//       'regnum': rows[i][0].toString(),
//       'Ttclass': rows[i][3].toString(),
//       'Atclass': rows[i][4].toString(),
//       'perclass': rows[i][5].toString(),
//     };
//     await collectionRef.add(docData);
//   }
// }

// Future<void> storeCsvData() async {
//   // Retrieve the CSV data from Firestore
//   final QuerySnapshot<Map<String, dynamic>> snapshot =
//       await FirebaseFirestore.instance.collection('csvuser').get();
//   final List<Map<String, dynamic>> data =
//       snapshot.docs.map((doc) => doc.data()).toList();

//   // Store each row of CSV data as a Firestore document
//   final CollectionReference<Map<String, dynamic>> collectionRef =
//       FirebaseFirestore.instance.collection('csvdata');
//   for (final docData in data) {
//     final List<List<dynamic>> rows = [
//       [
//         docData['regnum'],
//         docData['name'],
//         docData['dep'],
//         docData['Ttclass'],
//         docData['Atclass'],
//         docData['perclass'],
//       ]
//     ];
//     final String csv = const ListToCsvConverter().convert(rows);
//     final newDocData = {'csv': csv}; // assign docData to new variable
//     await collectionRef.add(newDocData); // use newDocData in add method
//   }
// }

// Future<void> storeCsvData() async {
//   // Read the CSV file and convert it to a list of dictionaries
//   final csvData = await rootBundle.loadString('assets/data.csv');
//   final List<List<dynamic>> rows = const CsvToListConverter().convert(csvData);
//   final List<Map<String, dynamic>> data = [];
//   for (final row in rows) {
//     data.add({
//       'field1': row[0],
//       'field2': row[1],
//       'field3': row[2],
//       // add more fields as necessary
//     });
//   }

//   // Store the list of documents in Firestore
//   final CollectionReference<Map<String, dynamic>> collectionRef =
//       FirebaseFirestore.instance.collection('myCollection');
//   for (final docData in data) {
//     await collectionRef.doc().set(docData);
//   }
// }
// Future<void> registerAttendeesFromCsv(String csvUrl) async {
//   final CollectionReference attendees =
//       FirebaseFirestore.instance.collection("attendees");

//   // Download the CSV file contents using http.get()
//   try {
//     final response = await http.get(Uri.parse(csvUrl));
//     final csvData = response.body;

//     // Convert the CSV data to a 2D list of dynamic values
//     List<List<dynamic>> rows = const CsvToListConverter().convert(csvData);

//     // Process the rows as needed
//     // Assuming the CSV data has headers: regnum,name,dep,Ttclass,Atclass,perclass
//     for (int i = 1; i < rows.length; i++) {
//       var attendeeDetails = {
//         'dep': rows[i][2].toString(),
//         'name': rows[i][1].toString(),
//         'regnum': rows[i][0].toString(),
//         'Ttclass': rows[i][3].toString(),
//         'Atclass': rows[i][4].toString(),
//         'perclass': rows[i][5].toString(),
//       };

//       // Add the attendee to Firebase
//       Attendmodel attendee = Attendmodel.fromMap(attendeeDetails);
//       var attendeeDoc = attendees.doc(rows[i][0].toString());
//       try {
//         await attendeeDoc.set(attendee.toDocument());
//         // Document added successfully
//         print("Attendance added successfully: ");
//       } catch (error) {
//         // Error adding document
//         print("Error adding attendance: $error");
//       }
//     }
//   } catch (error) {
//     // Error fetching CSV data
//     print("Error fetching CSV data: $error");
//   }
// }

// Future<void> registerAttendeesFromCsv(String csvUrl) async {
//   final CollectionReference attendees =
//       FirebaseFirestore.instance.collection("attendees");

//   // Download the CSV file contents using http.get()
//   final response = await http.get(Uri.parse(csvUrl));
//   final csvData = response.body;

//   // Convert the CSV data to a 2D list of dynamic values
//   List<List<dynamic>> rows = const CsvToListConverter().convert(csvData);

//   // Process the rows as needed
//   // Assuming the CSV data has headers: regnum,name,dep,Ttclass,Atclass,perclass
//   for (int i = 1; i < rows.length; i++) {
//     var attendeeDetails = {
//       'dep': rows[i][2].toString(),
//       'name': rows[i][1].toString(),
//       'regnum': rows[i][0].toString(),
//       'Ttclass': rows[i][3].toString(),
//       'Atclass': rows[i][4].toString(),
//       'perclass': rows[i][5].toString(),
//     };

//     // Add the attendee to Firebase
//     Attendmodel attendee = Attendmodel.fromMap(attendeeDetails);
//     var attendeeDoc = attendees.doc(rows[i][0].toString());
//     try {
//       await attendeeDoc.set(attendee.toDocument());
//       // Document added successfully
//       print("Attendance added successfully: ");
//     } catch (error) {
//       // Error adding document
//       print("Error adding attendance: $error");
//     }
//   }
// }

// Future<void> registerAttendeesFromCsv(String csvUrl) async {
//   final CollectionReference attendees =
//       FirebaseFirestore.instance.collection("attendees");

//   // Download the CSV file contents using http
//   final response = await http.get(Uri.parse(csvUrl));
//   final csvData = response.body;

//   // Convert the CSV data to a 2D list of dynamic values
//   List<List<dynamic>> rows = CsvToListConverter().convert(csvData);

//   // Process the rows as needed
//   // Assuming the CSV data has headers: regnum,name,dep,Ttclass,Atclass,perclass
//   for (int i = 1; i < rows.length; i++) {
//     var attendeeDetails = {
//       'dep': rows[i][2].toString(),
//       'name': rows[i][1].toString(),
//       'regnum': rows[i][0].toString(),
//       'Ttclass': rows[i][3].toString(),
//       'Atclass': rows[i][4].toString(),
//       'perclass': rows[i][5].toString(),
//     };

//     // Add the attendee to Firebase
//     Attendmodel attendee = Attendmodel.fromMap(attendeeDetails);
//     var attendeeDoc = attendees.doc(rows[i][0].toString());
//     await attendeeDoc.set(attendee.toDocument()).then((value) {
//       // Document added successfully
//       print("Attendance added successfully: ");
//     }).catchError((error) {
//       // Error adding document
//       print("Error adding attendance: $error");
//     });
//   }
// }


// Future<void> registerAttendeesFromCsv(String csvUrl) async {
//   final CollectionReference attendees =
//       FirebaseFirestore.instance.collection("attendees");

//   // Download the CSV file contents using dart:io
//   final uri = Uri.parse(csvUrl);
//   final request = await HttpClient().getUrl(uri);
//   final response = await request.close();
//   final csvData = await response.transform(utf8.decoder).join();

//   // Convert the CSV data to a 2D list of dynamic values
//   List<List<dynamic>> rows = CsvToListConverter().convert(csvData);

//   // Process the rows as needed
//   // Assuming the CSV data has headers: regnum,name,dep,Ttclass,Atclass,perclass
//   for (int i = 1; i < rows.length; i++) {
//     var attendeeDetails = {
//       'dep': rows[i][2].toString(),
//       'name': rows[i][1].toString(),
//       'regnum': rows[i][0].toString(),
//       'Ttclass': rows[i][3].toString(),
//       'Atclass': rows[i][4].toString(),
//       'perclass': rows[i][5].toString(),
//     };

//     // Add the attendee to Firebase
//     Attendmodel attendee = Attendmodel.fromMap(attendeeDetails);
//     var attendeeDoc = attendees.doc(rows[i][0].toString());
//     await attendeeDoc.set(attendee.toDocument()).then((value) {
//       // Document added successfully
//       print("Attendance added successfully: ");
//     }).catchError((error) {
//       // Error adding document
//       print("Error adding attendance: $error");
//     });
//   }
// }




///////////////////////////////////////////////////////////////////////////////////////////////////////old//////////////////////////////////////////

// int emailIndex = rows[0].indexOf("email");
//     int passwordIndex = rows[0].indexOf("password");
//     int roolIndex = rows[0].indexOf("rool");
//     int depIndex = rows[0].indexOf("dep");
//     int nameIndex = rows[0].indexOf("name");
//     int regnumIndex = rows[0].indexOf("regnum");

//     for (int i = 1; i < rows.length; i++) {
//       String email = rows[i][emailIndex];
//       String password = rows[i][passwordIndex];
//       String rool = rows[i][roolIndex];
//       String dep = rows[i][depIndex];
//       String name = rows[i][nameIndex];
//       String regnum = rows[i][regnumIndex];

//       try {
//         UserCredential userCredential =
//             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         // User registration successful, store additional details in Firestore
//         UserModel userModel = UserModel(
//           uid: userCredential.user!.uid,
//           email: email,
//           rool: rool,
//           dep: dep,
//           name: name,
//           regnum: regnum,
//           password: password,
//         );
//         await FirebaseFirestore.instance
//             .collection("users")
//             .doc(userCredential.user!.uid)
//             .set(userModel.toDocument());
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           // Handle weak password error
//         } else if (e.code == 'email-already-in-use') {
//           // Handle email already in use error
//         } else {
//           // Handle other FirebaseAuth errors
//         }
//       } on FirebaseException catch (e) {
//         // Handle other Firebase errors
//       } catch (e) {
//         // Handle other errors
//       }
//     }
//   } else {
//     // User canceled the file picker
//   }