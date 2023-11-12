import 'package:get/get.dart';

import 'studentModel.dart';

class StudentController extends GetxController {
  RxList<Rx<Student>> studentList = [
    Student(studentId: 1, studentName: "Andrew", studentGrade: "A").obs,
    Student(studentId: 2, studentName: "Brian", studentGrade: "B").obs,
    Student(studentId: 3, studentName: "Catherine", studentGrade: "C").obs,
  ].obs;

  List<String> newStudentNames = ["Andrew2", "Brian2", "Catherine2"];

  List<String> newStudentGrades = ["A+", "B+", "C+"];

  void updateStudentName(String name, int index) {
    studentList[index].update((value) {
      value?.studentName = name;
    });
  }

  void updateStudentGrade(String grade, int index) {
    studentList[index].update((value) {
      value?.studentGrade = grade;
    });
  }
}
