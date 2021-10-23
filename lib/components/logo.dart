import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _imageLogo = 'assets/images/logo.png';
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      _imageLogo = 'assets/images/logo.png';
    }
    return Hero(
      tag: 'App logo',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 60.0,
          child: Image.asset(_imageLogo),
        ),
      ),
    );
  }
}
