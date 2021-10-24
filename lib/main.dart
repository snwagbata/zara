import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zara/constants/app_themes.dart';
import 'package:zara/screens/home_page.dart';
import 'package:zara/screens/login_page.dart';
import 'package:zara/screens/profile.dart';
import 'package:zara/screens/registeration_page.dart';
import 'package:zara/screens/reset_password.dart';
import 'package:zara/services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        // Provider is used for simple state management throughout the app
        // Will most likely need it for auth and retrieving data from firestore
        ChangeNotifierProvider<Auth>(
          create: (context) => Auth(),
        ),
        StreamProvider(
          create: (context) => Auth().user,
          initialData: null,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, auth, child) {
      return MaterialApp(
        title: 'Zara',
        theme: buildTheme(),
        home: context.watch<User?>() == null
            ? const LoginPage()
            : const HomePage(),
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/reset-password': (context) => const ResetPasswordPage(),
          '/create-account': (context) => const RegisterPage(),
          '/profile-page': (context) => const ProfilePage(),
        },
      );
    });
  }
}
