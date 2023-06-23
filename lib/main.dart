// @dart=2.9
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:navarrete/screens/HomePage.dart';
import 'firebase_options.dart';
import 'package:navarrete/screens/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  options:
  DefaultFirebaseOptions.currentPlatform;
  runApp(MyNav());
}

class MyNav extends StatefulWidget {
  @override
  State createState() {
    return _MyNavState();
  }
}

class _MyNavState extends State<MyNav> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DistribuidoraNavarrete',
      home: LoginPage(),
    );
  }
}
