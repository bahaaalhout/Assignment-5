import 'student.dart';

void main() {
  List<Map<String, dynamic>> studentList = [];

  Student student1 = Student(name: "bahaa", grade: 97);
  studentList.add(student1.addStudent());
  Student student2 = Student(name: "Ahmed", grade: 88);
  studentList.add(student2.addStudent());
  Student student3 = Student(name: "Saleh", grade: 66.9);
  studentList.add(student3.addStudent());
  print('---------------before update----------------');
  print(studentList);

  student1.address = '655 street - Gaza Strip';
  student1.email = 'bahaa@gmail.com';
  student2.phone = '0594444444';
  student2.email = 'example@gmail.com';
  student3.phone = '0591111111';
  student3.address = 'Rafah - Gaza';
  // the list after update.
  student1.updateStudentInList(studentList, student1);
  student2.updateStudentInList(studentList, student2);
  student3.updateStudentInList(studentList, student3);
  print('---------------after update----------------');

  print(studentList);
  List searchResult = student1.gradeSearch(studentList, 85.0, true);
  print('--------------search result---------------');
  print(searchResult);
  print('--------------passed names----------------');
  student1.passedStudents(studentList);
}
