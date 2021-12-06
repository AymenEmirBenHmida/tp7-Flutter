import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp7_crud_authentication/models/etudiants.dart';

class ScolListDialog1 {
  final txtNomEtud = TextEditingController();
  final txtPreEtud = TextEditingController();
  final txtNdate = TextEditingController();
  final txtNClass = TextEditingController();
  Widget buildDialog1(BuildContext context, etudiant list, bool isNew) {
    // dbuse helper =   context.read<dbuse>();
    if (!isNew) {
      txtNomEtud.text = list.nom.toString();
      txtPreEtud.text = list.prenom.toString();
      txtNdate.text = list.datenais.toString();
      // txtNClass.text = list.codClass.toString();
    }
    return AlertDialog(
        title: Text((isNew) ? 'Etudiant list' : 'Edit Etudiant list'),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        content: SingleChildScrollView(
          child: Column(children: <Widget>[
            TextField(
                controller: txtNomEtud,
                decoration: InputDecoration(hintText: 'ETUDIANT List Name')),
            TextField(
              controller: txtPreEtud,
              decoration:
                  InputDecoration(hintText: 'Class List prenom of student'),
            ),
            TextField(
              controller: txtNdate,
              readOnly: true,
              decoration: InputDecoration(
                  hintText: 'Class List date naissance of student'),
              onTap: () async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1960),
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  txtNdate.text = date.toString();
                }
              },
            ),
            RaisedButton(
              child: Text('Save Etudiant'),
              onPressed: () {
                list.datenais = txtNdate.text;
                list.nom = txtNomEtud.text;
                list.prenom = txtPreEtud.text;
                var text = (isNew) ? 'Etudiant list' : 'Edit Etudiant list';
                if (text == "Edit Etudiant list")
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
