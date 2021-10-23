import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zara/components/logo.dart';
import 'package:zara/helpers/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _emailFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _email,
      focusNode: _emailFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _emailFocus, _passFocus);
      },
      validator: Validator.email,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Platform.isIOS
              ? Icon(CupertinoIcons.mail,
                  color: Theme.of(context).iconTheme.color)
              : Icon(Icons.email, color: Theme.of(context).iconTheme.color),
        ),
        labelText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      textInputAction: TextInputAction.done,
      focusNode: _passFocus,
      onFieldSubmitted: (value) {
        _passFocus.unfocus();
      },
      controller: _password,
      validator: Validator.password,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Platform.isIOS
              ? Icon(CupertinoIcons.padlock,
                  color: Theme.of(context).iconTheme.color)
              : Icon(Icons.lock, color: Theme.of(context).iconTheme.color),
        ),
        labelText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xfff0f0f0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account?',
            style: TextStyle(fontSize: 16.0),
          ),
          TextButton(
            child: const Text(
              'Sign up',
              style: TextStyle(fontSize: 16.0),
            ),
            onPressed: () => Navigator.pushNamed(context, '/create-account'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Logo(),
                    const SizedBox(height: 38.0),
                    Text(
                      "Login to your Account",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 24.0),
                    email,
                    const SizedBox(height: 18.0),
                    password,
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
                      child: const Text('SIGN IN'),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: const Text('Forgot password?'),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/reset-password'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
