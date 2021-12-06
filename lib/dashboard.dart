import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tp7_crud_authentication/models/etudiants.dart';

import 'UI/etudiantManage.dart';
import 'UI/formation_manage.dart';
import 'UI/scol_list_dialogue_etudiant.dart';

class Dashboard extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int currentIndex = 0;

  var screen = [EtudiantWidget(), formationWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            selectedFontSize: 15,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  label: 'Etudiant',
                  backgroundColor: Colors.blue),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Formation',
                  backgroundColor: Colors.green)
            ]),
        body: screen[currentIndex]);
  }
}
