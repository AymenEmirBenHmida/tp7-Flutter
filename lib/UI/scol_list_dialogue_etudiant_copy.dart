import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp7_crud_authentication/models/etudiants.dart';
import 'package:tp7_crud_authentication/models/formation.dart';

class ScolListDialog1 {
  final txtNomEtud = TextEditingController();
  final txtPreEtud = TextEditingController();
  final txtNdate = TextEditingController();
  final txtNClass = TextEditingController();
  Widget buildDialog1(BuildContext context, formation list, bool isNew) {
    // dbuse helper =   context.read<dbuse>();
    if (!isNew) {
      txtNomEtud.text = list.nom.toString();
      txtPreEtud.text = list.dure.toString();
      // txtNClass.text = list.codClass.toString();
    }
    return AlertDialog(
        title: Text((isNew) ? 'Formation list' : 'Edit formation list'),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        content: SingleChildScrollView(
          child: Column(children: <Widget>[
            TextField(
                controller: txtNomEtud,
                decoration: InputDecoration(hintText: 'Nom de Formation')),
            TextField(
              controller: txtPreEtud,
              decoration: InputDecoration(hintText: 'duree de Formation'),
            ),
            RaisedButton(
              child: Text('Save formation'),
              onPressed: () {
                list.nom = txtNomEtud.text;
                list.dure = int.parse(txtPreEtud.text);
                var text = (isNew) ? 'formation list' : 'Edit formation list';
                if (text == "Edit formation list")
                  list.update();
                else
                  list.add();
                Navigator.pop(context);
              },
            ),
          ]),
        ));
  }
}
