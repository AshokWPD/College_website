import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model.dart';

class addstu extends StatefulWidget {
  const addstu({super.key});

  static String routename = 'addstu';

  @override
  State<addstu> createState() => _addstuState();
}

class _addstuState extends State<addstu> {
  _addstuState();

  final TextEditingController confirmpassController = TextEditingController();

  var dep = "ECE";
// depart ment
  var depOptions = [
    'ECE',
    'EEE',
    'CSE',
    'AGRI',
    'CIVIL',
    'AI',
    'MECH',
  ];

  final TextEditingController emailController = TextEditingController();
  final TextEditingController regnumcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  var role = "Student";
  // File? file;

  //role
  var roleOptions = ['Student', 'Proffesor', 'Admin'];

  bool showProgress = false;
  bool visible = false;

  final _auth = FirebaseAuth.instance;
  var _currentDepSelected = "ECE";
  var _currentRoleSelected = "Student";
  final _formkey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isObscure2 = true;

// back end
  void signUp(String email, String password, String role, String dep,
      String name, String regnum) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        showProgress = true;
      });

      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // Post user details to Firestore
        await postDetailsToFirestore(email, role, dep, name, password, regnum);

        // Show success dialog
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("User Created Successful"),
            content: Text(
                "You have successfully create a user '$name' with role '$role'and the password is '$password'"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog

                  // Navigator.pop(context);
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => laplog()));
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      } catch (e) {
        // Show error dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Registration Error"),
            content: Text("An error occurred while registering."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  setState(() {
                    showProgress =
                        false; // Hide the circular progress indicator
                  });
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      } finally {
        setState(() {
          showProgress = false;
        });
      }
    }
  }

  postDetailsToFirestore(String email, String rool, String dep, String name,
      String password, String regnum) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = email;
    userModel.uid = user!.uid;
    userModel.rool = rool;
    userModel.dep = dep;
    userModel.name = name;
    userModel.password = password;
    userModel.regnum = regnum;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    // ignore: use_build_context_synchronously
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => laplog()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/backclg.png"),
                    fit: BoxFit.fill)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Image.asset(
                          'assets/image/graduated.png',
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        const Text(
                          "Let's Create a User 👇",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40))),
                            height: MediaQuery.of(context).size.height,
                            width: 400,
                            child: ListView(children: [
                              Form(
                                key: _formkey,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Column(
                                    children: [
                                      // name
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: TextFormField(
                                            controller: namecontroller,
                                            decoration: InputDecoration(
                                                filled: true,
                                                enabled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .red)),
                                                hintText: 'Name'),
                                            validator: (value) {
                                              if (value!.length == 0) {
                                                return "Name cannot be empty";
                                              }
                                            },
                                            onChanged: (value) {},
                                            keyboardType: TextInputType.name,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: TextFormField(
                                            controller: regnumcontroller,
                                            decoration: InputDecoration(
                                                filled: true,
                                                enabled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .red)),
                                                hintText: 'Register Number'),
                                            validator: (value) {
                                              if (value!.length == 0) {
                                                return "Enter Register number ";
                                              }
                                            },
                                            onChanged: (value) {},
                                            keyboardType: TextInputType.name,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),

                                      //Email
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: TextFormField(
                                            controller: emailController,
                                            decoration: InputDecoration(
                                                filled: true,
                                                enabled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .red)),
                                                hintText: 'Email'),
                                            validator: (value) {
                                              if (value!.length == 0) {
                                                return "Email cannot be empty";
                                              }
                                              if (!RegExp(
                                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                                  .hasMatch(value)) {
                                                return ("Please enter a valid email");
                                              } else {
                                                return null;
                                              }
                                            },
                                            onChanged: (value) {},
                                            keyboardType:
                                                TextInputType.emailAddress,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      //password
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: TextFormField(
                                            obscureText: _isObscure,
                                            controller: passwordController,
                                            decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                    icon: Icon(_isObscure
                                                        ? Icons.visibility_off
                                                        : Icons.visibility),
                                                    onPressed: () {
                                                      setState(() {
                                                        _isObscure =
                                                            !_isObscure;
                                                      });
                                                    }),
                                                filled: true,
                                                enabled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .red)),
                                                hintText: 'Password'),
                                            validator: (value) {
                                              RegExp regex =
                                                  new RegExp(r'^.{6,}$');
                                              if (value!.isEmpty) {
                                                return "Password cannot be empty";
                                              }
                                              if (!regex.hasMatch(value)) {
                                                return ("please enter valid password min. 6 character");
                                              } else {
                                                return null;
                                              }
                                            },
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      //password
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: TextFormField(
                                            obscureText: _isObscure2,
                                            controller: confirmpassController,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                  icon: Icon(_isObscure2
                                                      ? Icons.visibility_off
                                                      : Icons.visibility),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isObscure2 =
                                                          !_isObscure2;
                                                    });
                                                  }),
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Confirm Password',
                                              enabled: true,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 14.0,
                                                      bottom: 8.0,
                                                      top: 15.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        20),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        20),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (confirmpassController.text !=
                                                  passwordController.text) {
                                                return "Password did not match";
                                              } else {
                                                return null;
                                              }
                                            },
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: Center(
                                            child: DropdownButton<String>(
                                              hint: Text(
                                                'Role',
                                                selectionColor: Colors.black,
                                              ),
                                              dropdownColor: Colors.white,
                                              isDense: true,
                                              isExpanded: false,
                                              iconEnabledColor: Colors.black,
                                              focusColor: Colors.blue,
                                              items: roleOptions.map(
                                                  (String dropDownStringItem) {
                                                return DropdownMenuItem<String>(
                                                  value: dropDownStringItem,
                                                  child: Center(
                                                    child: Text(
                                                      dropDownStringItem,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValueSelected) {
                                                setState(() {
                                                  _currentRoleSelected =
                                                      newValueSelected!;
                                                  role = newValueSelected;
                                                });
                                              },
                                              value: _currentRoleSelected,
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      //password
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: Center(
                                            child: DropdownButton<String>(
                                              hint: Text(
                                                'Department',
                                                selectionColor: Colors.black,
                                              ),
                                              dropdownColor: Colors.white,
                                              isDense: true,
                                              isExpanded: false,
                                              iconEnabledColor: Colors.black,
                                              focusColor: Colors.blue,
                                              items: depOptions.map(
                                                  (String dropDownStringItem) {
                                                return DropdownMenuItem<String>(
                                                  value: dropDownStringItem,
                                                  child: Center(
                                                    child: Text(
                                                      dropDownStringItem,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValueSelected) {
                                                setState(() {
                                                  _currentDepSelected =
                                                      newValueSelected!;
                                                  dep = newValueSelected;
                                                });
                                              },
                                              value: _currentDepSelected,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: MaterialButton(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0))),
                                          elevation: 5.0,
                                          height: 40,
                                          onPressed: () {
                                            setState(() {
                                              const CircularProgressIndicator(
                                                color: Colors.white,
                                              );

                                              showProgress = true;
                                            });
                                            signUp(
                                                emailController.text,
                                                passwordController.text,
                                                role,
                                                dep,
                                                namecontroller.text,
                                                regnumcontroller.text);
                                          },
                                          color: Colors.white,
                                          child: const Text(
                                            "Create",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
