import 'package:flutter/material.dart';

import 'package:tp7_crud_authentication/models/etudiants.dart';

class ScolListDialog {
  final txtNonClass = TextEditingController();
  final txtNbreEtud = TextEditingController();
  Widget buildDialog(BuildContext context, etudiant list, bool isNew) {
//dbuse helper = dbuse();
    if (!isNew) {
      txtNonClass.text = list.nom.toString();
      txtNbreEtud.text = list.prenom.toString();
    }
    return AlertDialog(
        title: Text((isNew) ? 'Class list' : 'Edit class list'),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        content: SingleChildScrollView(
          child: Column(children: <Widget>[
            TextField(
                controller: txtNonClass,
                decoration: InputDecoration(hintText: 'Class List Name')),
            TextField(
              controller: txtNbreEtud,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Class List numbre of student'),
            ),
            RaisedButton(
              child: Text('Save Class List'),
              onPressed: () {
                list.nom = txtNonClass.text;
                list.prenom = txtNbreEtud.text;
                var text = (isNew) ? 'Class list' : 'Edit class list';
/*if(text =="Edit class list")
context.read<dbuse>().updateClass(ScolList(list.codClass, txtNonClass.text, int.parse(txtNbreEtud.text)));
else
context.read<dbuse>().insertClass(list);*/
                Navigator.pop(context);
              },
            ),
          ]),
        ));
  }
}
