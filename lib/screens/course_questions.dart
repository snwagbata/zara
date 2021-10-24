import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zara/components/logo.dart';
import 'package:zara/models/course.dart';
import 'package:zara/screens/question.dart';

class CourseQuestionsPage extends StatefulWidget {
  final String id;
  const CourseQuestionsPage({Key? key, required this.id}) : super(key: key);

  @override
  _CourseQuestionsPageState createState() => _CourseQuestionsPageState();
}

class _CourseQuestionsPageState extends State<CourseQuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff00457c),
        title: Text(
          widget.id,
          style: const TextStyle(fontSize: 25.0),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    primary: false,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Recent Questions',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.question_answer,
                              color: Colors.black,
                            ),
                            Text("" + Random().nextInt(7).toString())
                          ],
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Exploration 9 part 2",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: const Text(
                          "In part 2, lambda is a real eigenvalue. I am little "
                          "bit confused does it imply that x is eigenvector? "
                          "since I think eigenvalues ...",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionPage(
                                id: "Exploration 9 part 2",
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(thickness: 1.5, color: Color(0xff1f4591)),
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.question_answer,
                              color: Colors.black,
                            ),
                            Text("" + Random().nextInt(7).toString())
                          ],
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Exploration 9 parts 2 and 3 confusion",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: const Text(
                          "For part 2, what is the meaning of \"Vλ = {x : Ax = λx}\"? I can't think of what this means since it doesn't refer to ...",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionPage(
                                id: "Exploration 9 parts 2 and 3 confusion",
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(thickness: 1.5, color: Color(0xff1f4591)),
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.question_answer,
                              color: Colors.black,
                            ),
                            Text("" + Random().nextInt(7).toString())
                          ],
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Exploration 9 Question",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: const Text(
                          "When you say: Vλ = {x : Ax = λx} Does this just refer to the set of all possible eigenvectors of some matrix A?",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionPage(
                                id: "Exploration 9 Question",
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(thickness: 1.5, color: Color(0xff1f4591)),
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.question_answer,
                              color: Colors.black,
                            ),
                            Text("" + Random().nextInt(7).toString())
                          ],
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "exploration part 9 question 1",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: const Text(
                          "for exploration 9, it says for a total of 12 matrices, but what does that mean? are we supposed to show our work for each ...",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionPage(
                                id: "Exploration 9 part 2",
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(thickness: 1.5, color: Color(0xff1f4591)),
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.question_answer,
                              color: Colors.black,
                            ),
                            Text("" + Random().nextInt(7).toString())
                          ],
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Exploration 9 Part 1",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: const Text(
                          "If C and D are similar, then won't they have the same eigenvalues?",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionPage(
                                id: "Exploration 9 part 2",
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(thickness: 1.5, color: Color(0xff1f4591)),
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.question_answer,
                              color: Colors.black,
                            ),
                            Text("" + Random().nextInt(7).toString())
                          ],
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Exploration 9: Restrictions on Matrix Size",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: const Text(
                          "Is there a restriction or requirement for the size of the matrices we choose or is a 2x2 okay?",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionPage(
                                id: "Exploration 9 part 2",
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(thickness: 1.5, color: Color(0xff1f4591)),
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.question_answer,
                              color: Colors.black,
                            ),
                            Text("" + Random().nextInt(7).toString())
                          ],
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Exam 2",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: const Text(
                          "Will exam 2 grades be out before withdrawal deadline on October 30th?",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionPage(
                                id: "Exploration 9 part 2",
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(thickness: 1.5, color: Color(0xff1f4591)),
                      ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.question_answer,
                              color: Colors.black,
                            ),
                            Text("" + Random().nextInt(7).toString())
                          ],
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Midterm 2 Question 4 G",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: const Text(
                          "how would you set up this matrix to find dimension of the subspace? ...",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionPage(
                                id: "Exploration 9 part 2",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
