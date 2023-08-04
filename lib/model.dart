import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? rool;
  String? uid;
  String? dep;
  String? name;
  String? regnum;
  String? password;

// receiving data
  UserModel(
      {this.uid,
      this.email,
      this.rool,
      this.dep,
      this.name,
      this.regnum,
      this.password});
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      rool: map['rool'],
      dep: map['dep'],
      name: map['name'],
      regnum: map['regnum'],
      password: map['password'],
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'rool': rool,
      'dep': dep,
      'name': name,
      'regnum': regnum,
      'password': password,
    };
  }

  // Convert UserModel to Firestore document data
  Map<String, dynamic> toDocument() {
    return {
      'email': email,
      'rool': rool,
      'dep': dep,
      'name': name,
      'regnum': regnum,
      'password': password,
    };
  }
}

class Modal {
  String link, name;
  Modal(this.link, this.name);
}

class PDFModel {
  String? id;
  String? pdfURL;
  String? uploaderName;
  String? dep;
  Timestamp? uploadedAt;
  String? title;
  String? filenamee;

  PDFModel({
    this.id,
    this.pdfURL,
    this.uploaderName,
    this.uploadedAt,
    this.dep,
    this.title,
    this.filenamee,
  });

  PDFModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pdfURL = json['pdfURL'];
    uploaderName = json['uploaderName'];
    uploadedAt = json['uploadedAt'];
    dep = json['dep'];
    title = json['title'];
    filenamee = json['filenamee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pdfURL'] = this.pdfURL;
    data['uploaderName'] = this.uploaderName;
    data['uploadedAt'] = this.uploadedAt;
    data['dep'] = this.dep;
    data['title'] = this.title;
    data['filenamee'] = this.filenamee;

    return data;
  }
}

// // we will create our question model here
// // create a simple class
// class Question {
//   // define how a question will look like
//   // every question will have an Id.
//   final String id;
//   // every question will have a title, it's the question itself.
//   final String title;
//   // every question will have options.
//   final Map<String, bool> options;
//   // options will be like - {'1':true, '2':false} = something like these

//   // create a constructor
//   Question({
//     required this.id,
//     required this.title,
//     required this.options,
//   });

//   // override the toString method to print the questions on console
//   @override
//   String toString() {
//     return 'Question(id: $id, title: $title, options: $options)';
//   }
// }

class leavemodel {
  String? Id;
  String? dep;
  String? name;
  String? year;
  String? regnum;
  String? reason;
  String? request;
  String? accepter;

// receiving data
  leavemodel(
      {this.dep,
      this.name,
      this.year,
      this.regnum,
      this.reason,
      this.request,
      this.Id,
      this.accepter});

  leavemodel.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    dep = json['dep'];
    name = json['name'];
    year = json['year'];
    regnum = json['regnum'];
    reason = json['reason'];
    request = json['request'];
    accepter = json['accepter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['dep'] = this.dep;
    data['name'] = this.name;
    data['year'] = this.year;
    data['regnum'] = this.regnum;
    data['reason'] = this.reason;
    data['request'] = this.request;
    data['accepter'] = this.accepter;

    return data;
  }
}

//////leave/////////////////

class TestModel {
  String? Id;
  String? dep;
  String? upname;
  String? year;
  String? regnum;
  String? sub;
  String? question;

// receiving data
  TestModel({
    this.Id,
    this.dep,
    this.upname,
    this.year,
    this.regnum,
    this.sub,
    this.question,
  });

  TestModel.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    dep = json['dep'];
    upname = json['upname'];
    year = json['year'];
    regnum = json['regnum'];
    sub = json['sub'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['dep'] = this.dep;
    data['upname'] = this.upname;
    data['year'] = this.year;
    data['regnum'] = this.regnum;
    data['sub'] = this.sub;
    data['question'] = this.question;

    return data;
  }
}

////// attendance/////

class Attendmodel {
  String? uid;
  String? dep;
  String? name;
  String? regnum;
  String? Ttclass;
  String? Atclass;
  String? perclass;
  String? filenamee;

// receiving data
  Attendmodel(
      {this.uid,
      this.dep,
      this.name,
      this.regnum,
      this.Ttclass,
      this.Atclass,
      this.perclass,
      this.filenamee});

  factory Attendmodel.fromMap(map) {
    return Attendmodel(
      uid: map['uid'],
      dep: map['dep'],
      name: map['name'],
      regnum: map['regnum'],
      Ttclass: map['Ttclass'],
      Atclass: map['Atclass'],
      perclass: map['perclass'],
      filenamee: map['filenamee'],
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'dep': dep,
      'name': name,
      'regnum': regnum,
      'Ttclass': Ttclass,
      'Atclass': Atclass,
      'perclass': perclass,
      'filenamee': filenamee,
    };
  }

  // Convert UserModel to Firestore document data
  Map<String, dynamic> toDocument() {
    return {
      'dep': dep,
      'name': name,
      'regnum': regnum,
      'Ttclass': Ttclass,
      'Atclass': Atclass,
      'perclass': perclass,
      'filenamee': filenamee,
    };
  }

  static fromJson(Map<String, dynamic> data) {}
}

class Attmodel {
  String? id;
  String? regnum;
  String? name;
  String? dep;
  String? Ttclass;
  String? Atclass;
  String? perclass;
  String? filenamee;

  Attmodel(
      {this.id,
      this.regnum,
      this.name,
      this.Ttclass,
      this.dep,
      this.Atclass,
      this.perclass,
      this.filenamee});

  Attmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regnum = json['regnum'];
    name = json['name'];
    Ttclass = json['Ttclass'];
    dep = json['dep'];
    Atclass = json['Atclass'];
    perclass = json['perclass'];
    filenamee = json['filenamee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['regnum'] = this.regnum;
    data['name'] = this.name;
    data['Ttclass'] = this.Ttclass;
    data['dep'] = this.dep;
    data['Atclass'] = this.Atclass;
    data['perclass'] = this.perclass;
    data['filenamee'] = this.filenamee;

    return data;
  }
}

///////////feesmodel/////////////////

class feesmodel {
  String? uid;
  String? dep;
  String? name;
  String? regnum;
  String? Tusfees;
  String? Examfees;
  String? busfees;
  String? recordfees;
  String? oldfee;
  String? otherfee;
  String? totelfee;
  String? filename;

// receiving data
  feesmodel(
      {this.uid,
      this.dep,
      this.name,
      this.regnum,
      this.Tusfees,
      this.Examfees,
      this.busfees,
      this.recordfees,
      this.oldfee,
      this.otherfee,
      this.totelfee,
      this.filename});

  factory feesmodel.fromMap(map) {
    return feesmodel(
      uid: map['uid'],
      dep: map['dep'],
      name: map['name'],
      regnum: map['regnum'],
      Tusfees: map['Tusfees'],
      Examfees: map['Examfees'],
      busfees: map['busfees'],
      recordfees: map['recordfees'],
      oldfee: map['oldfee'],
      otherfee: map['otherfee'],
      totelfee: map['totelfee'],
      filename: map['filename'],
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'dep': dep,
      'name': name,
      'regnum': regnum,
      'Tusfees': Tusfees,
      'Examfees': Examfees,
      'busfees': busfees,
      'recordfees': recordfees,
      'oldfee': oldfee,
      'otherfee': otherfee,
      'totelfee': totelfee,
      'filename': filename,
    };
  }

  // Convert UserModel to Firestore document data
  Map<String, dynamic> toDocument() {
    return {
      'dep': dep,
      'name': name,
      'regnum': regnum,
      'Tusfees': Tusfees,
      'Examfees': Examfees,
      'busfees': busfees,
      'recordfees': recordfees,
      'oldfee': oldfee,
      'otherfee': otherfee,
      'totelfee': totelfee,
      'filename': filename,
    };
  }

  static fromJson(Map<String, dynamic> data) {}
}

class FeeModel {
  String? id;
  String? regnum;
  String? name;
  String? dep;
  String? Tusfees;
  String? Examfees;
  String? busfees;
  String? recordfees;
  String? oldfee;
  String? otherfee;
  String? totelfee;
  String? filename;

  FeeModel(
      {this.id,
      this.regnum,
      this.name,
      this.Tusfees,
      this.dep,
      this.Examfees,
      this.busfees,
      this.recordfees,
      this.oldfee,
      this.otherfee,
      this.totelfee,
      this.filename});

  FeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regnum = json['regnum'];
    name = json['name'];
    Tusfees = json['Tusfees'];
    dep = json['dep'];
    Examfees = json['Examfees'];
    busfees = json['busfees'];
    recordfees = json['recordfees'];
    oldfee = json['oldfee'];
    otherfee = json['otherfee'];
    totelfee = json['totelfee'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['regnum'] = this.regnum;
    data['name'] = this.name;
    data['Tusfees'] = this.Tusfees;
    data['dep'] = this.dep;
    data['Examfees'] = this.Examfees;
    data['busfees'] = this.busfees;
    data['recordfees'] = this.recordfees;
    data['oldfee'] = this.oldfee;
    data['otherfee'] = this.otherfee;
    data['totelfee'] = this.totelfee;
    data['filename'] = this.filename;

    return data;
  }
}



// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   String? email;
//   String? rool;
//   String? uid;
//   String? dep;
//   String? name;
//   String? regnum;
//   String? password;

// // receiving data
//   UserModel(
//       {this.uid,
//       this.email,
//       this.rool,
//       this.dep,
//       this.name,
//       this.regnum,
//       this.password});
//   factory UserModel.fromMap(map) {
//     return UserModel(
//       uid: map['uid'],
//       email: map['email'],
//       rool: map['rool'],
//       dep: map['dep'],
//       name: map['name'],
//       regnum: map['regnum'],
//       password: map['password'],
//     );
//   }
// // sending data
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'email': email,
//       'rool': rool,
//       'dep': dep,
//       'name': name,
//       'regnum': regnum,
//       'password': password,
//     };
//   }

//   // Convert UserModel to Firestore document data
//   Map<String, dynamic> toDocument() {
//     return {
//       'email': email,
//       'rool': rool,
//       'dep': dep,
//       'name': name,
//       'regnum': regnum,
//       'password': password,
//     };
//   }
// }

// class Modal {
//   String link, name;
//   Modal(this.link, this.name);
// }

// class PDFModel {
//   String? id;
//   String? pdfURL;
//   String? uploaderName;
//   String? dep;
//   Timestamp? uploadedAt;
//   String? title;

//   PDFModel({
//     this.id,
//     this.pdfURL,
//     this.uploaderName,
//     this.uploadedAt,
//     this.dep,
//     this.title,
//   });

//   PDFModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     pdfURL = json['pdfURL'];
//     uploaderName = json['uploaderName'];
//     uploadedAt = json['uploadedAt'];
//     dep = json['dep'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['pdfURL'] = this.pdfURL;
//     data['uploaderName'] = this.uploaderName;
//     data['uploadedAt'] = this.uploadedAt;
//     data['dep'] = this.dep;
//     data['title'] = this.title;

//     return data;
//   }
// }

// // // we will create our question model here
// // // create a simple class
// // class Question {
// //   // define how a question will look like
// //   // every question will have an Id.
// //   final String id;
// //   // every question will have a title, it's the question itself.
// //   final String title;
// //   // every question will have options.
// //   final Map<String, bool> options;
// //   // options will be like - {'1':true, '2':false} = something like these

// //   // create a constructor
// //   Question({
// //     required this.id,
// //     required this.title,
// //     required this.options,
// //   });

// //   // override the toString method to print the questions on console
// //   @override
// //   String toString() {
// //     return 'Question(id: $id, title: $title, options: $options)';
// //   }
// // }

// class leavemodel {
//   String? Id;
//   String? dep;
//   String? name;
//   String? year;
//   String? regnum;
//   String? reason;
//   String? request;

// // receiving data
//   leavemodel(
//       {this.dep,
//       this.name,
//       this.year,
//       this.regnum,
//       this.reason,
//       this.request,
//       this.Id});

//   leavemodel.fromJson(Map<String, dynamic> json) {
//     Id = json['Id'];
//     dep = json['dep'];
//     name = json['name'];
//     year = json['year'];
//     regnum = json['regnum'];
//     reason = json['reason'];
//     request = json['request'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.Id;
//     data['dep'] = this.dep;
//     data['name'] = this.name;
//     data['year'] = this.year;
//     data['regnum'] = this.regnum;
//     data['reason'] = this.reason;
//     data['request'] = this.request;

//     return data;
//   }
// }

// //////leave/////////////////

// class TestModel {
//   String? Id;
//   String? dep;
//   String? upname;
//   String? year;
//   String? regnum;
//   String? sub;
//   String? question;

// // receiving data
//   TestModel({
//     this.Id,
//     this.dep,
//     this.upname,
//     this.year,
//     this.regnum,
//     this.sub,
//     this.question,
//   });

//   TestModel.fromJson(Map<String, dynamic> json) {
//     Id = json['Id'];
//     dep = json['dep'];
//     upname = json['upname'];
//     year = json['year'];
//     regnum = json['regnum'];
//     sub = json['sub'];
//     question = json['question'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.Id;
//     data['dep'] = this.dep;
//     data['upname'] = this.upname;
//     data['year'] = this.year;
//     data['regnum'] = this.regnum;
//     data['sub'] = this.sub;
//     data['question'] = this.question;

//     return data;
//   }
// }

// ////// attendance/////

// class Attendmodel {
//   String? uid;
//   String? dep;
//   String? name;
//   String? regnum;
//   String? Ttclass;
//   String? Atclass;
//   String? perclass;

// // receiving data
//   Attendmodel(
//       {this.uid,
//       this.dep,
//       this.name,
//       this.regnum,
//       this.Ttclass,
//       this.Atclass,
//       this.perclass});

//   factory Attendmodel.fromMap(map) {
//     return Attendmodel(
//       uid: map['uid'],
//       dep: map['dep'],
//       name: map['name'],
//       regnum: map['regnum'],
//       Ttclass: map['Ttclass'],
//       Atclass: map['Atclass'],
//       perclass: map['perclass'],
//     );
//   }
// // sending data
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'dep': dep,
//       'name': name,
//       'regnum': regnum,
//       'Ttclass': Ttclass,
//       'Atclass': Atclass,
//       'perclass': perclass,
//     };
//   }

//   // Convert UserModel to Firestore document data
//   Map<String, dynamic> toDocument() {
//     return {
//       'dep': dep,
//       'name': name,
//       'regnum': regnum,
//       'Ttclass': Ttclass,
//       'Atclass': Atclass,
//       'perclass': perclass,
//     };
//   }

//   static fromJson(Map<String, dynamic> data) {}
// }

// class Attmodel {
//   String? id;
//   String? regnum;
//   String? name;
//   String? dep;
//   String? Ttclass;
//   String? Atclass;
//   String? perclass;

//   Attmodel({
//     this.id,
//     this.regnum,
//     this.name,
//     this.Ttclass,
//     this.dep,
//     this.Atclass,
//     this.perclass,
//   });

//   Attmodel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     regnum = json['regnum'];
//     name = json['name'];
//     Ttclass = json['Ttclass'];
//     dep = json['dep'];
//     Atclass = json['Atclass'];
//     perclass = json['perclass'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['regnum'] = this.regnum;
//     data['name'] = this.name;
//     data['Ttclass'] = this.Ttclass;
//     data['dep'] = this.dep;
//     data['Atclass'] = this.Atclass;
//     data['perclass'] = this.perclass;

//     return data;
//   }
// }

// ///////////feesmodel/////////////////

// class feesmodel {
//   String? uid;
//   String? dep;
//   String? name;
//   String? regnum;
//   String? Tusfees;
//   String? Examfees;
//   String? busfees;
//   String? recordfees;
//   String? oldfee;
//   String? otherfee;
//   String? totelfee;

// // receiving data
//   feesmodel({
//     this.uid,
//     this.dep,
//     this.name,
//     this.regnum,
//     this.Tusfees,
//     this.Examfees,
//     this.busfees,
//     this.recordfees,
//     this.oldfee,
//     this.otherfee,
//     this.totelfee,
//   });

//   factory feesmodel.fromMap(map) {
//     return feesmodel(
//       uid: map['uid'],
//       dep: map['dep'],
//       name: map['name'],
//       regnum: map['regnum'],
//       Tusfees: map['Tusfees'],
//       Examfees: map['Examfees'],
//       busfees: map['busfees'],
//       recordfees: map['recordfees'],
//       oldfee: map['oldfee'],
//       otherfee: map['otherfee'],
//       totelfee: map['totelfee'],
//     );
//   }
// // sending data
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'dep': dep,
//       'name': name,
//       'regnum': regnum,
//       'Tusfees': Tusfees,
//       'Examfees': Examfees,
//       'busfees': busfees,
//       'recordfees': recordfees,
//       'oldfee': oldfee,
//       'otherfee': otherfee,
//       'totelfee': totelfee,
//     };
//   }

//   // Convert UserModel to Firestore document data
//   Map<String, dynamic> toDocument() {
//     return {
//       'dep': dep,
//       'name': name,
//       'regnum': regnum,
//       'Tusfees': Tusfees,
//       'Examfees': Examfees,
//       'busfees': busfees,
//       'recordfees': recordfees,
//       'oldfee': oldfee,
//       'otherfee': otherfee,
//       'totelfee': totelfee,
//     };
//   }

//   static fromJson(Map<String, dynamic> data) {}
// }

// class FeeModel {
//   String? id;
//   String? regnum;
//   String? name;
//   String? dep;
//   String? Tusfees;
//   String? Examfees;
//   String? busfees;
//   String? recordfees;
//   String? oldfee;
//   String? otherfee;
//   String? totelfee;

//   FeeModel({
//     this.id,
//     this.regnum,
//     this.name,
//     this.Tusfees,
//     this.dep,
//     this.Examfees,
//     this.busfees,
//     this.recordfees,
//     this.oldfee,
//     this.otherfee,
//     this.totelfee,
//   });

//   FeeModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     regnum = json['regnum'];
//     name = json['name'];
//     Tusfees = json['Tusfees'];
//     dep = json['dep'];
//     Examfees = json['Examfees'];
//     busfees = json['busfees'];
//     recordfees = json['recordfees'];
//     oldfee = json['oldfee'];
//     otherfee = json['otherfee'];
//     totelfee = json['totelfee'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['regnum'] = this.regnum;
//     data['name'] = this.name;
//     data['Tusfees'] = this.Tusfees;
//     data['dep'] = this.dep;
//     data['Examfees'] = this.Examfees;
//     data['busfees'] = this.busfees;
//     data['recordfees'] = this.recordfees;
//     data['oldfee'] = this.oldfee;
//     data['otherfee'] = this.otherfee;
//     data['totelfee'] = this.totelfee;

//     return data;
//   }
// }
