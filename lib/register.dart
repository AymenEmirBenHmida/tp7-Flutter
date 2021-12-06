import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tp7_crud_authentication/dashboard.dart';

import 'User.dart';
import 'package:http/http.dart' as http;

class register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<register> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://172.16.60.207:8080/register";
  bool login = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void _validateFields() {
    if (_formKey.currentState!.validate()) {
      save();
      // scaffoldKey.currentState!.showSnackBar(validSnackBar);
      //ScaffoldMessenger(child: scaffold());
    } else {
      print("form  not accepted");
    }
  }

  Future save() async {
    var res = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, String>{"email": user.email, "password": user.password}),
    );
    print("entered save method");
    print("email" + user.email + " password: " + user.password);
    print(res.body);

    if (res.body != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8.0,
          child: Container(
            height: 350,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        String pattern =
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$";
                        RegExp regex = RegExp(pattern);

                        if (!regex.hasMatch(value.toString()))
                          return 'Enter a valid email address';
                        else {
                          user.setEmail(value.toString());
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Your email...",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter strong password:(";
                        }
                        user.setPassword(value.toString());
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Your password...",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: _validateFields,
                      child: Container(
                        height: 50.0,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
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

/////////////////////////////////////////
///
///
///






 

 