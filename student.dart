class Student {
  static int _idCounter = 0;
  final int _id;
  String _name;
  double _grade;
  String _email;
  String _address;
  String _phone;

  Student({
    required String name,
    required double grade,
    String address = 'no address',
    String email = 'no email',
    String phone = 'no phone',
  }) : _name = name,
       _grade = grade,
       _address = address,
       _email = email,
       _phone = phone,
       _id = ++_idCounter;

  set grade(double newGrade) {
    if (newGrade >= 0 && newGrade <= 100) {
      _grade = newGrade;
    } else {
      print('Invalid Grade');
    }
  }

  double get grade => _grade;

  set name(String newName) {
    if (newName.length > 2) {
      _name = newName;
    } else {
      print('invalid name');
    }
  }

  String get name => _name;

  set email(String newEmail) {
    if (newEmail.contains('@')) {
      _email = newEmail;
    } else {
      print('invalid Email');
    }
  }

  String get email => _email;

  set address(String newAddress) {
    if (newAddress.length > 5) {
      _address = newAddress;
    } else {
      print('Invalid Address');
    }
  }

  String get address => _address;

  set phone(String newPhone) {
    if (newPhone.length == 10) {
      _phone = newPhone;
    } else {
      print('Invalid Phone');
    }
  }

  String get phone => _phone;
  void intreduce() {
    print('$_name');
  }

  // add new student to the list.
  Map<String, dynamic> addStudent() {
    return {
      "id": _id,
      "name": _name,
      "grade": _grade,
      "email": _email,
      "address": _address,
      "phone": _phone,
    };
  }

  List gradeSearch(List students, double grade, bool isGreater) {
    List newList = [];
    for (Map student in students) {
      if (isGreater && student['grade'] > grade) {
        newList.add(student);
      } else if (student['grade'] < grade && !isGreater) {
        newList.add(student);
      }
    }

    return newList;
  }

  // to make sure there is no repeated data that has same unique id.
  void updateStudentInList(
    List<Map<String, dynamic>> studentList,
    Student student,
  ) {
    int index = studentList.indexWhere((e) => e['id'] == student._id);
    if (index != -1) {
      studentList[index] = student.addStudent();
    }
  }

  void passedStudents(List<Map<String, dynamic>> studentList) {
    for (var student in studentList) {
      if (student['grade'] >= 60) {
        student['isPass'] = true;
      } else {
        student['isPass'] = false;
      }
    }
    print('The passed student name : ');
    for (var element in studentList) {
      if (element['isPass']) print(element['name']);
    }
  }

  String toString() {
    return '''
Student ID: $_id
Name: $_name
Grade: $_grade
Email: $_email
Address: $_address
Phone: $_phone
''';
  }
}
