import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zara/models/course.dart';
import 'package:zara/screens/course_questions.dart';

class CourseCard extends StatelessWidget {
  final String course;
  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final course =
    //     FirebaseFirestore.instance.collection("courses").withConverter<Course>(
    //           fromFirestore: (snapshot, _) => Course.fromJson(snapshot.data()!),
    //           toFirestore: (course, _) => course.toJson(),
    //         );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => CourseQuestionsPage(id: course),
            ),
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.school),
                  title: Text(course),
                  subtitle: const Text("Fall 2021"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Random().nextInt(10).toString() +
                        ' new updates since you last visited.',
                    style: const TextStyle(
                      color: Color(0xff1f4591),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
