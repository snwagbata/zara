import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:zara/components/course_card.dart';
import 'package:zara/services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  @override
  Widget build(BuildContext context) {
    Auth _auth = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff00457c),
        title: const Text(
          "Courses",
          style: TextStyle(fontSize: 25.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => Navigator.pushNamed(context, '/profile-page'),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Good " + greeting(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  primary: false,
                  children: const [
                    // if (user != null)
                    //   for (int i = 0; i < user.courses.length; i++)

                    CourseCard(course: "Linear Algebra"),
                    CourseCard(course: "Data Structures and Algorithm"),
                    CourseCard(course: "Chemistry"),
                    CourseCard(course: "United States History"),
                    CourseCard(course: "Intro to Matlab"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
