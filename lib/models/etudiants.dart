import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class etudiant {
  int? id;
  String? nom;
  String? prenom;
  String? datenais;
  String url = "http://172.16.60.207:8080/etudiants";
  etudiant(id, nom, prenom, datenais) {
    this.id = id;
    this.nom = nom;
    this.prenom = prenom;
    this.datenais = datenais;
  }

  factory etudiant.fromJson(dynamic json) {
    print("id :" + json['id'].toString());
    ;
    return etudiant(json['id'], json['nom'], json['prenom'], json['dateNais']);
  }

  delete(int id) async {
    var res = await http.delete(
      Uri.parse(url + '/' + id.toString()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  update() async {
    var res = await http.put(Uri.parse(url + '/' + this.id.toString()),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String?, dynamic>{
          'nom': this.nom,
          'prenom': this.prenom,
          'dateNais': this.datenais
        }));
  }

  add() async {
    var res = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String?, dynamic>{
          'nom': this.nom,
          'prenom': this.prenom,
          'dateNais': DateTime.parse(this.datenais.toString())
              .toUtc()
              .millisecondsSinceEpoch
        }));
    print(res.body);
  }
}
