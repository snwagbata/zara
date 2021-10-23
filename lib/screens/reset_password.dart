import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zara/components/logo.dart';
import 'package:zara/helpers/validator.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      controller: _email,
      validator: Validator.email,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: kIsWeb
              ? Icon(Icons.email, color: Theme.of(context).iconTheme.color)
              : Platform.isIOS
                  ? Icon(CupertinoIcons.mail,
                      color: Theme.of(context).iconTheme.color)
                  : Icon(Icons.email, color: Theme.of(context).iconTheme.color),
        ),
        labelText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xfff0f0f0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: const Color(0xff000000),
        backgroundColor: const Color(0x00000000),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Logo(),
                  const SizedBox(height: 38.0),
                  email,
                  const SizedBox(height: 38.0),
                  ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => const Color(0xff00457c)),
                        foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                      ),
                      child: const Text('Send Password Reset Email'),
                      onPressed: () {} //_reset(), TODO: implement reset
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _reset() async {
  //   SystemChannels.textInput.invokeMethod('TextInput.hide');
  //   if (_formKey.currentState.validate()) {
  //     setState(() {
  //       _loading = !_loading;
  //     });
  //     AuthService _auth = AuthService();
  //     await _auth.sendPasswordResetEmail(_email.text);

  //     setState(() {
  //       _loading = !_loading;
  //     });

  //     _scaffoldKey.currentState.showSnackBar(SnackBar(
  //       content: Text(
  //           'Check your email and follow the instructions to reset your password.'),
  //     ));
  //   } else {
  //     setState(() {
  //       _autoValidate = true;
  //     });
  //   }
  // }
}
