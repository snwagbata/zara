import 'dart:math';

import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  final String id;
  const QuestionPage({Key? key, required this.id}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: const Color(0xff000000),
        backgroundColor: const Color(0x00000000),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  widget.id,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 24.0),
                const Text(
                  "In part 2, lambda is a real eigenvalue. I am little bit "
                  "confused does it imply that x is eigenvector? \nsince I think "
                  "eigenvalues and eigenvectors always appear in pair. "
                  "\nAlthough x seems not to be eigenvector in part 2 according "
                  "to the question in part3.",
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  "1 answer",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 12.0),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 8.0),
                        child: Text(
                          "Suppose we allow x=0 the zero vector to be an "
                          "eigenvector.\n Then Ax=3x is true. So lambda=3 is "
                          "an eigenvalue. \n Also Ax=-x is true. So lambda=-1 "
                          "is an eigenvalue. \n And in fact no matter what "
                          "lambda is, \n Ax=lambda*x is true. So lambda is an "
                          "eigenvalue for **any lambda at all**. \n That’s "
                          "not really a useful definition, so that is why we "
                          "don’t allow the zero vector to be an eigenvector.",
                          style: TextStyle(height: 1.5, fontSize: 16.0),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 7),
                        color: const Color(0x991f4591),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Icon(
                                  Icons.thumb_up,
                                  color: Colors.black,
                                ),
                                Text("" + Random().nextInt(7).toString())
                              ],
                            ),
                            const Text("An instructor endorsed this answer."),
                          ],
                        ),
                      ),
                    ],
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
