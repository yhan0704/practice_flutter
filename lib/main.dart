import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practice/second.dart';
import 'package:practice/studentController.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final StudentController _con = Get.put(StudentController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Test Title"),
          ),
          body: ListView.builder(itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  GetX<StudentController>(
                    builder: (_) => Text(
                      "ID: ${_con.studentList()[index]().studentId}, Name: ${_con.studentList()[index]().studentName}, Grade: ${_con.studentList()[index]().studentGrade}",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => _con.updateStudentName(
                            _con.newStudentNames[index], index),
                        child: const Text("이름 변경"),
                      ),
                      TextButton(
                        onPressed: () => _con.updateStudentGrade(
                            _con.newStudentGrades[index], index),
                        child: const Text("성적 변경"),
                      ),
                    ],
                  )
                ],
              ),
            );
          })),
    );
  }
}
