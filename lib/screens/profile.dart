import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Hero(
                  tag: 'Profile Pic',
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 75.0,
                      child: Icon(
                        Icons.account_circle,
                        size: 150.0,
                        color: Color(0xff00457c),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Somtochukwu Nwagbata",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text("Georgia Institute of Technology",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1),
                const Divider(
                  color: Color(0xff00457c),
                  thickness: 1.5,
                ),
                SizedBox(height: 16.0),
                const Text(
                  "Redeemable Points",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "32",
                                style: Theme.of(context).textTheme.headline5,
                                textScaleFactor: 5,
                              ),
                              Text(
                                "Likes",
                                style: Theme.of(context).textTheme.headline5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          child: Column(children: <Widget>[
                            Text(
                              "5",
                              style: Theme.of(context).textTheme.headline5,
                              textScaleFactor: 5,
                            ),
                            Text(
                              "Endorsements",
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ]),
                        ),
                      ),
                    ),
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
