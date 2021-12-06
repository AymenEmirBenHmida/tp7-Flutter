import 'package:flutter/material.dart';
import 'package:tp7_crud_authentication/dashboard.dart';
import 'login.dart';

void main() {
  runApp(redirect());
}

class redirect extends StatefulWidget {
  const redirect({Key? key}) : super(key: key);

  @override
  _redirectState createState() => _redirectState();
}

class _redirectState extends State<redirect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Login());
  }
}
