import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zara/components/logo.dart';
import 'package:zara/helpers/validator.dart';
import 'package:zara/services/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Auth _auth = Auth();
  late bool _passwordVisible;

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _passwordVisible = true;
    });
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _emailFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = TextFormField(
      autofocus: false,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      controller: _name,
      validator: Validator.name,
      focusNode: _nameFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _nameFocus, _emailFocus);
      },
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.person,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        labelText: 'Name',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );

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
          child: kIsWeb
              ? Icon(Icons.email, color: Theme.of(context).iconTheme.color)
              : Platform.isIOS
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
      obscureText: _passwordVisible,
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
          child: kIsWeb
              ? Icon(Icons.lock, color: Theme.of(context).iconTheme.color)
              : Platform.isIOS
                  ? Icon(CupertinoIcons.padlock,
                      color: Theme.of(context).iconTheme.color)
                  : Icon(Icons.lock, color: Theme.of(context).iconTheme.color),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () => setState(() => _passwordVisible = !_passwordVisible),
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
        foregroundColor: const Color(0xff000000),
        backgroundColor: const Color(0x00000000),
        elevation: 0,
      ),
      body: Padding(
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
                    "Create your Account",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 24.0),
                  name,
                  const SizedBox(height: 18.0),
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
                    child: const Text('SIGN UP'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        createUser();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createUser() async {
    dynamic result = await _auth.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text, name: _name.text);
    if (result == null) {
      print("Email is not valid");
    } else {
      print(result.toString());
    }
  }
}
